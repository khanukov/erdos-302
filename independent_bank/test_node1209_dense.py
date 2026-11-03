import unittest
import re
import node1209_dense as dense
import node1209_closure as closure
import node1209_small_chunks as chunks

class DenseTests(unittest.TestCase):
    def test_small_chunks_preserve_every_declaration_and_reject_truncation(self):
        for path in sorted(closure.OUT.glob('Small*.lean')):
            text = path.read_text()
            files = chunks.split(text, path.stem)
            before = re.findall(r'^theorem node\d+.*$', text, re.M)
            after = re.findall(r'^theorem node\d+.*$', ''.join(files.values()), re.M)
            self.assertEqual(before, after)
            with self.assertRaises(ValueError):
                chunks.split(text.replace('#print axioms', '#print broken', 1), path.stem)

    def test_shards_cover_exact_small_checks_and_import_assembly(self):
        doc = closure.extract()
        files = dense.generate_files(doc)
        expected = {i for i, n in enumerate(doc['nodes']) if n['raw_node']['t'] == 'small'}
        found = []
        for shard in range(23):
            text = files[f'Dense{shard:02}.lean']
            self.assertIn(f'import Small{shard:02}', text)
            self.assertIn('import DenseData', text)
            found += list(map(int, re.findall(r'^theorem check(\d+)', text, re.M)))
            self.assertIn(f'import Dense{shard:02}', files['Dense.lean'])
        self.assertEqual(len(found), 368)
        self.assertEqual(set(found), expected)
        self.assertEqual(len(set(found)), len(found))
        self.assertEqual(files['DenseData.lean'].count(' => ⟨'), 377)

    def test_inventory_and_occurrences(self):
        doc = closure.extract()
        text = dense.generate(doc)
        self.assertEqual(text.count(' => ⟨'), 377)  # 376 nodes plus explicit default
        self.assertIn('.pack 510 ![', text)
        self.assertIn('theorem check0 : MixedDag.Check', text)
        self.assertEqual(text.count('theorem check'), 368)

    def test_rejects_external_or_forward_reference(self):
        doc = closure.extract()
        doc['nodes'][-1]['references'][0]['dense_source'] = 375
        with self.assertRaises(ValueError):
            dense.generate(doc)

    def test_rejects_occurrence_loss(self):
        doc = closure.extract()
        doc['nodes'][-1]['references'].pop()
        with self.assertRaises(ValueError):
            dense.generate(doc)

if __name__ == '__main__': unittest.main()
