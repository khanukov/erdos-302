"""Independent finite-data checks; not a Lean proof of universe equality."""
import json
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / 'audit/reciprocal-bridge/FourExternalData.json'
BASE = ROOT / 'audit/reciprocal-bridge'
PRIMES = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71)


def is_smooth(value):
    for prime in PRIMES:
        while value % prime == 0:
            value //= prime
    return value == 1


class AssemblyTest(unittest.TestCase):
    def test_all_shards_referenced_once(self):
        assembly = (BASE / 'FourEdgeAssemblyCandidate.lean').read_text()
        shards = (BASE / 'FourEdgeShardsCandidate.lean').read_text()
        references = re.findall(r'\bedges_\d+_\d+_\d+\b', assembly)
        declarations = re.findall(r'theorem (edges_\d+_\d+_\d+)', shards)
        self.assertEqual(len(declarations), 44)
        self.assertCountEqual(references, declarations)
        self.assertEqual(len(set(references)), 44)

    def test_smooth_universes_and_exact_supports(self):
        data = json.loads(DATA.read_text())
        self.assertEqual([row['node'] for row in data], [1097, 1107, 1112, 1114])
        for row in data:
            with self.subTest(node=row['node']):
                universe = {x for x in range(1, row['n'] + 1) if is_smooth(x)}
                self.assertEqual(universe, set(row['universe']))
                support = set()
                for b in universe:
                    for c in universe:
                        if b >= c:
                            continue
                        a, remainder = divmod(b * c, b + c)
                        if remainder == 0 and 0 < a < b and a in universe:
                            support.update((a, b, c))
                self.assertEqual(support, set(row['active']))
                self.assertNotEqual(support, set())


if __name__ == '__main__':
    unittest.main()
