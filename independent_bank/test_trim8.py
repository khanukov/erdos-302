import copy
import unittest
import archive_prefix
import trim8

class Trim8Tests(unittest.TestCase):
    def setUp(self):
        self.bank = archive_prefix.load_bank()

    def test_archive(self):
        d = trim8.translate(self.bank)
        self.assertEqual(d['support'], [2,3,4,5,6,8,10,12,15,20,21,24,28,30])
        self.assertEqual(d['demand'], 4)
        self.assertEqual(d['removed'], [7,14,16])
        self.assertEqual(d['image'], [7,1,1])

    def test_mutations_fail_closed(self):
        changes = [lambda b: b['nodes'][8].update(ref=True),
                   lambda b: b['nodes'][8].update(ref=6),
                   lambda b: b['nodes'][8].update(extra=0),
                   lambda b: b['images'][7].__setitem__(0, True),
                   lambda b: b['images'][7].__setitem__(1, 2),
                   lambda b: b['nodes'][7].update(r=3),
                   lambda b: b['nodes'][0].update(r=2),
                   lambda b: b['images'][4].__setitem__(1, 2),
                   lambda b: b['nodes'][6].update(v=[1,2,3])]
        for change in changes:
            bank = copy.deepcopy(self.bank)
            change(bank)
            with self.subTest(change=change), self.assertRaises(ValueError):
                trim8.translate(bank)

    def test_generated_source(self):
        self.assertEqual(trim8.render(self.bank), trim8.TARGET.read_text())

if __name__ == '__main__': unittest.main()
