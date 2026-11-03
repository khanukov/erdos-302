import unittest
import node1209_closure as c

class ClosureTests(unittest.TestCase):
    def test_closure_occurrences_and_dense_references(self):
        data = c.extract()
        self.assertEqual(len(data['nodes']), 376)
        self.assertEqual(sum(len(n['references']) for n in data['nodes']), 1056)
        self.assertEqual(data['nodes'][-1]['original'], 1209)
        self.assertEqual(len(data['nodes'][-1]['references']), 510)
        for i, node in enumerate(data['nodes']):
            for ref in node['references']:
                self.assertLess(ref['dense_source'], i)
                self.assertEqual(data['nodes'][ref['dense_source']]['original'], ref['original_source'])

    def test_exact_archive_occurrences(self):
        bank = c.archive_prefix.load_bank()
        data = c.extract()
        for node in data['nodes']:
            self.assertEqual(node['raw_node'], bank['nodes'][node['original']])
            self.assertEqual([r['image'] for r in node['references']], c.references(node['raw_node']))
            for r in node['references']:
                self.assertEqual([r['original_source'], r['mul'], r['div']], bank['images'][r['image']])

    def test_generated_files_match(self):
        c.verify()

if __name__ == '__main__': unittest.main()
