import pathlib
import subprocess
import sys
import tempfile
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]
SCRIPT = ROOT / 'scripts/assemble_pack1094_artifacts.py'

class ArtifactTest(unittest.TestCase):
    def test_exact_batch_artifacts_required(self):
        with tempfile.TemporaryDirectory() as tmp:
            p = pathlib.Path(tmp)
            batches = p / 'batches.txt'
            batches.write_text(''.join(f'{i+3}\n' for i in range(88)))
            artifacts = p / 'artifacts'
            artifacts.mkdir()
            dest = p / 'dest'
            dest.mkdir()
            for i in range(88):
                d = artifacts / f'node1094-proof-batch-{i}'
                d.mkdir()
                (d / f'Pack1094Batch{i:03}.olean').write_bytes(b'batch')
                (d / f'Pack1094Vertex{i+3}.olean').write_bytes(b'vertex')
            cmd = [sys.executable, str(SCRIPT), str(batches), str(artifacts), str(dest)]
            result = subprocess.run(cmd, capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(len(list(dest.glob('*.olean'))), 176)
            (artifacts / 'node1094-proof-batch-87' / 'Pack1094Batch087.olean').unlink()
            result = subprocess.run(cmd, capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)

if __name__ == '__main__':
    unittest.main()
