import unittest
import generator

class Tests(unittest.TestCase):
    def test_edges(self):
        self.assertEqual(generator.edges([2,3,4,6,12]), [(2,3,6),(3,4,12),(4,6,12)])
    def test_source_index(self):
        text = generator.theorem(17, {"t":"small", "v":[2,3,6], "r":1})
        self.assertIn("bank_node_17", text)
        self.assertIn("OrderedCover ({2, 3, 6}", text)
    def test_bad_input_fails(self):
        with self.assertRaises(ValueError): generator.validate({"t":"small", "v":[2,2,6], "r":1})
if __name__ == "__main__": unittest.main()
