import copy
import unittest
from unittest import mock
import archive_prefix
import node1190_min as m

class ClosureTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.bank = archive_prefix.load_bank()
        cls.doc = m.extract(cls.bank)

    def test_exact_ancestry_and_artifacts(self):
        self.assertEqual(len(self.doc['nodes']), 337)
        self.assertEqual(self.doc['nodes'][-1]['original'], 1190)
        m.check(self.bank)

    def test_shared_support_mutation_rejected(self):
        candidate = copy.deepcopy(self.doc)
        candidate['nodes'][-1]['support'][0] += 1
        with self.assertRaises(ValueError):
            m.validate(self.bank, candidate)

    def test_occurrence_mutation_rejected(self):
        candidate = copy.deepcopy(self.doc)
        node = next(n for n in candidate['nodes'] if len(n['references']) > 1)
        node['references'][0], node['references'][1] = node['references'][1], node['references'][0]
        with self.assertRaises(ValueError):
            m.validate(self.bank, candidate)

    def test_shared_vertex_replacement_rejected(self):
        root_doc = __import__('node1209_closure').extract()
        child, root = root_doc['nodes'][374:376]
        vertex = min(set(child['support']) & set(root['support']))
        candidate = copy.deepcopy(self.doc)
        candidate['nodes'][-1]['support'].remove(vertex)
        candidate['nodes'][-1]['support'].append(max(root['support']) + 1)
        with self.assertRaises(ValueError):
            m.validate(self.bank, candidate)

    def test_shard_coverage_and_contract(self):
        import re
        files = m.files(self.bank)
        shards = sorted(n for n in files if re.fullmatch(r'Shard\d{3}_\d{3}\.lean', n))
        self.assertEqual(len(shards), 30)
        covered = []
        for filename in shards:
            name = filename[:-5]
            a, b = map(int, name[5:].split('_'))
            covered.extend(range(a, b))
            text = files[filename]
            self.assertIn(f'theorem {name} : ∀ i, {a} ≤ i → i < {b}', text)
            self.assertIn(f'#print axioms {name}', text)
            self.assertIn(f'import {name}\n', files['Candidate.lean'])
            self.assertIn(f' := {name}\n', files['ExactContract.lean'])
        self.assertEqual(covered, list(range(337)))

    def test_shard_mutation_rejected(self):
        original = m.OUT / 'Shard336_337.lean'
        read = type(original).read_bytes
        def mutated(path):
            data = read(path)
            return data.replace(b'i < 337', b'i < 336') if path == original else data
        with mock.patch.object(type(original), 'read_bytes', mutated):
            with self.assertRaises(ValueError):
                m.check(self.bank)

    def test_generated_artifact_byte_mutation_rejected(self):
        original = m.OUT / 'DenseData.lean'
        read = type(original).read_bytes
        def mutated(path):
            data = read(path)
            return data + b'-- mutation\n' if path == original else data
        with mock.patch.object(type(original), 'read_bytes', mutated):
            with self.assertRaises(ValueError):
                m.check(self.bank)
