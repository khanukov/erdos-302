import unittest
from suffix_factorization import split, cell_count, multiplicities

class SuffixFactorizationTests(unittest.TestCase):
    def test_exact_local_count_and_inverse(self):
        for n in range(21):
            for a in range(1, 5):
                for b in range(1, 6):
                    self.assertEqual(cell_count(n, a, b, [3]), sum(multiplicities(n, a, b, [3], [2, 5]).values()))
        self.assertEqual(split(60, [2, 5]), (3, 20))

    def test_multiplicity_and_boundaries(self):
        self.assertEqual(multiplicities(3, 1, 4, [], [3])[1], 2)
        self.assertEqual(cell_count(0, 1, 1, []), 0)
        self.assertEqual(cell_count(10, 3, 3, []), 0)

    def test_factor_pairs_are_bijective(self):
        from math import gcd
        for n in range(31):
            for m in range(1, n + 1):
                if gcd(m, 3) != 1:
                    continue
                q, t = split(m, [2, 5])
                self.assertEqual(q * t, m)
                self.assertEqual(gcd(q, 30), 1)
                self.assertLessEqual(t, n // q)
                candidates = [(x, y) for x in range(1, n + 1)
                              for y in range(1, n // x + 1)
                              if x * y == m and gcd(x, 30) == 1
                              and split(y, [2, 5])[0] == 1]
                self.assertEqual(candidates, [(q, t)])
                for a in range(1, 5):
                    for b in range(1, 5):
                        self.assertEqual(a <= n // m < b,
                                         n // b < m <= n // a)

    def test_invalid_prime_partition(self):
        for prefix, suffix in [([2], [2]), ([4], [3]), ([], [1])]:
            with self.assertRaises(ValueError):
                multiplicities(10, 1, 4, prefix, suffix)
        with self.assertRaises(ValueError):
            split(0, [2])
        with self.assertRaises(ValueError):
            cell_count(10, 0, 1, [])

if __name__ == '__main__':
    unittest.main()
