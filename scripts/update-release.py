#!/usr/bin/env python3
"""Update release metadata while preserving the tap's hand-maintained Ruby DSL."""

import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
PACKAGES = {
    "bcmr": ("bcmr", "Formula/bcmr.rb"),
    "pikpaktui": ("pikpaktui", "Formula/pikpaktui.rb"),
    "iconchanger": ("macIconChanger", "Casks/iconchanger.rb"),
    "claudit": ("Claudit", "Casks/claudit.rb"),
}
TAG = re.compile(r"v[0-9]+\.[0-9]+\.[0-9]+(?:-[0-9]+)?\Z")
URL = re.compile(r'^([ \t]*)url "([^"\n]+)"$', re.MULTILINE)
VERSION = re.compile(r'^  version "[^"\n]+"$', re.MULTILINE)
SHA256 = re.compile(r'^([ \t]*)sha256 "[0-9a-f]{64}"$', re.MULTILINE)


def api(endpoint):
    return json.loads(subprocess.check_output(["gh", "api", endpoint], text=True))


def checksum(url):
    with tempfile.TemporaryDirectory(prefix="tap-release-") as directory:
        artifact = Path(directory) / "artifact"
        subprocess.run([
            "curl", "--fail", "--location", "--silent", "--show-error",
            "--retry", "3", "--max-time", "300", "--output", str(artifact), url,
        ], check=True)
        with artifact.open("rb") as handle:
            digest = hashlib.sha256()
            for chunk in iter(lambda: handle.read(1024 * 1024), b""):
                digest.update(chunk)
            return digest.hexdigest()


def release_metadata(package, tag):
    if package not in PACKAGES or not TAG.fullmatch(tag):
        raise ValueError("expected a supported package and stable tag such as v1.2.3")
    repo, _ = PACKAGES[package]
    endpoint = f"repos/Bengerthelorf/{repo}/releases"
    release = api(f"{endpoint}/tags/{tag}")
    if release.get("draft") or release.get("prerelease") or release["tag_name"] != tag:
        raise ValueError("only published stable releases can update this tap")
    if api(f"{endpoint}/latest")["id"] != release["id"]:
        raise ValueError("refusing a superseded release; use the latest stable release")
    if package in ("bcmr", "pikpaktui"):
        names = [f"{package}-{target}.tar.gz" for target in (
            "aarch64-macos", "x86_64-macos", "aarch64-linux", "x86_64-linux",
        )]
    else:
        names = ["IconChanger.dmg" if package == "iconchanger" else "Claudit.dmg"]
    assets = release["assets"]
    result = {}
    for name in names:
        matches = [asset for asset in assets if asset["name"] == name]
        if len(matches) != 1:
            raise ValueError(f"expected exactly one published asset: {name}")
        asset = matches[0]
        url = f"https://github.com/Bengerthelorf/{repo}/releases/download/{tag}/{name}"
        if asset["browser_download_url"] != url or asset.get("state") != "uploaded":
            raise ValueError(f"unexpected or incomplete release asset: {name}")
        digest = checksum(url)
        if asset.get("digest") and asset["digest"] != f"sha256:{digest}":
            raise ValueError(f"download checksum disagrees with GitHub for {name}")
        result[name] = (url, digest)
    return result


def render(source, package, tag, assets):
    """Reject unexpected structure instead of replacing an entire formula/cask."""
    repo, path = PACKAGES[package]
    prefix = f"https://github.com/Bengerthelorf/{repo}/releases/download/"
    urls = list(URL.finditer(source))
    if len(urls) != len(assets) or len(VERSION.findall(source)) != 1:
        raise ValueError(f"unexpected release metadata structure in {path}")
    seen = []
    for match in urls:
        old_url = match[2]
        name = old_url.rsplit("/", 1)[-1]
        if not old_url.startswith(prefix) or name not in assets or name in seen:
            raise ValueError(f"unexpected or duplicate asset URL in {path}: {old_url}")
        seen.append(name)
    if len(SHA256.findall(source)) != len(assets):
        raise ValueError(f"unexpected checksum structure in {path}")
    if path.startswith("Formula/"):
        pair = re.compile(r'^([ \t]*)url "([^"\n]+)"\n\1sha256 "[0-9a-f]{64}"$', re.MULTILINE)
        if len(list(pair.finditer(source))) != len(assets):
            raise ValueError(f"URL/checksum pairs have changed in {path}")
        def replace(match):
            url, digest = assets[match[2].rsplit("/", 1)[-1]]
            return f'{match[1]}url "{url}"\n{match[1]}sha256 "{digest}"'
        result = pair.sub(replace, source)
    else:
        url, digest = next(iter(assets.values()))
        result = URL.sub(lambda m: f'{m[1]}url "{url}"', source)
        result = SHA256.sub(lambda m: f'{m[1]}sha256 "{digest}"', result)
    return VERSION.sub(lambda _: f'  version "{tag[1:]}"', result)


def update(package, tag, root=ROOT, check=False):
    assets = release_metadata(package, tag)
    path = root / PACKAGES[package][1]
    original = path.read_text()
    updated = render(original, package, tag, assets)
    if updated == original:
        print(f"{package} {tag}: release metadata already matches verified downloads")
        return False
    if VERSION.search(original)[0] == f'  version "{tag[1:]}"':
        raise ValueError("metadata changed for an existing version; manual review is required")
    if check:
        raise ValueError(f"{path.name} does not match {tag}; run the updater")
    path.write_text(updated)
    print(f"Updated {path.name} to {tag}; verified {len(assets)} release downloads")
    return True


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("package", choices=PACKAGES)
    parser.add_argument("tag")
    parser.add_argument("--check", action="store_true", help="verify without writing")
    args = parser.parse_args()
    try:
        update(args.package, args.tag, check=args.check)
    except (ValueError, subprocess.CalledProcessError) as error:
        parser.exit(1, f"error: {error}\n")


if __name__ == "__main__":
    main()
