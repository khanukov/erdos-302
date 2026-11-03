import re
import unittest
import node1209_capacity as c

class CapacityGeneration(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.files = c.generate()

    def test_inventory_and_occurrences(self):
        self.assertEqual(len(self.files), 93)
        text = self.files['Node1209CapacityData.lean'].decode()
        occurrences = re.findall(r'ArchiveScaling\.image Node1209Rows\d{3}\.source(\d+)', text)
        self.assertEqual(list(map(int, occurrences)), list(range(510)))
        self.assertEqual(sum(len(re.findall(rb'theorem vertex\d+ :', v)) for k,v in self.files.items()), 901)
        self.assertIn('Node1209Rows000.target', text)

    def test_reject_mutations_and_missing_shards(self):
        for name in ['Node1209CapacityData.lean', 'Node1209Capacity000.lean', 'Node1209CapacityAll.lean']:
            changed = dict(self.files)
            changed[name] += b'-- mutation\n'
            with self.assertRaises(ValueError): c.check_files(self.files, changed)
        changed = dict(self.files)
        del changed['Node1209Capacity090.lean']
        with self.assertRaises(ValueError): c.check_files(self.files, changed)

if __name__ == '__main__': unittest.main()
