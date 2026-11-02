import copy
import unittest
from collections import Counter
from fractions import Fraction
from math import gcd, lcm

import mixed_full_export
import verify_bank


class FullExportTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        path = verify_bank.Path(__file__).resolve().parents[1] / 'input/erdos302_boundary_certificates_publication.zip'
        cls.bank, intervals = verify_bank.load_archive(path)
        cls.doc = mixed_full_export.export(cls.bank, intervals)
        cls.intervals = intervals

    def test_full_actual_data_and_occurrences(self):
        nodes = self.doc['nodes']
        self.assertEqual(self.doc['counts'], verify_bank.COUNTS)
        self.assertEqual([n['id'] for n in nodes], list(range(4106)))
        self.assertEqual(sum(len(n.get('references', [])) for n in nodes), 623846)
        outside_cases, outside_refs = set(), 0
        for n, original in zip(nodes, self.bank['nodes']):
            self.assertEqual(n['archive'], original)
            kind = n['kind']
            expected = ([r[0] for r in original['rows']] if kind in ('pack', 'qpack') else
                        original['cs'] if kind == 'case' else [original['ref']] if kind == 'trim' else [])
            refs = n.get('references', [])
            self.assertEqual([r['image'] for r in refs], expected)
            loads = Counter()
            objective = 0
            raw = []
            denominator = (lcm(*(row[2] for row in original['rows']))
                           if kind == 'qpack' else 1)
            for pos, r in enumerate(refs):
                self.assertEqual([r['source'], r['mul'], r['div']], self.bank['images'][r['image']])
                self.assertLess(r['source'], n['id'])
                source = nodes[r['source']]
                self.assertTrue(all(v*r['mul'] % r['div'] == 0 for v in source['support']))
                image = [v*r['mul']//r['div'] for v in source['support']]
                if kind == 'case' and set(image) - set(original['v']):
                    outside_cases.add(n['id']); outside_refs += 1
                if kind in ('pack', 'qpack'):
                    raw.extend(image)

                    expected_weight = Fraction(original['rows'][pos][1],
                                               original['rows'][pos][2] if kind == 'qpack' else 1)
                    self.assertEqual(Fraction(n['weights'][pos], denominator), expected_weight)
                    self.assertTrue(all(v % n['normalizer'] == 0 for v in image))
                    w = n['weights'][pos]
                    objective += w * source['demand']
                    for v in image: loads[v//n['normalizer']] += w
            if kind in ('pack', 'qpack'):
                self.assertEqual(n['normalizer'], gcd(*raw))
                self.assertEqual(n['capacity'], denominator * (original['D'] if kind == 'pack' else 1))
                self.assertEqual(sorted(loads), n['support'])
                self.assertLessEqual(max(loads.values()), n['capacity'])
                self.assertEqual(-(-objective//n['capacity']), n['demand'])
        self.assertEqual((len(outside_cases), outside_refs), (89, 789))
        self.assertEqual([(n['id'], n['assumed_external_bound']['n'], n['demand']) for n in nodes if n['kind']=='externalActive'],
                         [(1097,420,71), (1107,644,102), (1112,806,124), (1114,814,125)])
        self.assertTrue(self.doc['external_bounds_are_assumptions'])
        self.assertNotIn('source_archive_sha256', self.doc)

    def test_mutations_fail_closed(self):
        for mutation in ('forward', 'unsupported', 'external'):
            b = copy.deepcopy(self.bank)
            if mutation == 'forward':
                j = b['nodes'][1090]['rows'][0][0]; b['images'][j][0] = 1090
            elif mutation == 'unsupported': b['nodes'][2000]['t'] = 'unknown'
            else: b['nodes'][1097]['n'] = 421
            with self.subTest(mutation=mutation), self.assertRaises(ValueError):
                mixed_full_export.export(b, self.intervals)

    def test_rejects_float_split_vertex(self):
        b = copy.deepcopy(self.bank)
        for node in b['nodes']:
            if node['t'] == 'case':
                for entry in node['tree']:
                    if entry[0] == 'split':
                        entry[1] = float(entry[1])
                        with self.assertRaises(ValueError):
                            mixed_full_export.export(b, self.intervals)
                        return
        self.fail('no suitable actual case')

    def test_export_is_detached_from_mutable_input(self):
        b = copy.deepcopy(self.bank)
        doc = mixed_full_export.export(b, self.intervals)
        old = copy.deepcopy(doc['nodes'][0]['archive'])
        b['nodes'][0]['v'][0] += 1
        self.assertEqual(doc['nodes'][0]['archive'], old)

    def test_archive_digest_and_duplicate_keys(self):
        with self.assertRaises(ValueError):
            verify_bank.check_hash(b'not the publication archive')
        with self.assertRaises(ValueError):
            verify_bank.unique_object([('key', 1), ('key', 2)])


if __name__ == '__main__': unittest.main()
