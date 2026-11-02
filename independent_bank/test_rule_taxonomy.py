import copy
import unittest
from rule_taxonomy import analyze, load


def fixture():
    return {'schema':'erdos302-standalone-finite-proof-bank-v1', 'roots':{},
            'images':[[0,1,1], [1,1,1], [2,1,1]],
            'nodes':[{'t':'small','v':[2,3,6],'r':1},
                     {'t':'trim','ref':0},
                     {'t':'case','v':[2,3,6],'r':1,'cs':[1],
                      'tree':[['budget'],['row',0],['split',2,0,1]],'root':2},
                     {'t':'pack','D':1,'rows':[[2,1]]}]}


class TaxonomyTests(unittest.TestCase):
    def test_archive(self):
        a = analyze(load())
        self.assertEqual(a['node_count'], 4106)
        self.assertEqual(a['image_count'], 25744)
        self.assertEqual(a['image_use_count'], 623846)
        self.assertEqual(a['node_rules'], {'small':3528, 'externalActive':4, 'trim':3, 'pack':448, 'qpack':1, 'case':122})
        self.assertEqual(a['case_tree_rules'], {'dual':1352, 'force':44, 'split':1230})
        self.assertEqual(a['max_backward_distance'], 4105)

    def test_valid_backward_and_tree_variants(self):
        b = fixture()
        self.assertEqual(analyze(b)['image_use_count'], 3)
        b['nodes'][2]['tree'] = [['dual', 1, [[0,1]]], ['force',0,0]]
        b['nodes'][2]['root'] = 1
        self.assertEqual(analyze(b)['case_tree_rules'], {'dual':1,'force':1})

    def test_typed_node_fields_rejected(self):
        for node, field, values in [(0, 'v', [None, [2, True], 'bad']),
                                    (0, 'r', [True, None, '1']),
                                    (2, 'v', [None, [2, False], 'bad']),
                                    (2, 'r', [True, None, '1']),
                                    (3, 'D', [True, None, '1'])]:
            for value in values:
                with self.subTest(node=node, field=field, value=value):
                    b = fixture(); b['nodes'][node][field] = value
                    with self.assertRaises(ValueError): analyze(b)
        b = fixture(); b['nodes'][0] = {'t': 'externalActive', 'n': True}
        with self.assertRaises(ValueError): analyze(b)

    def test_boolean_reference_and_tree_fields(self):
        mutations = [
            lambda b: b['images'][0].__setitem__(0, False),
            lambda b: b['images'][0].__setitem__(1, True),
            lambda b: b['images'][0].__setitem__(2, True),
            lambda b: b['roots'].__setitem__('x', False),
            lambda b: b['nodes'][1].__setitem__('ref', False),
            lambda b: b['nodes'][2]['cs'].__setitem__(0, True),
            lambda b: b['nodes'][2]['tree'][1].__setitem__(1, False),
            lambda b: b['nodes'][2]['tree'][2].__setitem__(1, True),
            lambda b: b['nodes'][2]['tree'][2].__setitem__(2, False),
            lambda b: b['nodes'][2]['tree'][2].__setitem__(3, True),
            lambda b: b['nodes'][2].__setitem__('root', True),
            lambda b: b['nodes'][3]['rows'][0].__setitem__(0, True),
            lambda b: b['nodes'][3]['rows'][0].__setitem__(1, True),
        ]
        for mutate in mutations:
            with self.subTest(mutate=mutate):
                b = fixture(); mutate(b)
                with self.assertRaises(ValueError): analyze(b)
        for tag, row, positions in [('force', ['force', 0, 0], (1, 2)),
                                    ('dual', ['dual', 1, [[0, 1]]], (1,))]:
            for pos in positions:
                b = fixture()
                b['nodes'][2]['tree'] = ([['budget']] if tag == 'force' else []) + [copy.deepcopy(row)]
                b['nodes'][2]['root'] = len(b['nodes'][2]['tree']) - 1
                b['nodes'][2]['tree'][-1][pos] = True
                with self.subTest(tag=tag, pos=pos), self.assertRaises(ValueError): analyze(b)
        for pos in (0, 1):
            b = fixture(); b['nodes'][2]['tree'] = [['dual', 1, [[0, 1]]]]
            b['nodes'][2]['root'] = 0; b['nodes'][2]['tree'][0][2][0][pos] = True
            with self.subTest(dual_pair=pos), self.assertRaises(ValueError): analyze(b)
        for pos in (0, 1, 2):
            b = fixture(); b['nodes'][3] = {'t':'qpack', 'rows':[[2, 1, 1]]}
            b['nodes'][3]['rows'][0][pos] = True
            with self.subTest(qpack=pos), self.assertRaises(ValueError): analyze(b)

    def test_duplicate_case_occurrences_and_dual_indices(self):
        b = fixture(); n = b['nodes'][2]
        n['cs'] = [1, 1]; n['tree'] = [['dual', 1, [[0, 1], [1, 1]]]]; n['root'] = 0
        self.assertEqual(analyze(b)['image_use_count'], 4)
        n['tree'][0][2] = [[0, 1], [0, 2]]
        with self.assertRaises(ValueError): analyze(b)

    def test_bad_inputs_rejected(self):
        mutations = [
            lambda b: b['images'].__setitem__(0, [1,1,1]), # self-reference
            lambda b: b['images'].__setitem__(0, [2,1,1]), # forward
            lambda b: b['nodes'][1].__setitem__('ref', True),
            lambda b: b['nodes'][1].__setitem__('t', 'mystery'),
            lambda b: b['nodes'][2]['tree'][2].__setitem__(2, 2), # self child
            lambda b: b['nodes'][2]['tree'][2].__setitem__(3, 9), # forward/outside
            lambda b: b['nodes'][2]['tree'][1].__setitem__(1, 1), # constraint outside
            lambda b: b['nodes'][2]['tree'][0].__setitem__(0, 'unknown'),
            lambda b: b['nodes'][2]['tree'][2].__setitem__(3, 0), # unreachable row
            lambda b: b['nodes'][2].__setitem__('root', True),
            lambda b: b['nodes'][3]['rows'].append([2,1]), # duplicate image
            lambda b: b['nodes'][3]['rows'][0].__setitem__(1, False),
        ]
        for mutate in mutations:
            with self.subTest(mutate=mutate):
                b = copy.deepcopy(fixture()); mutate(b)
                with self.assertRaises(ValueError): analyze(b)


if __name__ == '__main__': unittest.main()
