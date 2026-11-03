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
        self.assertIn('exact ⟨hrefs_proved, leaf_proved⟩', assembly)
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

    def test_weight_fold_and_leaf_assembly_mutations(self):
        text = self.files['Node1190Assembly.lean'].decode()
        batches = re.findall(r'theorem weight_positions(\d+) \(i : ℕ\) \(lo : (\d+) ≤ i\) \(hi : i < (\d+)\)', text)
        self.assertEqual([(int(b), int(a), int(z)) for b, a, z in batches],
                         [(i, a, z) for i, (a, z) in enumerate(shards.intervals(530, 10))])
        for i in range(53):
            self.assertIn(f'rcases weight_batch{i:03} with', text)
            self.assertIn(f'exact weight_positions{i:03} i', text)
        self.assertIn('exact all_weight_positions i (Finset.mem_range.mp hi)', text)
        for component in ('rows_proved', 'weights_proved', 'capacity_proved', 'leaf_with_index_bridges'):
            self.assertIn(component, text[text.index('theorem leaf_proved'):])
        self.assertNotIn('(hleaf :', text)
        for old, new in ((b'weight_batch000 with', b'weight_batch001 with'),
                         (b'exact weights_proved', b'exact rows_proved'),
                         (b'exact singleton_check\n', b'exact singleton_check hleaf\n')):
            altered = dict(self.files)
            altered['Node1190Assembly.lean'] = altered['Node1190Assembly.lean'].replace(old, new, 1)
            self.assertNotEqual(altered, self.files)
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

class AxiomInventoryTests(unittest.TestCase):
    def test_fixed_targets_reject_missing_and_mutated_reports(self):
        import node1190_axiom_inventory as inv
        names = inv.required("Node1190Refs000.lean")
        self.assertEqual(names, [f"Node1190Dual.{kind}{i:03}" for i in range(10) for kind in ("ref", "row", "weight")])
        log = "\n".join(f"'{name}' does not depend on any axioms" for name in names)
        inv.check_log("Node1190Refs000.lean", log)
        for bad in (log.replace(names[0], "Node1190Dual.fake", 1), log.replace("does not depend on any axioms", "depends on axioms: [evil]", 1)):
            with self.assertRaises(ValueError): inv.check_log("Node1190Refs000.lean", bad)

    def test_exact_fixed_inventory_and_invalid_files(self):
        import node1190_axiom_inventory as inv
        self.assertEqual(len(inv.required("Node1190Capacity089.lean")), 9)
        self.assertEqual(inv.required("Node1190Assembly.lean")[-1], "Node1190Dual.Shard336_337")
        for name in ("Node1190Refs053.lean", "Node1190Capacity090.lean", "Node1190RefsXXX.lean", "Other.lean"):
            with self.subTest(name=name), self.assertRaises(ValueError): inv.required(name)

    def test_inventory_covers_every_generated_report_and_missing_each_is_rejected(self):
        import node1190_axiom_inventory as inv
        root = Path(__file__).resolve().parents[1]
        paths = sorted((root / "audit/node1190-final-split").glob("Node1190Refs*.lean"))
        paths += sorted((root / "audit/node1190-final-split").glob("Node1190Capacity*.lean"))
        paths += [root / "audit/node1190-final-split" / n for n in ("Node1190Objective.lean", "Node1190Assembly.lean")]
        self.assertEqual(len(paths), 145)
        counts = {"ref": 0, "row": 0, "weight": 0, "capacity": 0}
        for path in paths:
            names = inv.required(path.name)
            directives = re.findall(r"^#print axioms (\w+)$", path.read_text(), re.M)
            self.assertEqual(["Node1190Dual." + n for n in directives], names, path.name)
            reports = [f"'{n}' does not depend on any axioms" for n in names]
            inv.check_log(path.name, "\n".join(reports))
            for i, name in enumerate(names):
                for prefix in counts:
                    if re.fullmatch(r"Node1190Dual\." + prefix + r"\d{3}", name): counts[prefix] += 1
                with self.assertRaises(ValueError, msg=name):
                    inv.check_log(path.name, "\n".join(reports[:i] + reports[i+1:]))
        self.assertEqual(counts, {"ref": 530, "row": 530, "weight": 530, "capacity": 899})

    def test_workflow_uses_independent_inventory(self):
        workflow = (Path(__file__).resolve().parents[1] / ".github/workflows/node1190-final-split.yml").read_text()
        self.assertIn('node1190_axiom_inventory.py" "$path" "$RUNNER_TEMP/$f.log"', workflow)
        self.assertNotIn('declarations=$(python3', workflow)
