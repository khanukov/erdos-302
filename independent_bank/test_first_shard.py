import unittest
from unittest.mock import patch

import archive_prefix
import first_shard
import mixed_prefix_export

class FirstShardTests(unittest.TestCase):
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

    def test_missing_render_row_fails_closed(self):
        with patch.object(first_shard.mixed_lean_producer, 'render', return_value='  | 0 => invalid\n'):
            with self.assertRaises(ValueError):
                first_shard.generate()

if __name__ == '__main__':
    unittest.main()
