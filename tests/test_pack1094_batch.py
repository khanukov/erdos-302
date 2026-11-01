import pathlib
import subprocess
import sys
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]

class BatchGenerationTest(unittest.TestCase):
    def test_generated_files_are_current(self):
        result = subprocess.run([sys.executable, str(ROOT / 'scripts/generate_pack1094_batch.py'), '--check'], cwd=ROOT, capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

if __name__ == '__main__':
    unittest.main()
