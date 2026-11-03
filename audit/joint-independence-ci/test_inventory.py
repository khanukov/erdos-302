import importlib.util
from pathlib import Path
import tempfile
import unittest

SPEC = importlib.util.spec_from_file_location('inventory', Path(__file__).with_name('check_inventory.py'))
inventory = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(inventory)


class InventoryTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        (self.root / 'lean').mkdir()
        (self.root / 'audit/ledger-candidate/lean').mkdir(parents=True)
        self.manifests = self.root / 'audit/joint-independence-ci'
        self.manifests.mkdir()
        self.source('JointIndependenceCandidateTests', 'import A\n')
        self.source('A', 'import Mathlib.Data.Nat.Basic\n')
        self.source('Orphan', '')
        self.manifest('included.txt', 'A\nJointIndependenceCandidateTests\n')
        self.manifest('excluded.txt', 'Orphan\n')
        self.manifest('build-order.txt', 'A\nJointIndependenceCandidateTests\n')

    def source(self, name, text):
        (self.root / 'lean' / (name + '.lean')).write_text(text)

    def manifest(self, name, text):
        (self.manifests / name).write_text(text)

    def test_valid(self):
        inventory.check(self.root)

    def test_missing_closure_and_extra_inclusion_rejected(self):
        for text in ('JointIndependenceCandidateTests\n', 'A\nJointIndependenceCandidateTests\nOrphan\n'):
            self.manifest('included.txt', text)
            with self.assertRaisesRegex(ValueError, 'mismatch'):
                inventory.check(self.root)

    def test_unlisted_orphan_and_wrong_exclusion_rejected(self):
        self.source('NewOrphan', '')
        with self.assertRaisesRegex(ValueError, 'mismatch'):
            inventory.check(self.root)
        self.manifest('excluded.txt', 'Orphan\nNewOrphan\nA\n')
        with self.assertRaisesRegex(ValueError, 'mismatch'):
            inventory.check(self.root)

    def test_bad_order_duplicate_missing_import_and_syntax(self):
        self.manifest('build-order.txt', 'JointIndependenceCandidateTests\nA\n')
        with self.assertRaisesRegex(ValueError, 'order mismatch'):
            inventory.check(self.root)
        self.manifest('build-order.txt', 'A\nA\n')
        with self.assertRaisesRegex(ValueError, 'invalid inventory'):
            inventory.check(self.root)
        self.source('A', 'import Missing\n')
        with self.assertRaisesRegex(ValueError, 'unresolved import'):
            inventory.compute(self.root)
        self.source('A', '  import Mathlib -- unsupported\n')
        with self.assertRaisesRegex(ValueError, 'unsupported import'):
            inventory.compute(self.root)

    def test_nested_duplicate_and_cycle(self):
        (self.root / 'audit/ledger-candidate/lean/A.lean').write_text('')
        with self.assertRaisesRegex(ValueError, 'duplicate module'):
            inventory.compute(self.root)
        (self.root / 'audit/ledger-candidate/lean/A.lean').unlink()
        self.source('A', 'import JointIndependenceCandidateTests\n')
        with self.assertRaisesRegex(ValueError, 'cycle'):
            inventory.compute(self.root)


if __name__ == '__main__':
    unittest.main()
