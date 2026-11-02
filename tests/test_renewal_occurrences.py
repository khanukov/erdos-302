import unittest
from renewal_occurrences import values, occurrences, hcover

class RenewalOccurrencesTest(unittest.TestCase):
    def test_twenty_levels_and_zero(self):
        primes = [3,2,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71]
        d = lambda j,n: (j+1) if n and n <= 4 else 0
        u = values(primes,d,9)
        for n in range(10):
            self.assertEqual(u[-1][n], sum(d(j, n//t) for j,t in occurrences(primes,n)))

    def test_duplicate_cell_contributions_are_not_deduplicated(self):
        self.assertEqual(occurrences([3],3).count((0,1)),1)
        self.assertEqual(sum(1 for j,t in occurrences([3],3) if 1 <= 3//t < 4),2)

    def test_empty_and_zero(self):
        self.assertEqual(occurrences([],7),[])
        self.assertEqual(occurrences([3],0),[])

    def test_overlapping_joint_allocation_and_wrong_counts(self):
        heights = [1, 1]
        multiplicities = [[2], [1]]
        counts = [2, 1]
        self.assertEqual(hcover(heights, multiplicities, counts), 3)
        weighted_at_block = sum(h * row[0] for h, row in zip(heights, multiplicities))
        self.assertTrue(all(h * row[0] <= 2 for h, row in zip(heights, multiplicities)))
        self.assertGreater(weighted_at_block, 2)
        self.assertLessEqual(weighted_at_block, 3)
        with self.assertRaises(ValueError):
            hcover(heights, multiplicities, [2, 2])

    def test_three_analytic_occurrences_two_rough_support_points(self):
        # Q={3}, N=3: each integer has one maximal 3-smooth divisor.
        rough_factors = []
        for x in range(1, 4):
            q = x
            while q % 3 == 0:
                q //= 3
            rough_factors.append(q)
        self.assertEqual(rough_factors, [1, 2, 1])
        self.assertEqual(len(rough_factors), 3)
        self.assertEqual(len(set(rough_factors)), 2)

    def test_matching_is_per_cell_and_rejects_bad_count(self):
        self.assertEqual(hcover([1,1], [[2,0],[0,1]], [2,1]),3)
        with self.assertRaises(ValueError): hcover([1,1], [[2,0],[0,1]], [1,2])
        with self.assertRaises(ValueError): hcover([1,1], [[2,1]], [2])

if __name__ == '__main__': unittest.main()
