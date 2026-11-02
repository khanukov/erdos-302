import pathlib
import subprocess
import sys
import tempfile
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]
SCRIPT = ROOT / 'scripts/generate_pack1094_scale.py'

class ScaleGenerationTest(unittest.TestCase):
    def test_pilot_and_full_coverage_are_generated(self):
        with tempfile.TemporaryDirectory() as d:
            p = subprocess.run([sys.executable, str(SCRIPT), '--out', d], capture_output=True, text=True)
            self.assertEqual(p.returncode, 0, p.stdout + p.stderr)
            out = pathlib.Path(d)
            pilot = (out / 'Pack1094Batch000.lean').read_text()
            self.assertIn('import Pack1094Vertex3', pilot)
            self.assertIn('import Pack1094Vertex10', pilot)
            self.assertIn('capacity_vertex_10', pilot)
            full = (out / 'Pack1094AllCapacities.lean').read_text()
            self.assertIn('∀ x ∈ support', full)
            self.assertIn('capacity_vertex_two', full)
            self.assertIn('capacity_vertex_1564', (out / 'Pack1094Batch087.lean').read_text())
            self.assertIn('support_partition', full)
            self.assertIn('Finset.insert_union', full)
            self.assertIn('capacity_group_000', full)
            self.assertNotIn('simp only [support, Finset.mem_insert', full)
            self.assertNotIn('native_decide', full)
            self.assertNotIn('sorry', full)

if __name__ == '__main__': unittest.main()
