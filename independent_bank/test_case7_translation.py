import copy
import unittest
from pathlib import Path

import archive_prefix
import case7_translation

ROOT = Path(__file__).resolve().parents[1]

class Case7TranslationTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.bank = archive_prefix.load_bank()

    def test_actual_rows_and_generated_source(self):
        data = case7_translation.translate(self.bank)
        self.assertEqual(data['rows'], [([2, 3, 6], 1), ([4, 5, 20], 1),
                                       ([10, 15, 30], 1), ([12, 21, 28], 1)])
        self.assertEqual(case7_translation.render(data),
                         (ROOT / 'lean/ArchiveCase7.lean').read_text())

    def test_reusable_translator_handles_case4(self):
        import case_translation
        e = case_translation.EXPECTED
        data = case7_translation.translate_pinned_dual(
            self.bank, 4, e['case'], e['images'], e['sources'], e['source_indices'])
        self.assertEqual(data, case_translation.translate(self.bank))

    def test_mutations_rejected(self):
        for change in ('target', 'tree', 'reference', 'source', 'scale'):
            b = copy.deepcopy(self.bank)
            if change == 'target': b['nodes'][7]['r'] = 3
            if change == 'tree': b['nodes'][7]['tree'][0][2][0][1] -= 1
            if change == 'reference': b['nodes'][7]['cs'][0] = 0
            if change == 'source': b['nodes'][6]['v'][0] = 11
            if change == 'scale': b['images'][5][1] = 6
            with self.subTest(change=change), self.assertRaises(ValueError):
                case7_translation.translate(b)
