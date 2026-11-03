import unittest
import node1209_pack_all as gen

class PackAllTests(unittest.TestCase):
    def test_exact_occurrences_and_shards(self):
        data = gen.generate()
        self.assertEqual(len(data['rows']), 510)
        self.assertEqual(len(data['files']), 65)
        self.assertEqual([r['index'] for r in data['rows']], list(range(510)))
        self.assertEqual(data['rows'][0]['source'], 0)
        self.assertEqual(data['rows'][-1]['source'], 1190)

    def test_mutation_and_missing_shard_rejected(self):
        data = gen.generate()
        files = dict(data['files'])
        gen.check_files(data, files)
        for name in ('Node1209Rows000.lean', 'Node1209Rows031.lean', 'Node1209Rows063.lean', 'Node1209RowsAll.lean'):
            mutated = dict(files)
            mutated[name] = mutated[name].replace(b'def row', b'def bogus', 1) if name != 'Node1209RowsAll.lean' else mutated[name].replace(b'theorem checks', b'theorem bogus', 1)
            with self.assertRaises(ValueError): gen.check_files(data, mutated)
            del mutated[name]
            with self.assertRaises(ValueError): gen.check_files(data, mutated)
        files['Unexpected.lean'] = b''
        with self.assertRaises(ValueError): gen.check_files(data, files)

if __name__ == '__main__': unittest.main()
