import copy
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location("update_release", ROOT / "scripts/update-release.py")
UPDATER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(UPDATER)


class ReleaseUpdateTests(unittest.TestCase):
    def assets(self, package, tag="v9.8.7"):
        repo, path = UPDATER.PACKAGES[package]
        source = (ROOT / path).read_text()
        return {
            match[2].rsplit("/", 1)[-1]: (
                f'https://github.com/Bengerthelorf/{repo}/releases/download/{tag}/'
                + match[2].rsplit("/", 1)[-1], "a" * 64,
            ) for match in UPDATER.URL.finditer(source)
        }

    def release(self, package):
        return {
            "id": 42, "tag_name": "v9.8.7", "draft": False, "prerelease": False,
            "assets": [{
                "name": name, "browser_download_url": url, "state": "uploaded",
                "digest": "sha256:" + digest,
            } for name, (url, digest) in self.assets(package).items()],
        }

    def test_all_packages_preserve_nonrelease_metadata(self):
        for package, (_, file) in UPDATER.PACKAGES.items():
            with self.subTest(package=package):
                source = (ROOT / file).read_text()
                source = source.replace("\nend\n", '\n  # Maintainer-specific metadata must survive a release.\nend\n')
                result = UPDATER.render(source, package, "v9.8.7", self.assets(package))
                # Removing only the three mutable fields must leave identical DSL.
                def structure(value):
                    value = UPDATER.VERSION.sub("VERSION", value)
                    value = UPDATER.URL.sub(lambda m: m[1] + "URL", value)
                    return UPDATER.SHA256.sub(lambda m: m[1] + "SHA256", value)
                self.assertEqual(structure(source), structure(result))
                if file.startswith("Casks/"):
                    self.assertIn('version "9.8.7"', result)
                    self.assertIn('/v#{version}/', result)
                else:
                    self.assertIn('/releases/download/v9.8.7/', result)
                    self.assertNotRegex(result, UPDATER.VERSION)
                self.assertEqual(UPDATER.current_tag(result, package), "v9.8.7")

    def test_release_assets_are_downloaded_and_hashed(self):
        for package in UPDATER.PACKAGES:
            with self.subTest(package=package), patch.object(UPDATER, "api", side_effect=[self.release(package), {"id": 42}]), patch.object(UPDATER, "checksum", return_value="a" * 64) as checksum:
                self.assertEqual(UPDATER.release_metadata(package, "v9.8.7"), self.assets(package))
                self.assertEqual(checksum.call_count, len(self.assets(package)))

    def test_bad_releases_never_download(self):
        for changed, latest in [({"draft": True}, 42), ({"prerelease": True}, 42), ({}, 43)]:
            release = self.release("iconchanger")
            release.update(changed)
            with self.subTest(changed=changed, latest=latest), patch.object(UPDATER, "api", side_effect=[release, {"id": latest}]), patch.object(UPDATER, "checksum") as checksum:
                with self.assertRaises(ValueError):
                    UPDATER.release_metadata("iconchanger", "v9.8.7")
                checksum.assert_not_called()

    def test_missing_duplicate_incomplete_and_foreign_assets_are_rejected(self):
        base = self.release("iconchanger")
        for kind in ("missing", "duplicate", "incomplete", "foreign"):
            release = copy.deepcopy(base)
            if kind == "missing":
                release["assets"] = []
            elif kind == "duplicate":
                release["assets"] *= 2
            elif kind == "incomplete":
                release["assets"][0]["state"] = "new"
            else:
                release["assets"][0]["browser_download_url"] = "https://example.com/fake.dmg"
            with self.subTest(kind=kind), patch.object(UPDATER, "api", side_effect=[release, {"id": 42}]), patch.object(UPDATER, "checksum") as checksum:
                with self.assertRaises(ValueError):
                    UPDATER.release_metadata("iconchanger", "v9.8.7")
                checksum.assert_not_called()

    def test_checksum_mismatch_does_not_write_a_formula(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            path = root / "Casks/iconchanger.rb"
            path.parent.mkdir()
            original = (ROOT / "Casks/iconchanger.rb").read_bytes()
            path.write_bytes(original)
            with patch.object(UPDATER, "api", side_effect=[self.release("iconchanger"), {"id": 42}]), patch.object(UPDATER, "checksum", return_value="b" * 64):
                with self.assertRaisesRegex(ValueError, "checksum"):
                    UPDATER.update("iconchanger", "v9.8.7", root)
            self.assertEqual(path.read_bytes(), original)

    def test_schema_drift_is_rejected(self):
        source = (ROOT / "Formula/bcmr.rb").read_text()
        variants = [
            source.replace('class Bcmr < Formula', 'class Bcmr < Formula\n  version "1.2.3"'),
            source.replace('      sha256 ', '      # checksum '),
            source.replace('/bcmr/releases/', '/other/releases/'),
            source.replace('bcmr-aarch64-macos.tar.gz', 'bcmr-x86_64-macos.tar.gz'),
        ]
        for source in variants:
            with self.subTest(source=source), self.assertRaises(ValueError):
                UPDATER.render(source, "bcmr", "v9.8.7", self.assets("bcmr"))

    def test_existing_version_and_check_mode_do_not_overwrite(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            file = root / "Casks/iconchanger.rb"
            file.parent.mkdir()
            source = (ROOT / "Casks/iconchanger.rb").read_text()
            file.write_text(source)
            existing_tag = "v" + json.loads(UPDATER.VERSION.search(source)[0].split("version ")[1])
            with patch.object(UPDATER, "release_metadata", return_value=self.assets("iconchanger", existing_tag)):
                with self.assertRaisesRegex(ValueError, "existing version"):
                    UPDATER.update("iconchanger", existing_tag, root)
            with patch.object(UPDATER, "release_metadata", return_value=self.assets("iconchanger")):
                with self.assertRaisesRegex(ValueError, "does not match"):
                    UPDATER.update("iconchanger", "v9.8.7", root, check=True)
            self.assertEqual(file.read_text(), source)

    def test_invalid_tags_do_not_reach_the_network(self):
        for tag in ("v1.2.3-rc.1", "v1.2.3;echo injected", "../main", "v1.2.3\n"):
            with self.subTest(tag=tag), patch.object(UPDATER, "api") as api, self.assertRaises(ValueError):
                UPDATER.release_metadata("bcmr", tag)
            api.assert_not_called()


if __name__ == "__main__":
    unittest.main()
