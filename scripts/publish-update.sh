#!/usr/bin/env bash
set -euo pipefail

package=${1:?usage: publish-update.sh PACKAGE vVERSION}
tag=${2:?usage: publish-update.sh PACKAGE vVERSION}
case "${package}" in
  bcmr | pikpaktui) file="Formula/${package}.rb" ;;
  iconchanger | claudit) file="Casks/${package}.rb" ;;
  *)
    echo "Unsupported package: ${package}" >&2
    exit 1
    ;;
esac
[[ "${tag}" =~ ^v[0-9]+\.[0-9]+\.[0-9]+(-[0-9]+)?$ ]] || {
  echo "Expected a stable release tag" >&2
  exit 1
}
script_dir=$(dirname "$0")
cd "${script_dir}/.."
status=$(git status --porcelain)
[[ -z "${status}" ]] || {
  echo "Run the publisher in a clean tap checkout" >&2
  exit 1
}
python3 scripts/update-release.py "${package}" "${tag}"
if git diff --quiet -- "${file}"
then
  exit 0
fi

branch="releases/${package}-${tag}"
git config user.name "GitHub Actions"
git config user.email "actions@github.com"
git switch -c "${branch}"
git add -- "${file}"
git commit -m "Update ${package} to ${tag}"
head=$(git rev-parse HEAD)
previous=$(git ls-remote origin "refs/heads/${branch}" | cut -f 1)
git push "--force-with-lease=refs/heads/${branch}:${previous}" origin "HEAD:refs/heads/${branch}"

repo=Bengerthelorf/homebrew-tap
pr=$(gh pr list --repo "${repo}" --base main --head "${branch}" --state open --json url --jq '.[0].url // empty')
if [[ -z "${pr}" ]]
then
  body=$(mktemp)
  trap 'rm -f "${body}"' EXIT
  cat >"${body}" <<EOF
Updates ${package} to ${tag} from its latest published stable release.

Only version, download URLs, and SHA-256 values change. The updater downloaded and hashed every supported release asset, and checked GitHub's asset digests when available. Installation logic, compatibility requirements, and user-data cleanup remain owned by this tap.

Homebrew CI must pass before auto-merge. The upstream release job waits for this PR to merge before reporting the tap update as complete.
EOF
  pr=$(gh pr create --repo "${repo}" --base main --head "${branch}" \
    --title "Update ${package} to ${tag}" --body-file "${body}")
fi
gh pr merge "${pr}" --repo "${repo}" --auto --squash --match-head-commit "${head}"

deadline=$((SECONDS + 1800))
while ((SECONDS < deadline))
do
  state=$(gh pr view "${pr}" --repo "${repo}" --json state,headRefOid --jq '[.state,.headRefOid] | @tsv')
  [[ "${state}" == *$'\t'"${head}" ]] || {
    echo "PR head changed while waiting: ${pr}" >&2
    exit 1
  }
  case "${state}" in
    MERGED$'\t'*)
      echo "Published ${package} ${tag} through ${pr}"
      exit 0
      ;;
    CLOSED$'\t'*)
      echo "Update PR was closed without merging: ${pr}" >&2
      exit 1
      ;;
    OPEN$'\t'*) ;;
    *)
      echo "Unexpected PR state: ${state}" >&2
      exit 1
      ;;
  esac
  sleep 15
done
echo "Timed out waiting for Homebrew CI and merge: ${pr}" >&2
exit 1
