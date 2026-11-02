import copy
import json
import os
import subprocess
import sys
import unittest

import archive_prefix
import mixed_prefix_export as exporter


class MixedPrefixExportTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.bank = archive_prefix.load_bank()

    def test_actual_prefix_is_complete_and_deterministic(self):
        a = exporter.render(self.bank)
        self.assertEqual(a, exporter.render(self.bank))
        doc = json.loads(a)
        self.assertEqual(len(doc['nodes']), 1091)
        self.assertEqual([n['id'] for n in doc['nodes']], list(range(1091)))
        self.assertEqual(doc['counts'], {'basic': 1080, 'case_placeholder': 7, 'trim_placeholder': 3, 'pack': 1})
        self.assertEqual(doc['nodes'][1090]['kind'], 'pack')
        self.assertTrue(all(r['source'] < 1090 for r in doc['nodes'][1090]['rows']))
        self.assertEqual(doc['nodes'][4]['kind'], 'case_placeholder')
        self.assertEqual(doc['nodes'][5]['kind'], 'trim_placeholder')

    def test_mutated_in_memory_bank_does_not_claim_archive_provenance(self):
        bank = copy.deepcopy(self.bank)
        bank['nodes'][1089] = copy.deepcopy(bank['nodes'][0])
        doc = exporter.export(bank)
        self.assertEqual(doc['nodes'][1089]['archive'], bank['nodes'][0])
        self.assertNotIn('expected_source_sha256', doc)
        self.assertNotIn('source_sha256', doc)
        self.assertNotIn(archive_prefix.SHA256, exporter.render(bank))

    def test_every_reference_and_archive_payload_preserved(self):
        doc = exporter.export(self.bank)
        for item, original in zip(doc['nodes'], self.bank['nodes']):
            if item['kind'] != 'pack':
                self.assertEqual(item['archive'], original)
            refs = item.get('references', item.get('rows', []))
            expected = (original.get('cs', []) if item['kind'] == 'case_placeholder' else
                        [original['ref']] if item['kind'] == 'trim_placeholder' else
                        [r[0] for r in original['rows']] if item['kind'] == 'pack' else [])
            self.assertEqual([r['image'] for r in refs], expected)
            for r in refs:
                self.assertEqual([r['source'], r['mul'], r['div']], self.bank['images'][r['image']])
                self.assertLess(r['source'], item['id'])
            if item['kind'] == 'pack':
                self.assertEqual([[r['image'], r['numerator'], r['denominator']] for r in refs], original['rows'])

    def test_cli_reproducible_across_hash_seeds(self):
        path = exporter.__file__
        outputs = [subprocess.check_output([sys.executable, path], env=dict(os.environ, PYTHONHASHSEED=seed))
                   for seed in ('1', '17')]
        self.assertEqual(outputs[0], outputs[1])
        doc = json.loads(outputs[0])
        self.assertEqual(doc.pop('source_sha256'), archive_prefix.SHA256)
        self.assertEqual(doc, exporter.export(self.bank))
        self.assertEqual(json.loads(exporter.render(self.bank)), doc)

    def test_rejects_uncovered_and_malformed_input(self):
        for mutate in ('short', 'unknown', 'forward', 'extra', 'bool'):
            b = copy.deepcopy(self.bank)
            if mutate == 'short': b['nodes'] = b['nodes'][:1090]
            if mutate == 'unknown': b['nodes'][0]['t'] = 'mystery'
            if mutate == 'forward': b['images'][b['nodes'][1090]['rows'][0][0]][0] = 1090
            if mutate == 'extra': b['nodes'][0]['extra'] = 1
            if mutate == 'bool': b['nodes'][0]['r'] = True
            with self.subTest(mutate=mutate), self.assertRaises(ValueError):
                exporter.render(b)


if __name__ == '__main__': unittest.main()
