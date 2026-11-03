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
        self.assertEqual(len(shards), 33)
        for a in range(272, 288, 4):
            self.assertIn(f'Shard{a:03}_{a+4:03}.lean', shards)
        self.assertNotIn('Shard272_288.lean', shards)
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

    def test_case_shards_use_recursive_checker_equations(self):
        files = m.files(self.bank)
        cases = [i for i, n in enumerate(self.doc['nodes']) if n['raw_node']['t'] == 'case']
        self.assertTrue(cases)
        for i in cases:
            text = files[f'Shard{i:03}_{i+1:03}.lean']
            if i == 336:
                self.assertIn('import Node1190Assembly\n', text)
                self.assertIn('exact Node1190Dual.Shard336_337', text)
                continue
            self.assertIn(f'change MixedCaseTrimCandidate.CaseCheck Node1209Dense.nodes {i} _ _', text)
            self.assertIn('unfold MixedCaseTrimCandidate.CaseCheck MixedCaseTrimCandidate.RefCheck', text)
            self.assertIn("repeat' rw [BankCase.check]", text)
            self.assertIn('    decide', text)

    def test_case_proof_mutations_rejected(self):
        read = type(m.OUT).read_bytes
        for i, node in enumerate(self.doc['nodes']):
            if node['raw_node']['t'] != 'case':
                continue
            original = m.OUT / f'Shard{i:03}_{i+1:03}.lean'
            mutations = ([(b'exact Node1190Dual.Shard336_337', b'exact Node1190Dual.singleton_check'),
                          (b'import Node1190Assembly', b'import DenseData')] if i == 336 else
                         [(b"repeat' rw [BankCase.check]", b'decide'),
                          (b'MixedCaseTrimCandidate.row', b'MixedCaseTrimCandidate.image')])
            for before, after in mutations:
                def mutated(path):
                    data = read(path)
                    return data.replace(before, after, 1) if path == original else data
                with self.subTest(node=i, mutation=before), mock.patch.object(type(original), 'read_bytes', mutated):
                    with self.assertRaises(ValueError):
                        m.check(self.bank)

    def test_shard_mutation_rejected(self):
        original = m.OUT / 'Shard336_337.lean'
        read = type(original).read_bytes
        def mutated(path):
            data = read(path)
            return data.replace(b'i < 337', b'i < 336') if path == original else data
        with mock.patch.object(type(original), 'read_bytes', mutated):
            with self.assertRaises(ValueError):
                m.check(self.bank)

    def test_split_shard_and_contract_mutations_rejected(self):
        read = type(m.OUT).read_bytes
        for filename, before, after in [
            ('Shard272_276.lean', b'i < 276', b'i < 275'),
            ('Candidate.lean', b'import Shard280_284\n', b''),
            ('ExactContract.lean', b' := Shard284_288\n', b' := Shard280_284\n'),
        ]:
            original = m.OUT / filename
            def mutated(path):
                data = read(path)
                if path == original:
                    if before not in data:
                        raise RuntimeError('mutation target missing')
                    return data.replace(before, after, 1)
                return data
            with self.subTest(filename=filename), mock.patch.object(type(original), 'read_bytes', mutated):
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
