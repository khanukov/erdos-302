#!/usr/bin/env python3
"""Independent finite sanity checks; not a Lean proof or archive replay."""
import itertools
import unittest

class CandidateSanity(unittest.TestCase):
    def test_positive_demand(self):
        vertices = {2, 3, 6, 8, 12, 24}
        rows = [{2, 3, 6}, {8, 12, 24}]
        self.assertFalse(rows[0] & rows[1])
        edges = [e for e in itertools.combinations(sorted(vertices), 3)
                 if e[1] * e[2] == e[0] * (e[1] + e[2])]
        covers = [set(s) for k in range(len(vertices) + 1)
                  for s in itertools.combinations(sorted(vertices), k)
                  if all(set(e) & set(s) for e in edges)]
        self.assertEqual(min(map(len, covers)), 2)
        self.assertTrue(all(tuple(sorted(row)) in edges for row in rows))

    def test_occurrences_not_unique_sources(self):
        rows = [(0, {2, 3, 6}, 1), (0, {2, 3, 6}, 1)]
        self.assertEqual(len({r[0] for r in rows}), 1)
        self.assertEqual(sum(w for _, s, w in rows if 2 in s), 2)

if __name__ == '__main__':
    unittest.main()
