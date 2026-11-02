import copy
import re
import unittest

import mixed_full_export
import mixed_full_producer as producer
import verify_bank


class FullProducerTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        path = verify_bank.Path(__file__).resolve().parents[1] / 'input/erdos302_boundary_certificates_publication.zip'
        cls.bank, cls.intervals = verify_bank.load_archive(path)
        cls.doc = mixed_full_export.export(cls.bank, cls.intervals)
        cls.text = producer.render(cls.bank, cls.intervals)

    def test_complete_deterministic_conditional_output(self):
        self.assertEqual(self.text, producer.render(self.bank, self.intervals))
        self.assertEqual(len(re.findall(r'^  \| \d+ => ', self.text, re.M)), 4106)
        self.assertIn('externalBounds : Prop', self.text)
        self.assertIn('NOT COMPILED', self.text)
        self.assertIn('∀ i < 4106', self.text)

    def test_all_reference_occurrences(self):
        lines = {int(i): body for i, body in re.findall(r'^  \| (\d+) => (.*)$', self.text, re.M)}
        count = 0
        for n in self.doc['nodes']:
            refs = n.get('references', [])
            if not refs: continue
            body = lines[n['id']]
            if n['kind'] in ('pack', 'qpack'):
                body = body.split('![', 1)[1].split(']', 1)[0]
                entries = [tuple(map(int, x)) for x in re.findall(r'⟨(\d+), (\d+), (\d+), (\d+)⟩', body)]
                actual = [entry[:3] for entry in entries]
                self.assertEqual([entry[3] for entry in entries], n['weights'])
                self.assertIn(f'] {n["capacity"]}', lines[n['id']])
                norm = n['normalizer']
            else:
                body = body.split('(.caseRule [', 1)[1].split(']', 1)[0] if n['kind'] == 'case' else body.split('(.trimRule ', 1)[1]
                actual = [tuple(map(int, x)) for x in re.findall(r'⟨(\d+), (\d+), (\d+)⟩', body)]
                from math import gcd
                norm = gcd(*n['archive']['v']) if n['kind'] == 'case' else producer.trim_normalizer(n, self.doc['nodes'])
            self.assertEqual(actual, [(r['source'], r['mul'], r['div'] * norm) for r in refs])
            count += len(actual)
        self.assertEqual(count, 623846)

    def test_outside_case_uses_signed_residual(self):
        self.assertIn('BankCase.Residual', self.text)
        self.assertEqual(producer.case_constraint([2, 3, 6], [2], 1), '({2}, (-1))')
        lines = {int(i): body for i, body in re.findall(r'^  \| (\d+) => (.*)$', self.text, re.M)}
        checked = 0
        from math import gcd
        for n in self.doc['nodes']:
            if n['kind'] != 'case': continue
            used = set()
            for entry in n['archive']['tree']:
                if entry[0] in ('row', 'force'): used.add(entry[1])
                if entry[0] == 'dual': used.update(pair[0] for pair in entry[2])
            norm = gcd(*n['archive']['v'])
            for index in used:
                r = n['references'][index]
                image = {v // norm for v in producer.raw_image(r, self.doc['nodes'])}
                if image - set(n['support']):
                    expected = producer.case_constraint(image, n['support'], self.doc['nodes'][r['source']]['demand'])
                    self.assertTrue(expected in lines[n['id']])
                    checked += 1
        self.assertGreater(checked, 0)

    def test_bad_input_rejected(self):
        b = copy.deepcopy(self.bank)
        b['nodes'][1097]['n'] = 421
        with self.assertRaises(ValueError): producer.render(b, self.intervals)


if __name__ == '__main__': unittest.main()
