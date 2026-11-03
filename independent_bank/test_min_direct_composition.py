import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


class CompositionTest(unittest.TestCase):
    def test_separate_root_representation_is_exact_rename(self):
        source = (ROOT / 'audit/node1209-closure/DenseData.lean').read_text()
        root = (ROOT / 'audit/node1190-composition/RootDenseData.lean').read_text()
        self.assertEqual(root, source.replace('Node1209Dense', 'Node1209RootDense'))

    def test_actual_support_subset_and_demand(self):
        def node(path, index):
            text = (ROOT / path).read_text()
            line = next(x for x in text.splitlines() if x.startswith(f'  | {index} =>'))
            match = re.search(r'⟨\{([^}]*)\}, (\d+),', line)
            self.assertIsNotNone(match)
            return {int(x.strip()) for x in match[1].split(',')}, int(match[2])
        small, d = node('audit/node1190-min/DenseData.lean', 336)
        root, rd = node('audit/node1190-composition/RootDenseData.lean', 375)
        self.assertLessEqual(small, root)
        self.assertEqual((d, rd), (258, 258))

if __name__ == '__main__':
    unittest.main()
