import unittest
import node1209_dense as dense
import node1209_closure as closure

class DenseTests(unittest.TestCase):
    def test_inventory_and_occurrences(self):
        doc = closure.extract()
        text = dense.generate(doc)
        self.assertEqual(text.count(' => ⟨'), 377)  # 376 nodes plus explicit default
        self.assertIn('.pack 510 ![', text)
        self.assertIn('theorem check0 : MixedDag.Check', text)
        self.assertEqual(text.count('theorem check'), 368)

    def test_rejects_external_or_forward_reference(self):
        doc = closure.extract()
        doc['nodes'][-1]['references'][0]['dense_source'] = 375
        with self.assertRaises(ValueError):
            dense.generate(doc)

    def test_rejects_occurrence_loss(self):
        doc = closure.extract()
        doc['nodes'][-1]['references'].pop()
        with self.assertRaises(ValueError):
            dense.generate(doc)

if __name__ == '__main__': unittest.main()
