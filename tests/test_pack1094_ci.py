import pathlib
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]


class ScaleWorkflowTest(unittest.TestCase):
    def test_matrix_and_assembly_are_wired(self):
        text = (ROOT / '.github/workflows/pack-node1094-scale.yml').read_text()
        self.assertIn('max-parallel: 8', text)
        self.assertIn('batch: [' + ', '.join(map(str, range(88))) + ']', text)
        self.assertIn('needs: [upstream, shard]', text)
        self.assertIn('ArchivePack1094.all_capacities', text)
        self.assertIn('node1094-proof-batch-${{ matrix.batch }}', text)
        self.assertIn('test "$(wc -l < "$p/generated/batches.txt")" -eq 88', text)

if __name__ == '__main__':
    unittest.main()
