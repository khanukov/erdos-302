import unittest
import re
import subprocess
from pathlib import Path
import node1209_row63_split as split


class Row63SplitTests(unittest.TestCase):
    def test_original_partition_is_exact_and_preserves_all_occurrences(self):
        path = Path(__file__).resolve().parents[1] / 'lean/node1209-pack-all/Node1209Rows063.lean'
        original = path.read_text()
        parts = split.partition(original)
        self.assertEqual(set(parts), {'504-508', '509'})
        for key, expected in [('504-508', range(504, 509)), ('509', [509])]:
            for i in range(504, 510):
                self.assertEqual(parts[key].count(f'theorem check{i} :'), int(i in expected))
                self.assertEqual(parts[key].count(f'theorem bound{i} '), int(i in expected))
        self.assertEqual(split.reassemble(parts), original)

    def test_workflow_matrix_and_actual_case_cover_every_occurrence_once(self):
        root = Path(__file__).resolve().parents[1]
        workflow = (root / '.github/workflows/node1209-pack-all.yml').read_text()
        batches = re.search(r'batch: \[([^\]]+)\]', workflow).group(1).split(', ')
        self.assertEqual(batches, list(map(str, range(63))) + ['63a', '63b'])
        case = re.search(r'          case "\$BATCH" in\n(.*?)          esac', workflow, re.S).group(0)
        covered = []
        for batch in batches:
            cmd = case + '\nprintf "%s %s %s %s" "$shard" "$first" "$last" "$part"'
            out = subprocess.check_output(['bash', '-c', cmd], env={'BATCH': batch}, text=True)
            shard, first, last, *part = out.split()
            expected = 63 if batch.startswith('63') else int(batch)
            self.assertEqual(shard, f'Node1209Rows{expected:03d}')
            covered.extend(range(int(first), int(last)))
        self.assertEqual(covered, list(range(510)))
        self.assertIn('"$shard.check$i" "$shard.bound$i"', workflow)
        self.assertIn('check_axioms.py" "$RUNNER_TEMP/$shard.log" "${names[@]}"', workflow)

    def test_rejects_missing_or_reordered_occurrence(self):
        path = Path(__file__).resolve().parents[1] / 'lean/node1209-pack-all/Node1209Rows063.lean'
        original = path.read_text().replace('def imageId509 :', 'def imageId510 :')
        with self.assertRaises(ValueError):
            split.partition(original)


if __name__ == '__main__':
    unittest.main()
