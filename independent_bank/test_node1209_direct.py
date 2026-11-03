import copy
import unittest
from pathlib import Path
from unittest import mock
import node1209_closure as closure
import node1209_direct as direct

class DirectTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.doc = closure.extract()

    def test_regeneration(self):
        self.assertEqual(direct.OUT.read_bytes(), direct.generate(self.doc).encode())

    def test_support_and_demand_mutations_rejected(self):
        for field, value in [('original', 1191), ('demand', 257), ('support', [])]:
            doc = copy.deepcopy(self.doc)
            doc['nodes'][374][field] = value
            with self.subTest(field=field), self.assertRaises(ValueError):
                direct.generate(doc)

    def test_root_mutations_rejected(self):
        doc = copy.deepcopy(self.doc)
        doc['nodes'][375]['support'].remove(1892)
        with self.assertRaises(ValueError):
            direct.generate(doc)

    def test_artifact_mutation_rejected(self):
        with mock.patch.object(Path, 'read_bytes', return_value=b'corrupt'), mock.patch('sys.argv', ['node1209_direct.py', '--check']):
            with self.assertRaises(ValueError):
                direct.main()

if __name__ == '__main__':
    unittest.main()
