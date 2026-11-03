import pathlib
import re
import unittest
from unittest.mock import patch

import archive_prefix
import mixed_lean_producer
import mixed_prefix_export
import prefix1024_shards as shards

ROOT = pathlib.Path(__file__).resolve().parents[1] / 'audit/shard-aggregation'


class Prefix1024Test(unittest.TestCase):
    def test_all_case_proofs_unfold_row_before_image(self):
        doc = mixed_prefix_export.export(archive_prefix.load_bank())
        for i, node in enumerate(doc['nodes'][:1024]):
            if node['kind'] == 'case_placeholder':
                text = self.files[f'ActualPrefix1024Checks{i // 16}.lean']
                self.assertIn(f'set_option maxRecDepth 16384 in\ntheorem check{i} : MixedDag.Check extraCheck nodes {i} := by\n  change CaseCheck nodes {i} _ _\n  unfold CaseCheck RefCheck row image nodes\n  constructor\n  · decide\n  · repeat\' rw [BankCase.check]\n    decide', text)
        ids = [n['id'] for n in doc['nodes'][:1024] if n['kind'] == 'case_placeholder']
        self.assertEqual(ids, [4, 7, 14, 35, 67, 72, 78])
        self.assertEqual(
            [(n['id'], n['archive']['root'], len(n['archive']['tree']))
             for n in doc['nodes'][:1024] if n['kind'] == 'case_placeholder'],
            [(4, 0, 1), (7, 0, 1), (14, 0, 1), (35, 2, 3),
             (67, 13, 14), (72, 13, 14), (78, 10, 11)])

    def test_every_case_rejects_weakened_or_missing_checks(self):
        # Exercise the byte gate against mutations of each case, not merely one
        # representative shard. Cache the already-generated expected artifact.
        with patch.object(shards, 'generate', return_value=self.files):
            for i in (4, 7, 14, 35, 67, 72, 78):
                name = f'ActualPrefix1024Checks{i // 16}.lean'
                text = self.files[name]
                match = re.search(rf'^theorem check{i} : .*?(?=^theorem |^set_option |^#print)',
                                  text, re.M | re.S)
                self.assertIsNotNone(match)
                proof = match.group()
                mutations = (
                    proof.replace('MixedDag.Check extraCheck nodes ' + str(i), 'True'),
                    proof.replace('  · decide\n', '  · trivial\n', 1),
                    proof.replace("repeat' rw [BankCase.check]", 'skip'),
                    proof.replace('    decide\n', '    trivial\n', 1),
                    '',
                )
                for mutation in mutations:
                    with self.subTest(node=i, mutation=mutation[:50]):
                        self.assertNotEqual(mutation, proof)
                        altered = text[:match.start()] + mutation + text[match.end():]
                        with self.assertRaises(ValueError):
                            shards.verify_bytes(name, altered.encode())

    @classmethod
    def setUpClass(cls):
        cls.files = shards.generate()

    def test_exact_regeneration_and_inventory(self):
        names = {'ActualPrefix1024Data.lean', 'ActualPrefix1024Sound.lean'} | {
            f'ActualPrefix1024Checks{i}.lean' for i in range(64)} | {'ActualPrefix1024Representative.lean'}
        self.assertEqual(set(self.files), names)
        for name, content in self.files.items():
            self.assertEqual((ROOT / name).read_bytes(), content.encode())

    def test_complete_literal_nodes_and_real_references(self):
        doc = mixed_prefix_export.export(archive_prefix.load_bank())
        full = mixed_lean_producer.render(doc)
        actual = self.files['ActualPrefix1024Data.lean']
        full_rows = re.findall(r'^  \| (\d+) => (.+)$', full, re.M)
        rows = re.findall(r'^  \| (\d+) => (.+)$', actual, re.M)
        self.assertEqual(rows, full_rows[:1024])
        self.assertEqual([int(i) for i, _ in rows], list(range(1024)))
        self.assertEqual(actual.count('| _ =>'), 1)
        for node in doc['nodes'][:1024]:
            for ref in node.get('references', []) + node.get('rows', []):
                self.assertLess(ref['source'], node['id'])

    def test_data_heartbeat_is_finite_and_scoped_to_nodes(self):
        data = self.files['ActualPrefix1024Data.lean']
        self.assertEqual(data.count('set_option maxHeartbeats'), 1)
        self.assertIn('set_option maxHeartbeats 4000000 in\n'
                      'def nodes : ℕ → MixedDag.Node Payload\n', data)

    def test_aggregate_heartbeat_is_finite_and_scoped_to_checked(self):
        sound = self.files['ActualPrefix1024Sound.lean']
        self.assertIn('set_option maxHeartbeats 4000000 in\n'
                      'theorem checked : ∀ i < 1024, MixedDag.Check extraCheck nodes i := by\n', sound)
        self.assertEqual(sound.count('set_option maxHeartbeats 4000000 in'), 65)
        self.assertIn('\ntheorem sound : ∀ i < 1024, Extended.Bound', sound)

    def test_each_closed_check_and_aggregate(self):
        for shard, (start, end) in enumerate(shards.RANGES):
            text = self.files[f'ActualPrefix1024Checks{shard}.lean']
            ids = re.findall(r'^theorem check(\d+) : MixedDag.Check extraCheck nodes (\d+) :=', text, re.M)
            self.assertEqual(ids, [(str(i), str(i)) for i in range(start, end)])
        sound = self.files['ActualPrefix1024Sound.lean']
        self.assertIn('∀ i < 1024, MixedDag.Check extraCheck nodes i', sound)
        self.assertIn('∀ i < 1024, Extended.Bound (nodes i).support (nodes i).demand', sound)
        self.assertIn('ShardAggregation.prefix_sound', sound)
        for shard, (start, end) in enumerate(shards.RANGES):
            match = re.search(rf'theorem segment{shard} :.*?(?=^#print axioms)', sound, re.M | re.S)
            self.assertIsNotNone(match)
            self.assertIn(f'({start}) ({end})', match.group())
            self.assertEqual(re.findall(r'exact check(\d+)', match.group()),
                             list(map(str, range(start, end))))
        chain = sound.split('theorem checked :', 1)[1].split('theorem sound :', 1)[0]
        self.assertEqual(list(map(int, re.findall(r'\bsegment(\d+)\b', chain))), list(range(64)))
        self.assertIn('ShardAggregation.Chain.empty 0', chain)
        self.assertIn('MixedCaseTrimCandidate.sound nodes 1024 checked', sound)

    def test_each_new_check_is_closed_and_mutations_rejected(self):
        with patch.object(shards, 'generate', return_value=self.files):
            for i in range(256, 1024):
                name = f'ActualPrefix1024Checks{i // 16}.lean'
                text = self.files[name]
                check = f'theorem check{i} : MixedDag.Check extraCheck nodes {i} := by decide'
                self.assertEqual(text.count(check), 1)
                for replacement in (f'theorem check{i} : True := by trivial', ''):
                    with self.assertRaises(ValueError):
                        shards.verify_bytes(name, text.replace(check, replacement).encode())

    def test_representative_no_assumptions(self):
        text = self.files['ActualPrefix1024Representative.lean']
        self.assertIn('Segment (MixedDag.Check extraCheck nodes) 256 272 := by', text)
        self.assertEqual(re.findall(r'exact check(\d+)', text), list(map(str, range(256, 272))))
        self.assertIn('#print axioms representative', text)

    def test_reject_mutations_to_data_imports_hypotheses_and_checks(self):
        for name in self.files:
            data = self.files[name].encode()
            for mutated in (data + b' ', data.replace(b'import ', b'import X', 1)):
                with self.assertRaises(ValueError):
                    shards.verify_bytes(name, mutated)
        name = 'ActualPrefix1024Sound.lean'
        with self.assertRaises(ValueError):
            shards.verify_bytes(name, self.files[name].replace('i < 1024', 'i < 255').encode())
        name = 'ActualPrefix1024Checks4.lean'
        with self.assertRaises(ValueError):
            shards.verify_bytes(name, self.files[name].replace('check64', 'check65').encode())


if __name__ == '__main__':
    unittest.main()
