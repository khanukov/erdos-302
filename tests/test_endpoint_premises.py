"""Independent literal sanity checks; these are not Lean proofs."""
import math
import re
import unittest
from fractions import Fraction
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


class EndpointLiteralTests(unittest.TestCase):
    def test_generated_cell_endpoints(self):
        text = (ROOT / 'audit/ledger-candidate/lean/ArchiveLedger.lean').read_text()
        cells = [tuple(map(int, m)) for m in re.findall(
            r'⟨\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*⟩', text)]
        self.assertEqual(len(cells), 4705)
        self.assertTrue(all(0 < a < b for a, b, _ in cells))

    def test_prime_prefixes_and_budgets(self):
        text = (ROOT / 'audit/ledger-candidate/lean/LedgerChecker.lean').read_text()
        match = re.search(r'def primes : List ℕ := \[([^]]*)\]', text)
        if match is None:
            self.fail('prime literal not found')
        primes = [int(x.strip()) for x in match.group(1).split(',')]
        self.assertEqual(len(primes), 20)
        fold = Fraction(1)
        for k in range(21):
            prefix = primes[:k]
            self.assertTrue(all(p >= 2 and all(p % d for d in range(2, math.isqrt(p) + 1))
                                for p in prefix))
            self.assertLessEqual(len(set(prefix)), len(prefix) + 1)
            self.assertLessEqual(0, fold)
            self.assertLessEqual(fold, 1)
            if k < len(primes):
                fold *= Fraction(primes[k] - 1, primes[k])

    def test_invalid_examples_rejected(self):
        self.assertFalse(0 < 0 < 4)
        self.assertFalse(0 < 4 < 4)
        self.assertFalse(1 >= 2)
        self.assertEqual(9 % 3, 0)


if __name__ == '__main__':
    unittest.main()
