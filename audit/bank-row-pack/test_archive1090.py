#!/usr/bin/env python3
import copy
import hashlib
import json
import lzma
import unittest
import archive1090 as a

class ArchiveTranslation(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        raw = a.ARCHIVE.read_bytes()
        if hashlib.sha256(raw).hexdigest() != a.SHA256:
            raise ValueError('digest')
        cls.bank = json.loads(lzma.decompress(raw))

    def test_literal_translation(self):
        sources, rows, cap, demand, support = a.translate(self.bank)
        self.assertEqual(rows, [(4,0,1,1,1),(8,0,7,1,1),(159,0,8,1,1),(0,2,1,1,1),(39,2,2,1,1),(208,3,3,1,1),(209,17,3,1,1)])
        self.assertEqual(sources, {0:[2,3,6],2:[4,5,20],3:[6,10,15],17:[3,4,12]})
        self.assertEqual((cap, demand, len(support)), (1,7,21))
        self.assertEqual(a.OUTPUT.read_text(), a.render((sources,rows,cap,demand,support)))

    def test_prior_reduces_dead_match_branches_before_decide(self):
        generated = a.render(a.translate(self.bank))
        self.assertIn('  split_ifs <;> dsimp only [UpperBridge.OrderedEdge] <;> decide', generated)
        self.assertIn('theorem prior (i : ℕ) : ArchiveDag.Check nodes i := by', generated)

    def test_invalid_mutations(self):
        mutations = [
            lambda b: b['nodes'][1090].update(rows=[]),
            lambda b: b['nodes'][1090]['rows'][0].__setitem__(0, True),
            lambda b: b['nodes'][1090]['rows'][0].__setitem__(1, 0),
            lambda b: b['nodes'][1090]['rows'][0].__setitem__(2, 0),
            lambda b: b['nodes'][1090]['rows'][1].__setitem__(0, 4),
            lambda b: b['images'][4].__setitem__(0, 1090),
            lambda b: b['images'][4].__setitem__(2, 2),
            lambda b: b['nodes'][0]['v'].__setitem__(0, True),
            lambda b: b['nodes'][0].__setitem__('r', True),
            lambda b: b['nodes'][1090]['rows'][0].__setitem__(1, 2),
        ]
        for mutate in mutations:
            b = copy.deepcopy(self.bank)
            mutate(b)
            with self.subTest(mutation=mutate):
                with self.assertRaises(ValueError):
                    a.translate(b)

    def test_exact_rational_and_normalization(self):
        b = copy.deepcopy(self.bank)
        # 1/2 weights turn capacity 1 into integer capacity 2.
        for row in b['nodes'][1090]['rows']:
            row[2] = 2
        _, rows, cap, demand, _ = a.translate(b)
        self.assertEqual((cap,demand), (2,4))
        self.assertEqual([r[4] for r in rows], [1]*7)
        b = copy.deepcopy(self.bank)
        for image_id, *_ in b['nodes'][1090]['rows']:
            b['images'][image_id][1] *= 2
        # Union gcd becomes 2: translating its normalized support restores
        # precisely the original scales, supports and target.
        self.assertEqual(a.translate(b), a.translate(self.bank))

if __name__ == '__main__':
    unittest.main()
