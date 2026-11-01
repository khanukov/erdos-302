import importlib.util
from pathlib import Path
import unittest

spec = importlib.util.spec_from_file_location('verify', Path(__file__).with_name('verify.py'))
v = importlib.util.module_from_spec(spec)
spec.loader.exec_module(v)

class Checks(unittest.TestCase):
    def test_inventory_and_shards(self):
        _, items = v.inventory()
        ids = [i for i, _ in items]
        self.assertEqual(len(ids), 2786)
        self.assertEqual(len(set(ids)), 2786)
        self.assertIn(4022, ids)
        shards = [{i for i in ids if i % v.SHARDS == k} for k in range(v.SHARDS)]
        self.assertEqual(set.union(*shards), set(ids))
        self.assertEqual(sum(map(len, shards)), len(ids))
        self.assertTrue(all(shards))

    def test_generated_literal(self):
        result = v.source_for([(42, {'v': [6, 10, 15], 'r': 1})])
        self.assertIn('bank_node_42 : Checked [6, 10, 15] [(0, 1, 2)] 1 := by decide', result)
        self.assertIn('#print axioms bank_node_42', result)
        with self.assertRaises(ValueError):
            v.source_for([(1, {'v': [1, 2, 3], 'r': 1})])

    def test_axiom_filter(self):
        v.check_axioms("'A' does not depend on any axioms\n", ['A'])
        v.check_axioms("'A' depends on axioms: [propext]\n", ['A'])
        for text in ["", "'A' depends on axioms: [sorryAx]", "'A' depends on axioms: [Classical.choice]", "'A' does not depend on any axioms\n'A' does not depend on any axioms", "'A' does not depend on any axioms\nerror: bad"]:
            with self.assertRaises(ValueError):
                v.check_axioms(text, ['A'])

if __name__ == '__main__':
    unittest.main()
