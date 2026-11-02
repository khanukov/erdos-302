import pathlib
import unittest

import next_shards

ROOT = pathlib.Path(__file__).resolve().parents[1]

class NextShardsTest(unittest.TestCase):
    def test_case_proofs_unfold_row_before_image(self):
        generated = next_shards.generate()
        for i in (4, 7, 14):
            shard = next(n for n, (start, end) in enumerate(next_shards.RANGES) if start <= i < end)
            self.assertIn(f'change CaseCheck nodes {i} _ _\n  unfold CaseCheck RefCheck row image nodes\n  decide', generated[f'ActualPrefix32Checks{shard}.lean'])

    def test_generated_artifacts_match_pinned_archive(self):
        generated = next_shards.generate()
        self.assertEqual(set(generated), {'ActualPrefix32Data.lean', 'ActualPrefix32Checks0.lean', 'ActualPrefix32Checks1.lean', 'ActualPrefix32Checks2.lean', 'ActualPrefix32Sound.lean'})
        for name, text in generated.items():
            self.assertEqual((ROOT / 'audit/shard-aggregation' / name).read_bytes(), text.encode())

    def test_trim_checks_reduce_before_deciding(self):
        generated = next_shards.generate()
        for i in (5, 8, 15):
            shard = next(n for n, (start, end) in enumerate(next_shards.RANGES) if start <= i < end)
            proof = generated[f'ActualPrefix32Checks{shard}.lean']
            self.assertIn(
                f'theorem check{i} : MixedDag.Check extraCheck nodes {i} := by\n'
                f'  change TrimCheck nodes {i} _\n'
                '  unfold TrimCheck RefCheck image nodes UpperBridge.OrderedEdge\n'
                '  decide', proof)

    def test_rejects_byte_mutations(self):
        generated = next_shards.generate()
        name = 'ActualPrefix32Data.lean'
        with self.assertRaises(ValueError):
            next_shards.verify_bytes(name, generated[name].encode() + b' ')

if __name__ == '__main__':
    unittest.main()
