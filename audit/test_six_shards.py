from pathlib import Path
import re
import unittest
import joint_concrete_check as concrete

ROOT = Path(__file__).resolve().parents[1]

class ShardTests(unittest.TestCase):
    def test_shards_cover_every_occurrence_and_match_literal(self):
        text = (ROOT / 'lean/JointSixCandidate.lean').read_text()
        shards = [(int(a), int(b), int(v)) for a, b, v in re.findall(
            r'theorem shard_\d+ : shardSum (\d+) (\d+) = (\d+) :=', text)]
        self.assertTrue(shards)
        self.assertEqual(shards[0][0], 0)
        self.assertEqual(shards[-1][1], 4705)
        self.assertTrue(all(a < b <= a + 100 for a, b, _ in shards))
        self.assertTrue(all(x[1] == y[0] for x, y in zip(shards, shards[1:])))
        levels = concrete.load_literal(concrete.PATH.read_bytes())
        values = []
        for level, cells in enumerate(levels):
            for a, b, height in cells:
                values.append(height * sum(concrete.smooth(t, concrete.PRIMES[level:]) and a <= 6 // t < b for t in range(1, 7)))
        self.assertEqual(len(values), 4705)
        for a, b, expected in shards:
            self.assertEqual(sum(values[a:b]), expected, (a, b))
        self.assertEqual(sum(v for _, _, v in shards), 1)
        self.assertIn('theorem shards_cover', text)
        self.assertIn('fastMultiplicity_eq', text)

if __name__ == '__main__':
    unittest.main()
