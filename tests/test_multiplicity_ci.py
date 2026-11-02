import pathlib
import subprocess
import sys
import tempfile
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]
CHECK = ROOT / 'audit/multiplicity-ci/check_inventory.py'

class InventoryTests(unittest.TestCase):
    def run_check(self, root):
        return subprocess.run([sys.executable, str(CHECK), str(root)], capture_output=True, text=True)

    def test_repo_inventory_is_complete(self):
        result = self.run_check(ROOT)
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_extra_source_is_rejected(self):
        import shutil
        with tempfile.TemporaryDirectory() as tmp:
            dest = pathlib.Path(tmp)
            shutil.copytree(ROOT / 'lean', dest / 'lean')
            shutil.copytree(ROOT / 'audit/ledger-candidate/lean', dest / 'audit/ledger-candidate/lean')
            shutil.copytree(ROOT / 'audit/multiplicity-ci', dest / 'audit/multiplicity-ci')
            (dest / 'lean/Unexpected.lean').write_text('-- unexpected\n')
            self.assertNotEqual(self.run_check(dest).returncode, 0)

    def test_unexpected_import_is_rejected(self):
        import shutil
        with tempfile.TemporaryDirectory() as tmp:
            dest = pathlib.Path(tmp)
            shutil.copytree(ROOT / 'lean', dest / 'lean')
            shutil.copytree(ROOT / 'audit/ledger-candidate/lean', dest / 'audit/ledger-candidate/lean')
            shutil.copytree(ROOT / 'audit/multiplicity-ci', dest / 'audit/multiplicity-ci')
            p = dest / 'lean/RenewalMultiplicityCandidateTests.lean'
            p.write_text('import Unexpected\n' + p.read_text())
            self.assertNotEqual(self.run_check(dest).returncode, 0)

if __name__ == '__main__': unittest.main()
