import gzip
import hashlib
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

HERE = Path(__file__).resolve().parent
SCRIPT = HERE / 'compat.py'
ORIGINAL = gzip.decompress((HERE / 'fixtures/Erdos302ReflectiveLeafFC.lean.gz').read_bytes())
OLD = b'Finset.sum_inter_add_sum_diff'
NEW = b'Finset.sum_inter_add_sum_sdiff'
GROUP = gzip.decompress((HERE / 'fixtures/Erdos302RLGroup0027FC.lean.gz').read_bytes())
THEOREM = b'theorem rl_P02_c60_G_valid :'
OPTION = b'set_option maxHeartbeats 1000000 in\n'


class CompatibilityTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.leaf = self.root / 'Erdos302ReflectiveLeafFC.lean'
        self.leaf.write_bytes(ORIGINAL)
        self.group = self.root / 'Erdos302RLGroup0027FC.lean'
        self.group.write_bytes(GROUP)

    def run_compat(self):
        return subprocess.run([sys.executable, str(SCRIPT), str(self.root)], capture_output=True, text=True)

    def test_exact_four_renames_and_no_other_bytes(self):
        self.assertEqual(hashlib.sha256(ORIGINAL).hexdigest(), '8a2114568a3b5af0e2345b31b4d8d83a45cd051582b4173d3138fae37d5b78d8')
        self.assertEqual(ORIGINAL.count(OLD), 4)
        result = self.run_compat()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.leaf.read_bytes(), ORIGINAL.replace(OLD, NEW))
        self.assertIn('8a2114568a3b5af0e2345b31b4d8d83a45cd051582b4173d3138fae37d5b78d8', result.stdout)
        self.assertIn(hashlib.sha256(self.leaf.read_bytes()).hexdigest(), result.stdout)

    def test_modified_input_rejected_without_mutation(self):
        modified = ORIGINAL + b'\n-- unexpected\n'
        self.leaf.write_bytes(modified)
        result = self.run_compat()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.leaf.read_bytes(), modified)

    def test_exact_local_heartbeat_adjustment(self):
        self.assertEqual(hashlib.sha256(GROUP).hexdigest(), '47d616df958b2f0178edc836551093e3eaef29e152fdbfe89b83c9acf2e497ff')
        self.assertEqual(GROUP.count(THEOREM), 1)
        result = self.run_compat()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.group.read_bytes(), GROUP.replace(THEOREM, OPTION + THEOREM))
        self.assertIn(hashlib.sha256(self.group.read_bytes()).hexdigest(), result.stdout)

    def test_modified_group_rejected_without_mutating_either_file(self):
        modified = GROUP + b'\n-- unexpected\n'
        self.group.write_bytes(modified)
        result = self.run_compat()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.group.read_bytes(), modified)
        self.assertEqual(self.leaf.read_bytes(), ORIGINAL)

    def test_reapplication_rejected_without_mutation(self):
        self.assertEqual(self.run_compat().returncode, 0)
        modified = self.leaf.read_bytes()
        self.assertNotEqual(self.run_compat().returncode, 0)
        self.assertEqual(self.leaf.read_bytes(), modified)


if __name__ == '__main__':
    unittest.main()
