import importlib.util
from pathlib import Path
import shutil
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location('extension_closure', Path(__file__).with_name('closure.py'))
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)

class ClosureTests(unittest.TestCase):
    def test_actual(self):
        m.validate(ROOT)
        with tempfile.TemporaryDirectory() as d:
            m.stage(ROOT, Path(d) / 'stage')
            with self.assertRaises(ValueError): m.stage(ROOT, Path(d) / 'stage')

    def test_mutated_imports_and_forbidden_token(self):
        with tempfile.TemporaryDirectory() as d:
            r = Path(d)
            (r / 'lean').mkdir()
            for name in m.MODULES:
                shutil.copyfile(ROOT / 'lean' / (name + '.lean'), r / 'lean' / (name + '.lean'))
            p = r / 'lean' / 'ExtensionSeedCandidate.lean'
            original = p.read_text()
            for suffix in ['\nimport Missing\n', '\npublic import Missing\n', '\nsorry\n']:
                p.write_text(original + suffix)
                with self.assertRaises(ValueError): m.validate(r)

if __name__ == '__main__': unittest.main()
