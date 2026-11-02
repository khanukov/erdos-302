"""Data-level checks only; these are not Lean kernel certificate checks."""
import importlib.util
import json
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('edge_shards', ROOT / 'independent_bank/generate_edge_shards.py')
assert spec is not None and spec.loader is not None
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


def omitted_endpoints(universe, active):
    u, v = set(universe), set(active)
    missing = set()
    for b in universe:
        for c in universe:
            if b >= c:
                continue
            a, rem = divmod(b * c, b + c)
            if a in u and rem == 0:
                missing.update({a, b, c} - v)
    return missing


class EdgeShardsTest(unittest.TestCase):
    def test_generated_artifact_exact(self):
        self.assertEqual({name: (module.BASE / name).read_text() for name in module.render()}, module.render())

    def test_every_edge_retained_and_singleton_deletions_rejected(self):
        data = json.loads(module.DATA.read_text())
        for row in data:
            with self.subTest(node=row['node']):
                self.assertFalse(omitted_endpoints(row['universe'], row['active']))
                for removed in row['active']:
                    self.assertTrue(any(removed in e for e in row['edges']))
                # Exercise the actual predicate on a concrete deletion, too.
                altered = row['active'][1:]
                self.assertIn(row['active'][0], omitted_endpoints(row['universe'], altered))

    def test_shard_intervals_cover_without_gaps(self):
        data = json.loads(module.DATA.read_text())
        for row in data:
            seen = [b for lo in range(1, row['n'] + 1, 64)
                    for b in range(lo, min(row['n'], lo + 63) + 1)]
            self.assertEqual(seen, list(range(1, row['n'] + 1)))


if __name__ == '__main__':
    unittest.main()
