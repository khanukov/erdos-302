import copy
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest import mock
import node1209_closure as closure
import node1209_direct as direct

class DirectTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.doc = closure.extract()

    def test_regeneration(self):
        self.assertEqual(direct.OUT.read_bytes(), direct.generate(self.doc).encode())

    def test_source_bound_avoids_reserved_prefix_identifier(self):
        text = direct.generate(self.doc)
        self.assertIn('(prefixChecks : ∀ i < 375,', text)
        self.assertIn('Node1209Dense.nodes 375 prefixChecks 374', text)
        self.assertNotRegex(text, r'\(prefix\s*:')

    def test_subset_uses_shared_literal_fold(self):
        text = direct.generate(self.doc)
        self.assertIn('theorem fold_insert_subset', text)
        self.assertIn('private def sharedPrefix : List ℕ', text)
        self.assertIn('fold_insert_subset sharedPrefix', text)
        self.assertNotIn('support ⊆ Node1209SourceCandidate.node.support := by\n  decide', text)
        literal = text.split('private def sharedPrefix : List ℕ := [', 1)[1].split(']', 1)[0]
        prefix = [int(value) for value in literal.split(', ')]
        child, root = (node['support'] for node in self.doc['nodes'][374:376])
        self.assertEqual(prefix, child[:-1])
        self.assertEqual(root, prefix + [child[-1], 1892, 1900])
        self.assertIn(f'({{{child[-1]}}} : Finset ℕ)', text)
        self.assertIn(f'({{{child[-1]}, 1892, 1900}} : Finset ℕ)', text)

    def test_support_and_demand_mutations_rejected(self):
        for field, value in [('original', 1191), ('demand', 257), ('support', [])]:
            doc = copy.deepcopy(self.doc)
            doc['nodes'][374][field] = value
            with self.subTest(field=field), self.assertRaises(ValueError):
                direct.generate(doc)

    def test_root_mutations_rejected(self):
        doc = copy.deepcopy(self.doc)
        doc['nodes'][375]['support'].remove(1892)
        with self.assertRaises(ValueError):
            direct.generate(doc)

    def test_coordinated_shared_support_mutation_rejected(self):
        doc = copy.deepcopy(self.doc)
        child, root = doc['nodes'][374:376]
        removed = child['support'][0]
        replacement = max(root['support']) + 1
        for node in (child, root):
            node['support'][node['support'].index(removed)] = replacement
            node['support'].sort()
        with self.assertRaises(ValueError):
            direct.generate(doc)

    def test_artifact_mutation_rejected(self):
        with TemporaryDirectory() as tmp:
            artifact = Path(tmp) / 'DirectCandidate.lean'
            artifact.write_bytes(b'corrupt')
            with mock.patch.object(direct, 'OUT', artifact), mock.patch('sys.argv', ['node1209_direct.py', '--check']):
                with self.assertRaisesRegex(ValueError, 'direct candidate bytes mismatch'):
                    direct.main()

if __name__ == '__main__':
    unittest.main()
