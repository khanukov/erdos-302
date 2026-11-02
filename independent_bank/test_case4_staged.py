import copy
import unittest

import archive_prefix
import case4_staged


class Case4StagedTests(unittest.TestCase):
    def test_pinned_case_and_generated_fixture(self):
        bank = archive_prefix.load_bank()
        self.assertEqual(case4_staged.render(bank), case4_staged.TARGET.read_text())

    def test_mutations_rejected(self):
        bank = archive_prefix.load_bank()
        for change in ('source', 'image', 'case', 'tree'):
            b = copy.deepcopy(bank)
            if change == 'source': b['nodes'][2]['r'] = 2
            if change == 'image': b['images'][2][1] = 3
            if change == 'case': b['nodes'][4]['r'] = 2
            if change == 'tree': b['nodes'][4]['tree'][0][2][0][1] = 0
            with self.subTest(change=change), self.assertRaises(ValueError):
                case4_staged.render(b)


if __name__ == '__main__':
    unittest.main()
