import copy
import subprocess
import sys
import unittest

import archive_prefix
import mixed_prefix_export
import mixed_lean_producer as producer


class MixedLeanProducerTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.doc = mixed_prefix_export.export(archive_prefix.load_bank())

    def test_authentic_prefix_deterministic_and_complete(self):
        text = producer.render(self.doc)
        self.assertEqual(text, producer.render(self.doc))
        self.assertEqual(text.count('  | '), 1092)
        self.assertIn('  | 1090 => ', text)
        self.assertIn('  | _ => ⟨∅, 0, .small⟩', text)
        self.assertIn('theorem prefix_target', text)
        self.assertEqual(producer.reference_count(self.doc), 371)
        self.assertIn('NOT COMPILED', text)

    def test_reference_occurrences_preserved_in_order(self):
        import re
        text = producer.render(self.doc)
        matches = re.findall(r'^  \| (\d+|_) => (.*)$', text, re.M)
        emitted = {int(i): body for i, body in matches if i != '_'}
        observed = 0
        for node in self.doc['nodes']:
            if node['kind'] not in ('case_placeholder', 'trim_placeholder', 'pack'):
                continue
            refs = node.get('references', node.get('rows', []))
            body = emitted[node['id']]
            if node['kind'] == 'pack':
                body = body.split('![', 1)[1].split(']', 1)[0]
                actual = [tuple(map(int, t)) for t in re.findall(r'⟨(\d+), (\d+), (\d+), \d+⟩', body)]
                norm = node['normalizer']
            else:
                body = body.split('(.caseRule [', 1)[1].split(']', 1)[0] if node['kind'] == 'case_placeholder' else body.split('(.trimRule ', 1)[1]
                actual = [tuple(map(int, t)) for t in re.findall(r'⟨(\d+), (\d+), (\d+)⟩', body)]
                norm = 1  # All case/trim normalizers in this authentic prefix are one.
            self.assertEqual(actual, [(r['source'], r['mul'], r['div'] * norm) for r in refs])
            observed += len(actual)
        self.assertEqual(observed, 371)

    def test_rejects_forward_reference(self):
        doc = copy.deepcopy(self.doc)
        doc['nodes'][4]['references'][0]['source'] = 4
        with self.assertRaises(ValueError):
            producer.render(doc)

    def test_cli_pinned_archive_header_and_body(self):
        result = subprocess.run([sys.executable, producer.__file__], capture_output=True, text=True, check=True)
        header = f'/- CLI loaded pinned archive SHA-256 {archive_prefix.SHA256}; transcription is not a provenance proof. -/\n'
        self.assertEqual(result.stdout, header + producer.render(self.doc))
        self.assertEqual(result.stderr, '')

    def test_in_memory_render_does_not_claim_provenance(self):
        doc = copy.deepcopy(self.doc)
        doc['nodes'][36]['demand'] = 1
        text = producer.render(doc)
        self.assertNotIn(archive_prefix.SHA256, text)
        self.assertIn('conditional on prefixTarget', text)

    def test_rejects_unsupported_tree_constructor(self):
        doc = copy.deepcopy(self.doc)
        doc['nodes'][4]['archive']['tree'][0][0] = 'unknown'
        with self.assertRaises(ValueError):
            producer.render(doc)

    def test_rejects_unrepresentable_case_image(self):
        doc = copy.deepcopy(self.doc)
        doc['nodes'][4]['support'].remove(24)
        with self.assertRaises(ValueError):
            producer.render(doc)


if __name__ == '__main__':
    unittest.main()
