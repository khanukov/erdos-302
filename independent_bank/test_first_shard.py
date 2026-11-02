import unittest
from unittest.mock import patch

import archive_prefix
import first_shard
import mixed_prefix_export

class FirstShardTests(unittest.TestCase):
    def test_case_proofs_unfold_row_before_image(self):
        proof = first_shard.generate_proof()
        for i in (4, 7):
            self.assertIn(f'change CaseCheck nodes {i} _ _\n  unfold CaseCheck RefCheck row image nodes\n  decide', proof)

    def test_inventory_and_kinds(self):
        doc = mixed_prefix_export.export(archive_prefix.load_bank())
        nodes = doc['nodes'][:9]
        self.assertEqual([n['id'] for n in nodes], list(range(9)))
        self.assertEqual([n['kind'] for n in nodes], [
            'basic', 'basic', 'basic', 'basic', 'case_placeholder',
            'trim_placeholder', 'basic', 'case_placeholder', 'trim_placeholder'])
        for n in nodes:
            for r in n.get('references', n.get('rows', [])):
                self.assertLess(r['source'], n['id'])
        data = first_shard.generate()
        self.assertEqual(data.count('  | '), 10)
        self.assertIn('  | 8 => ', data)
        self.assertNotIn('  | 9 => ', data)

    def test_generated_proof_reduces_to_trim_before_deciding(self):
        proof = first_shard.generate_proof()
        for i in (5, 8):
            self.assertIn(f'theorem check{i} : MixedDag.Check extraCheck nodes {i} := by\n  change TrimCheck nodes {i} _', proof)
        self.assertEqual(proof, first_shard.PROOF_OUT.read_text(encoding='utf-8'))

    def test_missing_render_row_fails_closed(self):
        with patch.object(first_shard.mixed_lean_producer, 'render', return_value='  | 0 => invalid\n'):
            with self.assertRaises(ValueError):
                first_shard.generate()

if __name__ == '__main__':
    unittest.main()
