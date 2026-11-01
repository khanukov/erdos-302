import copy
import unittest
from pathlib import Path

import verify_bank as v
from bank_interpreter import CheckError, interpret

ARCHIVE = Path(__file__).resolve().parents[1] / 'input/erdos302_boundary_certificates_publication.zip'

class TestAdmission(unittest.TestCase):
    def test_wrong_archive_hash_rejected(self):
        with self.assertRaises(CheckError):
            v.check_hash(b'not the archive')

    def test_schema_and_counts_rejected(self):
        bank, intervals = v.load_archive(ARCHIVE)
        for mutate in (lambda b: b.update(schema='wrong'),
                       lambda b: b['nodes'].pop(),
                       lambda b: b['images'].pop(),
                       lambda b: b['nodes'][1097].update(n=421)):
            b = copy.deepcopy(bank)
            mutate(b)
            with self.assertRaises(CheckError):
                v.validate_data(b, intervals)

class TestRealMutations(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.bank, _ = v.load_archive(ARCHIVE)

    def test_small_demand_mutation_rejected(self):
        nodes = copy.deepcopy(self.bank['nodes'][:1])
        nodes[0]['r'] = 2
        with self.assertRaises(CheckError):
            interpret(nodes, self.bank['images'], v.small_only)

    def test_case_dual_mutation_rejected(self):
        nodes = copy.deepcopy(self.bank['nodes'][:5])
        nodes[4]['tree'][0][2][0][1] *= 100
        with self.assertRaises(CheckError):
            interpret(nodes, self.bank['images'], v.small_only)

    def test_trim_forward_reference_rejected(self):
        nodes = copy.deepcopy(self.bank['nodes'][:6])
        images = copy.deepcopy(self.bank['images'][:4])
        images[3][0] = 5
        with self.assertRaises(CheckError):
            interpret(nodes, images, v.small_only)

if __name__ == '__main__':
    unittest.main()
