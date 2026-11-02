import pathlib
import re
import unittest

import archive_prefix
import mixed_lean_producer
import mixed_prefix_export
import prefix256_shards as shards

ROOT = pathlib.Path(__file__).resolve().parents[1] / 'audit/shard-aggregation'


class Prefix256Test(unittest.TestCase):
    def test_all_case_proofs_unfold_row_before_image(self):
        doc = mixed_prefix_export.export(archive_prefix.load_bank())
        for i, node in enumerate(doc['nodes'][:256]):
            if node['kind'] == 'case_placeholder':
                text = self.files[f'ActualPrefix256Checks{i // 16}.lean']
                self.assertIn(f'change CaseCheck nodes {i} _ _\n  unfold CaseCheck RefCheck row image nodes', text)
        self.assertEqual(doc['nodes'][14]['kind'], 'case_placeholder')

    @classmethod
    def setUpClass(cls):
        cls.files = shards.generate()

    def test_exact_regeneration_and_inventory(self):
        names = {'ActualPrefix256Data.lean', 'ActualPrefix256Sound.lean'} | {
            f'ActualPrefix256Checks{i}.lean' for i in range(16)}
        self.assertEqual(set(self.files), names)
        for name, content in self.files.items():
            self.assertEqual((ROOT / name).read_bytes(), content.encode())

    def test_complete_literal_nodes_and_real_references(self):
        doc = mixed_prefix_export.export(archive_prefix.load_bank())
        full = mixed_lean_producer.render(doc)
        actual = self.files['ActualPrefix256Data.lean']
        full_rows = re.findall(r'^  \| (\d+) => (.+)$', full, re.M)
        rows = re.findall(r'^  \| (\d+) => (.+)$', actual, re.M)
        self.assertEqual(rows, full_rows[:256])
        self.assertEqual([int(i) for i, _ in rows], list(range(256)))
        self.assertEqual(actual.count('| _ =>'), 1)
        for node in doc['nodes'][:256]:
            for ref in node.get('references', []) + node.get('rows', []):
                self.assertLess(ref['source'], node['id'])

    def test_each_closed_check_and_aggregate(self):
        for shard, (start, end) in enumerate(shards.RANGES):
            text = self.files[f'ActualPrefix256Checks{shard}.lean']
            ids = re.findall(r'^theorem check(\d+) : MixedDag.Check extraCheck nodes (\d+) :=', text, re.M)
            self.assertEqual(ids, [(str(i), str(i)) for i in range(start, end)])
        sound = self.files['ActualPrefix256Sound.lean']
        self.assertIn('∀ i < 256, MixedDag.Check extraCheck nodes i', sound)
        self.assertIn('∀ i < 256, Extended.Bound (nodes i).support (nodes i).demand', sound)
        self.assertEqual(re.findall(r'exact check(\d+)', sound), list(map(str, range(256))))
        self.assertIn('MixedCaseTrimCandidate.sound nodes 256 checked', sound)

    def test_reject_mutations_to_data_imports_hypotheses_and_checks(self):
        for name in self.files:
            data = self.files[name].encode()
            for mutated in (data + b' ', data.replace(b'import ', b'import X', 1)):
                with self.assertRaises(ValueError):
                    shards.verify_bytes(name, mutated)
        name = 'ActualPrefix256Sound.lean'
        with self.assertRaises(ValueError):
            shards.verify_bytes(name, self.files[name].replace('i < 256', 'i < 255').encode())
        name = 'ActualPrefix256Checks4.lean'
        with self.assertRaises(ValueError):
            shards.verify_bytes(name, self.files[name].replace('check64', 'check65').encode())


if __name__ == '__main__':
    unittest.main()
