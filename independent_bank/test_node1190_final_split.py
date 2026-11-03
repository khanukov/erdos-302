import copy
import re
import unittest
import node1190_final_split as shards
import json
from pathlib import Path

class ShardTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.doc = json.loads((Path(__file__).resolve().parents[1] / "audit/node1190-min/closure.json").read_text())
        cls.files = shards.generate(cls.doc)

    def test_intervals_cover_occurrences_without_overlap(self):
        intervals = shards.intervals(530, 10)
        self.assertEqual([i for a, b in intervals for i in range(a, b)], list(range(530)))
        self.assertEqual(intervals[-1], (520, 530))

    def test_leaf_bridge_is_generated_and_occurrence_indexed(self):
        bridge = self.files['Node1190LeafBridge.lean'].decode()
        self.assertIn('Finset.range es.length', bridge)
        self.assertIn('BankCase.dualEntry es i', bridge)
        self.assertIn('BankCase.check rows T O Z k (.dual es D) = true', bridge)
        self.assertIn('leaf_from_components', bridge)
        self.assertIn('import Node1190LeafBridge', self.files['Node1190Assembly.lean'].decode())
        changed = dict(self.files)
        changed['Node1190LeafBridge.lean'] += b'-- mutation\n'
        with self.assertRaises(ValueError): shards.check_files(self.files, changed)

    def test_invalid_chunk(self):
        with self.assertRaises(ValueError):
            shards.intervals(3, 0)

    def test_exact_occurrence_and_vertex_coverage(self):
        text = b''.join(self.files.values()).decode()
        for prefix, n in [('ref', 530), ('row', 530), ('weight', 530), ('capacity', 899)]:
            ids = list(map(int, re.findall(r'^theorem ' + prefix + r'(\d+)\b', text, re.M)))
            self.assertEqual(sorted(ids), list(range(n)))
        self.assertIn('objective = 257076355', text)
        self.assertNotIn('native_decide', text)

    def test_row_occurrences_follow_entry_positions(self):
        entries = self.doc['nodes'][336]['raw_node']['tree'][0][2]
        text = b''.join(self.files.values()).decode()
        for i, (pos, _) in enumerate(entries):
            self.assertIn(f'theorem row{i:03} : (entryAt {i}).1 = MixedCaseTrimCandidate.row Node1209Dense.nodes 336 (refAt {pos})', text)

    def test_quantified_mapping_preserves_all_positions_and_repetitions(self):
        entries = self.doc['nodes'][336]['raw_node']['tree'][0][2]
        assembly = self.files['Node1190Assembly.lean'].decode()
        pairs = [(int(pos), int(i)) for pos, i in re.findall(
            r'exact ⟨(\d+), by rw \[lengths\.1\]; omega, h(\d+)⟩', assembly)]
        self.assertEqual(pairs, [(pos, i) for i, (pos, _) in enumerate(entries)])
        sources = [r['dense_source'] for r in self.doc['nodes'][336]['references']]
        self.assertLess(len(set(sources)), len(sources))
        self.assertIn('exact ⟨hrefs_proved, hleaf⟩', assembly)
        self.assertIn('Node1190ComponentFold.mapped_getD_mem', assembly)
        changed = dict(self.files)
        changed['Node1190Assembly.lean'] = changed['Node1190Assembly.lean'].replace(
            b'exact \xe2\x9f\xa80, by rw [lengths.1]; omega, h0\xe2\x9f\xa9',
            b'exact \xe2\x9f\xa81, by rw [lengths.1]; omega, h0\xe2\x9f\xa9', 1)
        self.assertNotEqual(changed['Node1190Assembly.lean'], self.files['Node1190Assembly.lean'])
        with self.assertRaises(ValueError): shards.check_files(self.files, changed)

    def test_capacity_coverage_and_dispatch_exact(self):
        text = self.files['Node1190Assembly.lean'].decode()
        vertices = self.doc['nodes'][336]['support']
        chunks = re.findall(r'^def support_chunk(\d+) : Finset ℕ := \{([^}]*)\}', text, re.M)
        self.assertEqual([int(i) for i, _ in chunks], list(range(90)))
        decoded = [int(v) for _, group in chunks for v in group.split(', ')]
        self.assertEqual(decoded, vertices)
        branches = list(map(int, re.findall(r'^  · exact capacity(\d+)$', text, re.M)))
        self.assertEqual(branches, list(range(899)))
        dispatch = list(map(int, re.findall(r'^  · exact chunk_capacity(\d+) v h\d+$', text, re.M)))
        self.assertEqual(dispatch, list(range(90)))
        self.assertIn('theorem support_coverage (v : ℕ) (hv : v ∈ (Node1209Dense.nodes 336).support)', text)
        self.assertIn('theorem capacity_proved : ∀ v ∈ BankCase.Free', text)
        self.assertIn('#print axioms capacity_proved', text)
        altered = dict(self.files)
        altered['Node1190Assembly.lean'] = altered['Node1190Assembly.lean'].replace(b'exact capacity000', b'exact capacity001', 1)
        with self.assertRaises(ValueError): shards.check_files(self.files, altered)

    def test_missing_or_changed_file_rejected(self):
        changed = dict(self.files)
        changed.pop('Node1190Refs000.lean')
        with self.assertRaises(ValueError): shards.check_files(self.files, changed)
        changed = dict(self.files)
        changed['Node1190Objective.lean'] += b'-- mutation\n'
        with self.assertRaises(ValueError): shards.check_files(self.files, changed)

    def test_mutated_weight_and_support_rejected(self):
        for change in ('weight', 'support', 'reference'):
            doc = copy.deepcopy(self.doc)
            node = doc['nodes'][336]
            if change == 'weight': node['raw_node']['tree'][0][2][0][1] += 1
            elif change == 'support': node['support'][0] += 1
            else: node['references'][0]['mul'] += 1
            with self.subTest(change=change), self.assertRaises(ValueError): shards.generate(doc)

    def test_corrupted_entry_rejected(self):
        doc = copy.deepcopy(self.doc)
        doc['nodes'][336]['raw_node']['tree'][0][2][0][0] = -1
        with self.assertRaises(ValueError): shards.generate(doc)
