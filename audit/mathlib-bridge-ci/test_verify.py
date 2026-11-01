import unittest
import verify

class Tests(unittest.TestCase):
    def test_shards_exact_partition(self):
        data = verify.inventory()
        parts = [verify.shard(data, i) for i in range(verify.SHARDS)]
        indices = [i for part in parts for i, _ in part]
        self.assertEqual(len(indices), 3528)
        self.assertEqual(len(set(indices)), 3528)
        self.assertTrue(all(parts))

    def test_rejects_bad_axioms(self):
        with self.assertRaises(ValueError):
            verify.check_axioms("'Archive.cover_1' depends on axioms: [sorryAx]", ['Archive.cover_1'])
        with self.assertRaises(ValueError):
            verify.check_axioms('', ['Archive.cover_1'])

    def test_source_contains_bridge_application(self):
        text = verify.source_for([(7, {'v':[2,3,6], 'r':1})])
        self.assertIn('SmallStd.finite_card_bound', text)
        self.assertIn('#print axioms finite_7', text)
        self.assertNotIn('native_decide', text)

if __name__ == '__main__': unittest.main()
