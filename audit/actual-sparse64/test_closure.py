import importlib.util
import os
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('closure', HERE / 'closure.py')
closure = importlib.util.module_from_spec(spec)
spec.loader.exec_module(closure)

class ClosureTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(dir=os.environ.get('TMPDIR'))
        self.root = Path(self.tmp.name) / 'repo'
        modules, self.vertices = closure.inventory()
        for name in modules:
            rel = Path('lean') / (name.replace('.', '/') + '.lean')
            target = self.root / rel
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(closure.ROOT / rel, target)
        self.dest = Path(self.tmp.name) / 'stage'
    def tearDown(self):
        self.tmp.cleanup()
    def test_exact(self):
        modules, vertices = closure.stage(self.root, self.dest)
        self.assertEqual(len(modules), 91)
        self.assertEqual(len(vertices), 64)
    def test_missing_import(self):
        path = self.root / 'lean/ActualSparse64/Coverage.lean'
        text = path.read_text()
        path.write_text(text.replace('import ActualSparse64.Vertex118\n', '', 1))
        with self.assertRaises(ValueError): closure.stage(self.root, self.dest)
    def test_unsupported_import(self):
        path = self.root / 'lean/ActualSparse64/FastSample.lean'
        path.write_text(path.read_text().replace('import SparseBoundaryFast', 'public import SparseBoundaryFast', 1))
        with self.assertRaises(ValueError): closure.stage(self.root, self.dest)
    def test_forbidden_proof_token(self):
        path = self.root / 'lean/ActualSparse64/FastSample.lean'
        path.write_text(path.read_text() + '\n-- native_decide\n')
        with self.assertRaises(ValueError): closure.stage(self.root, self.dest)
    def test_generated_byte_mismatch(self):
        files = closure.gen.generate()
        path = next(p for p in files if p.name.startswith('Vertex'))
        files[path] += '-- changed\n'
        with patch.object(closure.gen, 'generate', return_value=files):
            with self.assertRaises(ValueError): closure.inventory()
    def test_generated_extra(self):
        files = closure.gen.generate()
        files[closure.gen.OUT / 'Vertex999999.lean'] = ''
        with patch.object(closure.gen, 'generate', return_value=files):
            with self.assertRaises(ValueError): closure.inventory()

if __name__ == '__main__': unittest.main()
