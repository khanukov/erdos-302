import importlib.util
from pathlib import Path
import unittest

spec = importlib.util.spec_from_file_location('verify', Path(__file__).with_name('verify.py'))
v = importlib.util.module_from_spec(spec)
spec.loader.exec_module(v)


class Tests(unittest.TestCase):
    def test_archive_inventory_and_shards(self):
        _, chunks = v.inventory()
        self.assertEqual(sum(len(c[2]) for c in chunks), 1627)
        buckets = [[c for i, c in enumerate(chunks) if i % v.SHARDS == shard] for shard in range(v.SHARDS)]
        self.assertTrue(all(buckets))
        self.assertEqual(sum(len(c[2]) for bucket in buckets for c in bucket), 1627)

    def test_chunk_success_requires_real_boolean(self):
        self.assertTrue(v.chunk_success({'success': True}))
        self.assertFalse(v.chunk_success({'success': False}))
        for value in ('false', 0, 1, None):
            with self.subTest(value=value), self.assertRaises(ValueError):
                v.chunk_success({'success': value})

    def test_axioms_fail_closed(self):
        name = 'Archive.bank_node_1'
        v.check_axioms("'Archive.bank_node_1' does not depend on any axioms\n", [name])
        v.check_axioms("'Archive.bank_node_1' depends on axioms: [propext]\n", [name])
        for text in ('', "'Archive.bank_node_1' depends on axioms: [sorryAx]\n", "'Archive.bank_node_1' depends on axioms: [propext, Classical.choice]\n", "'Archive.bank_node_1' does not depend on any axioms\n" * 2):
            with self.subTest(text=text), self.assertRaises(ValueError):
                v.check_axioms(text, [name])

    def test_source_derives_edges_and_exact_literal(self):
        text = v.source_for([0], [{'v': [2, 3, 6], 'r': 2}])
        self.assertIn('Checked [2, 3, 6] [(0, 1, 2)] 2 := by decide', text)
        self.assertNotIn('native_decide', text)
        self.assertNotIn('sorry', text)
        with self.assertRaises(ValueError):
            v.source_for([0], [{'v': [1, 2, 3], 'r': 2}])

if __name__ == '__main__':
    unittest.main()
