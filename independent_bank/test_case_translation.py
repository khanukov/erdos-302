import copy
import unittest
from pathlib import Path

from verify_bank import load_archive
from case_translation import translate, render, TranslationError

ARCHIVE = Path(__file__).resolve().parents[1] / 'input/erdos302_boundary_certificates_publication.zip'

class CaseTranslationTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.bank, _ = load_archive(ARCHIVE)

    def test_exact_case(self):
        x = translate(self.bank)
        self.assertEqual(x['support'], [2,3,4,5,6,7,8,10,12,14,15,16,20,21,24])
        self.assertEqual(x['demand'], 3)
        self.assertEqual(x['rows'], [([4,5,20],1), ([6,10,15],1), ([8,12,24],1)])
        text = render(x)
        self.assertIn('BankCase.check rows target ∅ ∅ demand tree = true', text)
        self.assertIn('BankCase.Tree.dual', text)
        self.assertIn('def imageRefs', text)
        self.assertIn('def sourceNodes', text)
        self.assertEqual(text, render(translate(self.bank)))
        self.assertEqual(text, (ARCHIVE.parents[1] / 'lean/ArchiveCase4.lean').read_text())

    def test_brute_force_rows_rule_out_small_cover(self):
        from itertools import combinations
        x = translate(self.bank)
        for size in range(x['demand']):
            for chosen in combinations(x['support'], size):
                selected = set(chosen)
                self.assertFalse(all(len(selected.intersection(s)) >= r for s, r in x['rows']))

    def test_reject_mutated_transitive_inputs(self):
        for change in ('support', 'demand', 'tree', 'cs', 'scale', 'source'):
            b = copy.deepcopy(self.bank)
            if change == 'support': b['nodes'][4]['v'][0] = 1
            if change == 'demand': b['nodes'][4]['r'] = 2
            if change == 'tree': b['nodes'][4]['tree'][0][2][0][1] -= 1
            if change == 'cs': b['nodes'][4]['cs'][0] = 1
            if change == 'scale': b['images'][0][1] = 2
            if change == 'source': b['nodes'][2]['r'] = 2
            with self.subTest(change=change), self.assertRaises(TranslationError): translate(b)

if __name__ == '__main__': unittest.main()
