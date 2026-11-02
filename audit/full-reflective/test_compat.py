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
GROUP29 = gzip.decompress((HERE / 'fixtures/Erdos302RLGroup0029FC.lean.gz').read_bytes())
GROUP30 = gzip.decompress((HERE / 'fixtures/Erdos302RLGroup0030FC.lean.gz').read_bytes())
GROUP174 = gzip.decompress((HERE / 'fixtures/Erdos302RLGroup0174FC.lean.gz').read_bytes())
THEOREM174 = b'theorem rl_T02_c139_G_valid :'
THEOREM30 = b'theorem rl_P02_c64_G_valid :'
THEOREMS29 = (b'theorem rl_P02_c62_G_valid :', b'theorem rl_P02_c63_G_valid :')
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
        self.group29 = self.root / 'Erdos302RLGroup0029FC.lean'
        self.group29.write_bytes(GROUP29)
        self.group30 = self.root / 'Erdos302RLGroup0030FC.lean'
        self.group30.write_bytes(GROUP30)
        self.group174 = self.root / 'Erdos302RLGroup0174FC.lean'
        self.group174.write_bytes(GROUP174)

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

    def test_two_0029_declarations_receive_only_scoped_options(self):
        self.assertEqual(hashlib.sha256(GROUP29).hexdigest(), '901e79e6fbe312193938982f08d50b08f1c930167ab585b33617c5ee0df56b5e')
        expected = GROUP29
        for theorem in THEOREMS29:
            self.assertEqual(GROUP29.count(theorem), 1)
            expected = expected.replace(theorem, OPTION + theorem)
        result = self.run_compat()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.group29.read_bytes(), expected)
        self.assertIn(hashlib.sha256(expected).hexdigest(), result.stdout)
        self.assertIn('rl_P02_c62_G_valid', result.stdout)
        self.assertIn('rl_P02_c63_G_valid', result.stdout)

    def test_modified_0029_rejected_before_any_mutation(self):
        modified = GROUP29 + b'\n-- unexpected\n'
        self.group29.write_bytes(modified)
        result = self.run_compat()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.group29.read_bytes(), modified)
        self.assertEqual(self.group.read_bytes(), GROUP)
        self.assertEqual(self.leaf.read_bytes(), ORIGINAL)

    def test_0030_scoped_option_only(self):
        self.assertEqual(hashlib.sha256(GROUP30).hexdigest(), 'ffc6b48c60712ca2002dfc91b3fb6d71dc00ccc68618d25593cc231a15d4f734')
        self.assertEqual(GROUP30.count(THEOREM30), 1)
        expected = GROUP30.replace(THEOREM30, OPTION + THEOREM30)
        result = self.run_compat()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.group30.read_bytes(), expected)
        self.assertIn(hashlib.sha256(expected).hexdigest(), result.stdout)
        self.assertIn('rl_P02_c64_G_valid', result.stdout)

    def test_modified_0030_rejected_before_any_mutation(self):
        modified = GROUP30 + b'\n-- unexpected\n'
        self.group30.write_bytes(modified)
        result = self.run_compat()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.group30.read_bytes(), modified)
        self.assertEqual(self.group29.read_bytes(), GROUP29)
        self.assertEqual(self.group.read_bytes(), GROUP)
        self.assertEqual(self.leaf.read_bytes(), ORIGINAL)

    def test_0174_exact_scoped_option(self):
        self.assertEqual(hashlib.sha256(GROUP174).hexdigest(), '725f9e4de2261a95cb83bd1e92d53b09525519fcac03e71e3a30b210143ac03e')
        self.assertEqual(GROUP174.count(THEOREM174), 1)
        expected = GROUP174.replace(THEOREM174, OPTION + THEOREM174)
        self.assertEqual(hashlib.sha256(expected).hexdigest(), 'c9bdd5c0490ff152e6860f1ea094b9e8c935668126e9cb777020756ac8b138bf')
        result = self.run_compat()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.group174.read_bytes(), expected)
        self.assertIn(hashlib.sha256(expected).hexdigest(), result.stdout)
        self.assertIn('rl_T02_c139_G_valid', result.stdout)

    def test_modified_0174_rejected_before_any_mutation(self):
        modified = GROUP174 + b'\n-- unexpected\n'
        self.group174.write_bytes(modified)
        result = self.run_compat()
        self.assertNotEqual(result.returncode, 0)
        for path, expected in ((self.leaf, ORIGINAL), (self.group, GROUP),
                               (self.group29, GROUP29), (self.group30, GROUP30),
                               (self.group174, modified)):
            self.assertEqual(path.read_bytes(), expected)

    def test_0174_bad_expected_output_hash_rejected_before_mutation(self):
        code = ("import importlib.util, pathlib, sys; "
                "s=importlib.util.spec_from_file_location('compat', sys.argv[1]); "
                "m=importlib.util.module_from_spec(s); s.loader.exec_module(m); "
                "m.GROUP174_TRANSFORMED_SHA256='0'*64; m.main(pathlib.Path(sys.argv[2]))")
        result = subprocess.run([sys.executable, '-c', code, str(SCRIPT), str(self.root)],
                                capture_output=True, text=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('unexpected transformed group 0174 bytes', result.stderr)
        for path, expected in ((self.leaf, ORIGINAL), (self.group, GROUP),
                               (self.group29, GROUP29), (self.group30, GROUP30),
                               (self.group174, GROUP174)):
            self.assertEqual(path.read_bytes(), expected)

    def test_reapplication_rejected_without_mutation(self):
        self.assertEqual(self.run_compat().returncode, 0)
        modified = self.leaf.read_bytes()
        self.assertNotEqual(self.run_compat().returncode, 0)
        self.assertEqual(self.leaf.read_bytes(), modified)


if __name__ == '__main__':
    unittest.main()
