import unittest
from unittest.mock import patch
import seed_subset
from bank_interpreter import CheckError

from seed_subset import select_seed, collect
from seed_reconstruction import ranks, renew_level

class SeedSubsetTests(unittest.TestCase):
    def test_tie_is_deterministic_and_seed_strictly_needed(self):
        ws=[((3,9),1), ((3,9),1)]
        values, owners=select_seed(ws,ranks(12),0,12)
        self.assertEqual((values[9], owners[9]), (1,0))
        old,new,selected,runs=collect([0]*13,[0]*13,values,owners,3,[])
        self.assertEqual(selected,{0})
        self.assertEqual((old,new),renew_level([0]*13,[0]*13,values,3,[])[:2])
        self.assertTrue(any(r[3] & 8 and r[4] == 0 for r in runs))
    def test_nonseed_max_needs_no_source(self):
        values,owners=select_seed([((3,9),1)],ranks(12),0,12)
        old,new,selected,runs=collect([0]*13,[0]+[1]*12,values,owners,3,[])
        self.assertEqual(selected,set())
    def test_ties_report_all_active_sources(self):
        old,new,selected,runs=collect([0]*5,[0]*5,[0,1,0,0,0],[-1,7,-1,-1,-1],2,[[1,2]])
        self.assertEqual(runs[0],[1,2,1,12,7])
        self.assertEqual(selected,set())
    def test_witness_counts_rejected_before_replay(self):
        inputs = ({}, {'intervals': [[]] * 20}, [None] * 515, {'levels': [{}] * 20})
        for banks, exts in [(4105, 515), (4107, 515), (4106, 514), (4106, 516)]:
            with self.subTest(banks=banks, extensions=exts), \
                 patch.object(seed_subset, 'load_inputs', return_value=inputs), \
                 patch.object(seed_subset, 'verify', return_value=[None] * banks), \
                 patch.object(seed_subset, 'extensions', return_value=[None] * exts), \
                 patch.object(seed_subset, 'ranks', side_effect=RuntimeError('replay reached')):
                with self.assertRaises(CheckError):
                    seed_subset.build()

    def test_prime_count_rejected_before_replay(self):
        inputs = ({}, {'intervals': [[]] * 20}, [], {'levels': [{}] * 20})
        with patch.object(seed_subset, 'load_inputs', return_value=inputs), \
             patch.object(seed_subset, 'PRIMES', (2,) * 19), \
             patch.object(seed_subset, 'verify', side_effect=RuntimeError('verification reached')):
            with self.assertRaises(CheckError):
                seed_subset.build()

    def test_level_counts_rejected_before_replay(self):
        for interval_count, report_count in [(20, 0), (20, 19), (20, 21), (19, 20), (21, 20)]:
            with self.subTest(interval_count=interval_count, report_count=report_count):
                inputs = ({}, {'intervals': [[]] * interval_count}, [], {'levels': [{}] * report_count})
                with patch.object(seed_subset, 'load_inputs', return_value=inputs), \
                     patch.object(seed_subset, 'verify', return_value=[]), \
                     patch.object(seed_subset, 'extensions', return_value=[]), \
                     patch.object(seed_subset, 'ranks', side_effect=RuntimeError('replay reached')):
                    with self.assertRaises(CheckError):
                        seed_subset.build()

if __name__=='__main__': unittest.main()
