"""Exercise publication against a real local Git remote and a simulated GitHub PR."""

import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]


class PublishUpdateTests(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="tap-publisher-")
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.checkout = self.root / "checkout"
        self.remote = self.root / "remote.git"
        self.bin = self.root / "bin"
        self.bin.mkdir()
        self.env = dict(os.environ, GIT_CONFIG_GLOBAL=os.devnull, PATH=str(self.bin) + os.pathsep + os.environ["PATH"], PR_LOG=str(self.root / "github.jsonl"))
        self.run_git("init", "--bare", "--initial-branch=main", str(self.remote), cwd=self.root)
        self.run_git("init", "--initial-branch=main", str(self.checkout), cwd=self.root)
        self.run_git("config", "user.name", "Test")
        self.run_git("config", "user.email", "test@example.com")
        (self.checkout / "scripts").mkdir()
        (self.checkout / "Formula").mkdir()
        shutil.copy2(ROOT / "scripts/publish-update.sh", self.checkout / "scripts/publish-update.sh")
        (self.checkout / "Formula/bcmr.rb").write_text("old metadata\n")
        (self.checkout / "scripts/update-release.py").write_text('''import os
from pathlib import Path
if not os.environ.get("NO_CHANGE"):
    Path("Formula/bcmr.rb").write_text("new metadata\\n")
''')
        gh = self.bin / "gh"
        gh.write_text('''#!/usr/bin/env python3
import json, os, subprocess, sys
args = sys.argv[1:]
with open(os.environ["PR_LOG"], "a") as log:
    log.write(json.dumps(args) + "\\n")
if args[:2] == ["pr", "list"]:
    if os.environ.get("EXISTING_PR"):
        print("https://example.com/pull/1")
elif args[:2] == ["pr", "create"]:
    print("https://example.com/pull/1")
elif args[:2] == ["pr", "view"]:
    head = subprocess.check_output(["git", "rev-parse", "HEAD"], text=True).strip()
    if os.environ.get("CHANGED_HEAD"):
        head = "0" * 40
    print(os.environ.get("PR_STATE", "MERGED") + "\\t" + head)
elif args[:2] != ["pr", "merge"]:
    raise SystemExit("Unexpected GitHub command: " + repr(args))
''')
        gh.chmod(0o755)
        self.run_git("add", ".")
        self.run_git("commit", "-m", "Initial tap")
        self.initial = self.run_git("rev-parse", "HEAD")
        self.run_git("remote", "add", "origin", str(self.remote))
        self.run_git("push", "origin", "main")

    def run_git(self, *args, cwd=None):
        return subprocess.check_output(["git", *args], cwd=cwd or self.checkout, env=self.env, text=True, stderr=subprocess.DEVNULL).strip()

    def publish(self, **env):
        return subprocess.run(["bash", "scripts/publish-update.sh", "bcmr", "v9.8.7"], cwd=self.checkout, env=dict(self.env, **env), text=True, capture_output=True, timeout=20)

    def commands(self):
        path = self.root / "github.jsonl"
        return [json.loads(line) for line in path.read_text().splitlines()] if path.exists() else []

    def test_publishes_only_a_release_branch_and_pins_the_merge_head(self):
        result = self.publish()
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(self.run_git("rev-parse", "main", cwd=self.remote), self.initial)
        head = self.run_git("rev-parse", "releases/bcmr-v9.8.7", cwd=self.remote)
        self.assertEqual(self.run_git("diff", "--name-only", self.initial, head, cwd=self.remote), "Formula/bcmr.rb")
        merge = next(command for command in self.commands() if command[:2] == ["pr", "merge"])
        self.assertIn("--auto", merge)
        self.assertEqual(merge[merge.index("--match-head-commit") + 1], head)

    def test_no_change_does_not_open_a_pr(self):
        result = self.publish(NO_CHANGE="1")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.commands(), [])
        self.assertEqual(self.run_git("rev-parse", "HEAD"), self.initial)

    def test_existing_pr_is_reused(self):
        result = self.publish(EXISTING_PR="1")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertFalse(any(command[:2] == ["pr", "create"] for command in self.commands()))

    def test_closed_or_changed_pr_does_not_report_success(self):
        for environment, message in [({"PR_STATE": "CLOSED"}, "closed without merging"), ({"CHANGED_HEAD": "1"}, "head changed")]:
            with self.subTest(environment=environment):
                self.run_git("switch", "main")
                self.run_git("branch", "-D", "releases/bcmr-v9.8.7") if self.run_git("branch", "--list", "releases/bcmr-v9.8.7") else None
                result = self.publish(**environment)
                self.assertNotEqual(result.returncode, 0)
                self.assertIn(message, result.stderr)


if __name__ == "__main__":
    unittest.main()
