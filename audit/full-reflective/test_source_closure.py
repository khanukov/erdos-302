import importlib.util
from pathlib import Path
import tempfile
import unittest

HELPER = Path(__file__).resolve().parents[2] / '.github/kitamura/build_chain.py'
spec = importlib.util.spec_from_file_location('chain', HELPER)
chain = importlib.util.module_from_spec(spec)
spec.loader.exec_module(chain)


class ClosureTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.old = chain.ROOT
        chain.ROOT = self.root
        self.addCleanup(setattr, chain, 'ROOT', self.old)

    def source(self, name, text):
        p = self.root / (name.replace('.', '/') + '.lean')
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(text)

    def test_missing_upstream_import_fails(self):
        self.source('Top', 'import Missing\n')
        with self.assertRaisesRegex((ValueError, RuntimeError), 'Missing'):
            chain.closure('Top')

    def test_indented_tabs_multiple_imports_and_comments(self):
        self.source('Top', '/- ignored import Fake -/\n  import\tA B -- comment\n')
        self.source('A', 'import Mathlib.Tactic\n')
        self.source('B', '')
        self.assertEqual(chain.closure('Top'), ['A', 'B', 'Top'])

    def test_duplicate_import_rejected(self):
        self.source('Top', 'import A A\n')
        self.source('A', '')
        with self.assertRaisesRegex((ValueError, RuntimeError), 'duplicate'):
            chain.closure('Top')

    def test_comment_between_keyword_and_module(self):
        self.source('Top', 'import/- nested /- comment -/ -/A\n')
        self.source('A', '')
        self.assertEqual(chain.closure('Top'), ['A', 'Top'])

    def test_missing_target_fails(self):
        with self.assertRaisesRegex(ValueError, 'Missing'):
            chain.closure('Missing')

    def test_cycle_fails(self):
        self.source('Top', 'import A\n')
        self.source('A', 'import Top\n')
        with self.assertRaisesRegex(ValueError, 'cycle'):
            chain.closure('Top')

    def test_multiline_import_continuation_rejected(self):
        self.source('Top', 'import A\n  B\n')
        self.source('A', '')
        self.source('B', '')
        with self.assertRaisesRegex(ValueError, 'continuation'):
            chain.closure('Top')

    def test_unsupported_import_format_rejected(self):
        self.source('Top', 'import A; import B\n')
        with self.assertRaises((ValueError, RuntimeError)):
            chain.closure('Top')

    def test_inventory_exact_not_count_only(self):
        self.source('Top', 'import A\n')
        self.source('A', '')
        with self.assertRaises((ValueError, RuntimeError)):
            chain.check_inventory(['A', 'Top'], ['B', 'Top'])
        with self.assertRaises((ValueError, RuntimeError)):
            chain.check_inventory(['A', 'Top'], ['A', 'A', 'Top'])

if __name__ == '__main__':
    unittest.main()
