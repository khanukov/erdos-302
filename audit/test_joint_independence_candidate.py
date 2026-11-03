"""Finite Python corroboration only; neither Lean checking nor archive provenance."""
import itertools
import json
import unittest
from pathlib import Path

LEVELS = json.loads((Path(__file__).parent / 'ledger-candidate/ledger.json').read_text())['levels']
PRIMES = [level['prime'] for level in LEVELS]


def subsets(vertices):
    vertices = sorted(vertices)
    for size in range(len(vertices) + 1):
        yield from map(frozenset, itertools.combinations(vertices, size))


def edges(vertices):
    return [frozenset((a, b, c)) for a, b, c in itertools.combinations(sorted(vertices), 3)
            if b * c == a * (b + c)]


def smooth(t, primes):
    for p in primes:
        while t % p == 0:
            t //= p
    return t == 1


def joint(n):
    return sum(h for j, level in enumerate(LEVELS)
               for a, b, h in level['cells']
               for t in range(1, n + 1)
               if smooth(t, PRIMES[j:]) and a <= n // t < b)


def stats(vertices):
    es = edges(vertices)
    ss = list(subsets(vertices))
    alpha = max(len(b) for b in ss if all(not e <= b for e in es))
    tau = min(len(c) for c in ss if all(c & e for e in es))
    return es, alpha, tau


class JointIndependenceTests(unittest.TestCase):
    def test_positive_actual_all_20_levels_n6(self):
        self.assertEqual(len(LEVELS), 20)
        vertices = {x for x in range(1, 7) if smooth(x, PRIMES)}
        es, alpha, tau = stats(vertices)
        self.assertIn(frozenset((2, 3, 6)), es)
        self.assertEqual((vertices, joint(6), alpha, tau), (set(range(1, 7)), 1, 5, 1))
        self.assertEqual(alpha + joint(6), len(vertices))
        self.assertGreater(alpha + joint(6) + 1, len(vertices))

    def test_overlap_separate_demands_do_not_add(self):
        vertices = {2, 3, 5, 6, 30}
        e1, e2 = frozenset((2, 3, 6)), frozenset((5, 6, 30))
        es, alpha, tau = stats(vertices)
        self.assertIn(e1, es)
        self.assertIn(e2, es)
        self.assertEqual(stats(e1)[2], 1)
        self.assertEqual(stats(e2)[2], 1)
        self.assertEqual((alpha, tau), (4, 1))
        self.assertGreater(alpha + 2, len(vertices))

    def test_empty_graph_boundary(self):
        vertices = {1, 2}
        self.assertEqual(stats(vertices)[1:], (2, 0))
        self.assertEqual(joint(0), 0)


if __name__ == '__main__':
    unittest.main()
