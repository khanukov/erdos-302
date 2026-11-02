#!/usr/bin/env python3
"""Independent rational sanity checks, not Lean proofs or provenance checks."""
import json
import unittest
from fractions import Fraction
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXPECTED = [3, 2, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71]


class DensityPrefixIndependent(unittest.TestCase):
    def test_all_literal_prefixes_and_occurrences(self):
        levels = json.loads((ROOT / 'ledger.json').read_text())['levels']
        self.assertEqual([level['prime'] for level in levels], EXPECTED)
        self.assertEqual(len(set(EXPECTED)), 20)
        fold, prefix, occurrences = Fraction(1), [], 0
        for level in levels:
            product = Fraction(1)
            for p in set(prefix):
                product *= 1 - Fraction(1, p)
            self.assertEqual(fold, product)
            occurrences += len(level['cells'])
            p = level['prime']
            fold *= Fraction(p - 1, p)
            prefix.append(p)
        product = Fraction(1)
        for p in set(prefix):
            product *= 1 - Fraction(1, p)
        self.assertEqual(fold, product)
        self.assertEqual(occurrences, 4705)

    def test_duplicate_prime_counterexample(self):
        self.assertNotEqual(Fraction(2, 3) ** 2, Fraction(2, 3))


if __name__ == '__main__':
    unittest.main()
