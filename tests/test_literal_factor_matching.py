import json
import math
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

class LiteralFactorMatchingTests(unittest.TestCase):
    def test_literal_and_factor_counts(self):
        levels = json.loads((ROOT / 'audit/ledger-candidate/ledger.json').read_text())['levels']
        primes = [level['prime'] for level in levels]
        self.assertEqual(len(primes), len(set(primes)))
        self.assertTrue(all(p > 1 and all(p % d for d in range(2, math.isqrt(p) + 1)) for p in primes))
        cells = [(primes[:j], cell) for j, level in enumerate(levels) for cell in level['cells']]
        self.assertEqual(len(cells), 4705)
        n = 60
        rough = [q for q in range(1, n + 1) if all(q % p for p in primes)]
        positive = 0
        for prefix, (a, b, _) in cells:
            self.assertTrue(0 < a < b)
            suffix = set(primes) - set(prefix)
            direct = sum(n // b < m <= n // a and all(m % p for p in prefix) for m in range(1, n + 1))
            def smooth(t):
                for p in suffix:
                    while t % p == 0:
                        t //= p
                return t == 1
            expanded = sum(1 for q in rough for t in range(1, n // q + 1)
                           if smooth(t) and a <= n // (q * t) < b)
            self.assertEqual(direct, expanded, (prefix, a, b))
            positive += direct > 0
        self.assertGreater(positive, 0)

    def test_dispatch_and_conditional_interface(self):
        import re
        workflow = (ROOT / '.github/workflows/literal-factor-matching.yml').read_text()
        self.assertIn('workflow_dispatch:', workflow)
        self.assertNotIn('pull_request:', workflow)
        self.assertNotIn('push:', workflow)
        self.assertIn('python3 -B tests/test_upper_project.py', workflow)
        self.assertIn('audit/multiplicity-ci/check_inventory.py', workflow)
        self.assertIn('lake build +LiteralFactorMatchingCandidate', workflow)
        self.assertIn('LiteralFactorMatchingCandidate.matching', workflow)
        self.assertIn('LiteralFactorMatchingCandidate.literal_hcover', workflow)
        source = (ROOT / 'lean/LiteralFactorMatchingCandidate.lean').read_text()
        sig = re.search(r'theorem literal_hcover\b(.*?)\s*:= by', source, re.S)
        self.assertIsNotNone(sig)
        for premise in ('(hA :', '(hfree :', '(hd :', '(allocation :'):
            self.assertIn(premise, sig.group(1))
        self.assertNotIn('(matching :', sig.group(1))
        self.assertIn('exact matching N i', source)

if __name__ == '__main__':
    unittest.main()
