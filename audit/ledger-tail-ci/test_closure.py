import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch
import closure


class ClosureTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name) / 'root'
        for _, (path, imports) in closure.MODULES.items():
            dest = self.root / path
            dest.parent.mkdir(parents=True, exist_ok=True)
            dest.write_text(''.join('import ' + dep + '\n' for dep in imports))

    def test_actual_inventory_and_stage(self):
        closure.validate(closure.ROOT)
        closure.stage(self.root, Path(self.tmp.name) / 'out')

    def test_missing_and_unexpected_imports_rejected(self):
        path = self.root / closure.MODULES['LedgerTailDemand'][0]
        for source in ('import DemandRenewalChain\n', 'import DemandRenewalChain\nimport LedgerChecker\nimport Rogue\n', 'import DemandRenewalChain LedgerChecker\n'):
            path.write_text(source)
            with self.assertRaises(ValueError):
                closure.validate(self.root)

    def test_missing_file_and_extra_staged_source_rejected(self):
        (self.root / closure.MODULES['Renewal'][0]).unlink()
        with self.assertRaises(OSError):
            closure.validate(self.root)
        (self.root / closure.MODULES['Renewal'][0]).write_text(''.join('import ' + dep + '\n' for dep in closure.MODULES['Renewal'][1]))
        out = Path(self.tmp.name) / 'out'
        out.mkdir()
        (out / 'Rogue.lean').write_text('')
        with self.assertRaises(ValueError):
            closure.stage(self.root, out)

    def test_disconnected_module_rejected(self):
        extra = dict(closure.MODULES)
        extra['Orphan'] = ('lean/Orphan.lean', [])
        (self.root / 'lean/Orphan.lean').write_text('')
        with patch.object(closure, 'MODULES', extra), self.assertRaises(ValueError):
            closure.validate(self.root)

if __name__ == '__main__':
    unittest.main()
