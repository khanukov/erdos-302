import unittest
from suffix_factorization import raw_cell_count, raw_pair_count

class FactorCountAssumptions(unittest.TestCase):
    def test_overlap(self):
        self.assertNotEqual(raw_cell_count(2, 1, 3, [2]), raw_pair_count(2, 1, 3, [2], [2]))

    def test_composite_prefix(self):
        self.assertNotEqual(raw_cell_count(2, 1, 3, [4]), raw_pair_count(2, 1, 3, [4], []))

    def test_zero_lower_endpoint(self):
        self.assertNotEqual(raw_cell_count(1, 0, 2, []), raw_pair_count(1, 0, 2, [], []))

    def test_zero_upper_endpoint(self):
        self.assertNotEqual(raw_cell_count(1, 1, 0, []), raw_pair_count(1, 1, 0, [], []))
