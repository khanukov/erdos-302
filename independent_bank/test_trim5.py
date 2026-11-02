import copy
import unittest
import archive_prefix
import trim5

class Trim5Tests(unittest.TestCase):
    def setUp(self):
        self.bank = archive_prefix.load_bank()

    def test_archive_translation(self):
        data = trim5.translate(self.bank)
        self.assertEqual(data['support'], [2,3,4,5,6,8,10,12,15,20,24])
        self.assertEqual(data['demand'], 3)
        self.assertEqual(data['removed'], [7,14,16,21])

    def test_invalid_trim_and_image_rejected(self):
        for mutate in (lambda b: b['nodes'][5].update(ref=2),
                       lambda b: b['nodes'][5].update(extra=1),
                       lambda b: b['images'][3].__setitem__(0, 5),
                       lambda b: b['images'][3].__setitem__(1, True),
                       lambda b: b['images'][3].__setitem__(2, 2),
                       lambda b: b['nodes'][4].update(r=4)):
            bank = copy.deepcopy(self.bank)
            mutate(bank)
            with self.assertRaises(ValueError): trim5.translate(bank)

    def test_ordered_edge_decidable_in_generated_proofs(self):
        source = trim5.render(self.bank)
        for name in ('all_edges_retained', 'witnesses_valid'):
            proof = source.split('theorem ' + name, 1)[1].split('\ntheorem ', 1)[0]
            self.assertIn('unfold OrderedEdge', proof)

    def test_generated_source_matches(self):
        self.assertEqual(trim5.render(self.bank), trim5.TARGET.read_text())

if __name__ == '__main__': unittest.main()
