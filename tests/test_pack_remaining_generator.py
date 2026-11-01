import subprocess
import tempfile
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
GEN = ROOT / 'audit' / 'generate_pack_remaining.py'

class GeneratorTest(unittest.TestCase):
    def test_pilot_is_deterministic_and_bounded(self):
        with tempfile.TemporaryDirectory() as a, tempfile.TemporaryDirectory() as b:
            for out in (a, b):
                subprocess.run(['python3', str(GEN), '--output', out, '--rows', '8'], check=True)
            files = sorted(p.name for p in Path(a).glob('*.lean'))
            self.assertTrue(files)
            self.assertEqual(files, sorted(p.name for p in Path(b).glob('*.lean')))
            for name in files:
                text = (Path(a) / name).read_text()
                self.assertEqual(text, (Path(b) / name).read_text())
                self.assertNotIn('native_decide', text)
                self.assertNotIn('sorry', text)
            self.assertIn('row_7', ''.join((Path(a) / n).read_text() for n in files))

    def test_full_certificate_has_all_rows_and_exact_objective(self):
        with tempfile.TemporaryDirectory() as out:
            subprocess.run(['python3', str(GEN), '--output', out], check=True)
            files = sorted(Path(out).glob('PackRemaining[0-9]*.lean'))
            self.assertEqual(len(files), 55)
            body = ''.join(p.read_text() for p in files)
            for i in range(436):
                self.assertIn(f'theorem remaining_row_{i} :', body)
            self.assertIn('= 216342 := by', body)
            assembly = (Path(out) / 'PackRemainingAll.lean').read_text()
            self.assertEqual(assembly.count('· exact remaining_row_'), 436)
            self.assertIn('theorem remaining_round', assembly)

if __name__ == '__main__':
    unittest.main()
