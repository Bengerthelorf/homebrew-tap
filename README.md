# Bengerthelorf Homebrew tap

Install command-line tools:

```sh
brew install bengerthelorf/tap/bcmr
brew install bengerthelorf/tap/pikpaktui
```

Install macOS apps:

```sh
brew install --cask bengerthelorf/tap/iconchanger
brew install --cask bengerthelorf/tap/claudit
```

| Package | Project | Supported platforms |
| --- | --- | --- |
| `bcmr` | [File operations](https://github.com/Bengerthelorf/bcmr) | macOS and Linux, ARM64 and x86-64 |
| `pikpaktui` | [PikPak client](https://github.com/Bengerthelorf/pikpaktui) | macOS and Linux, ARM64 and x86-64 |
| `iconchanger` | [App and folder icons](https://github.com/Bengerthelorf/macIconChanger) | macOS 13 Ventura or later |
| `claudit` | [Claude API usage](https://github.com/Bengerthelorf/Claudit) | macOS 15 Sequoia or later |

Run `brew update` followed by `brew upgrade` to receive updates.

## Reporting problems

Report Homebrew installation, checksum, dependency, and upgrade issues in [this tap](https://github.com/Bengerthelorf/homebrew-tap/issues). Include the package/version, macOS or Linux version, CPU architecture, `brew --version`, the command, and its complete error output. Report application behavior in the corresponding project above.

## Maintenance

This tap owns the complete formula and cask definitions, including installation, shell completions, compatibility requirements, and `zap` paths. Upstream releases must not regenerate these files from separate templates.

Each upstream release workflow clones this tap and runs:

```sh
bash scripts/publish-update.sh PACKAGE vVERSION
```

The publisher requires `gh`, `curl`, Python 3.9 or later, and `GH_TOKEN` with **Contents** and **Pull requests** write permission for this tap. The token must be a PAT or GitHub App token that triggers PR workflows; this tap has no publishing secrets. Auto-merge must be enabled and the `Homebrew checks` status must be required on `main`.

The updater accepts only the latest published stable release. It downloads every supported artifact, computes SHA-256, compares GitHub's digest when available, and changes only `version`, `url`, and `sha256`. Unexpected file structure, incomplete assets, superseded releases, prereleases, or changed artifacts at an existing version fail before writing. Intentional replacements at the same version require manual review.

The publisher opens or updates a release PR, enables auto-merge, and waits up to 30 minutes for its exact head to merge. A closed PR or timeout fails the upstream job; a published GitHub release alone does not mean the Homebrew update succeeded. Different packages use separate branches. Rerunning a release can refresh its branch with an explicit Git lease.

CI runs on PRs, pushes, manual dispatches, and every Monday. It checks Homebrew style/audit, installs and tests both Formulae on macOS and Linux, audits the downloaded casks on macOS, and exercises updater failure cases. Only stable releases enter this tap.

For a local metadata check without publishing:

```sh
python3 scripts/update-release.py PACKAGE vVERSION --check
python3 -m unittest discover -s tests -v
brew style bengerthelorf/tap
brew audit --tap=bengerthelorf/tap
```

When multiple people submit the same fix, merge one current, verified patch; credit and incorporate useful changes from the others; then close superseded PRs with links to the merged work. Evaluate automated review suggestions against Homebrew's documentation and actual checks.
