import itertools
import unittest
from sparse_boundary import boundary, outside_edges, read_witness

class SparseBoundaryTests(unittest.TestCase):
    def test_exhaustive_small_sets(self):
        vertices = range(1, 9)
        edges = [(a,b,c) for a,b,c in itertools.combinations(vertices, 3) if b*c == a*(b+c)]
        for mask in range(1 << 8):
            s = {v for v in vertices if mask & (1 << (v-1))}
            for t in (s, set(), {v for v in s if v % 2}):
                for u in (set(), s-t, {v for v in s-t if v % 2 == 0}):
                    expected = all(set(e) <= t or bool(set(e) & u) for e in edges if set(e) <= s)
                    self.assertEqual(boundary(s,t,u), expected)
                    self.assertEqual(outside_edges(s,s-t), {e for e in edges if set(e) <= s and not set(e) <= t})

    def test_rejects_invalid_subsets(self):
        self.assertFalse(boundary({2,3,6}, {2,7}, set()))
        self.assertFalse(boundary({2,3,6}, {2,3}, {2}))

    def test_missing_hit_is_detected(self):
        self.assertFalse(boundary({2,3,6}, {2,3}, set()))
        self.assertTrue(boundary({2,3,6}, {2,3}, {6}))

    def test_literal_witness(self):
        s,t,u = read_witness()
        self.assertEqual((len(s),len(t),len(s-t),len(u)), (901,837,64,16))
        self.assertEqual(len(outside_edges(s,s-t)), 44)
        self.assertTrue(boundary(s,t,u))

if __name__ == '__main__': unittest.main()
