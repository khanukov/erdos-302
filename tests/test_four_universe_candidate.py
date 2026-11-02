import importlib.util
import json
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('universe_gen', ROOT / 'independent_bank/generate_universe_proof.py')
GEN = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(GEN)


def prime(p):
    return p >= 2 and all(p % d for d in range(2, int(p ** 0.5) + 1))


class UniverseCandidateTest(unittest.TestCase):
    def test_generator_exact_and_partitions(self):
        text = GEN.OUT.read_text()
        self.assertEqual(text, GEN.render())
        for i, n, _ in GEN.CASES:
            ranges = [(int(lo), int(hi)) for lo, hi in re.findall(
                rf'^theorem universe_part_{i}_(\d+)_(\d+) :', text, re.M)]
            self.assertEqual([x for lo, hi in ranges for x in range(lo, hi + 1)], list(range(1, n + 1)))
            self.assertIn(f'bound_retained_{i} universe_eq_{i}', text)

    def test_independent_finite_membership(self):
        data = json.loads((ROOT / 'audit/reciprocal-bridge/FourExternalData.json').read_text())
        allowed = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71}
        for case in data:
            expected = [x for x in range(1, case['n'] + 1)
                        if all(p in allowed or x % p != 0 for p in range(2, x + 1) if prime(p))]
            self.assertEqual(case['universe'], expected)
            mutant = set(expected) ^ {1}
            self.assertNotEqual(mutant, set(expected))

if __name__ == '__main__':
    unittest.main()
