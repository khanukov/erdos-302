import copy
import unittest

import node1209_closure
import node1209_pack_preflight as preflight


class PackPreflightTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.doc = node1209_closure.extract()

    def test_complete_actual_pack(self):
        self.assertEqual(preflight.check(self.doc), {
            'rows': 510, 'vertices': 901, 'max_load': 1001,
            'objective': 257941, 'threshold': 257257,
        })

    def test_reject_missing_occurrence(self):
        doc = copy.deepcopy(self.doc)
        doc['nodes'][-1]['raw_node']['rows'].pop()
        with self.assertRaisesRegex(ValueError, 'occurrence count'):
            preflight.check(doc)

    def test_reject_source_mismatch(self):
        doc = copy.deepcopy(self.doc)
        doc['nodes'][-1]['references'][0]['original_source'] += 1
        with self.assertRaisesRegex(ValueError, 'source identity'):
            preflight.check(doc)

    def test_reject_excess_load(self):
        doc = copy.deepcopy(self.doc)
        doc['nodes'][-1]['raw_node']['rows'][0][1] = 1002
        with self.assertRaisesRegex(ValueError, 'capacity exceeded'):
            preflight.check(doc)

    def test_reject_insufficient_objective(self):
        doc = copy.deepcopy(self.doc)
        for row in doc['nodes'][-1]['raw_node']['rows']:
            row[1] = 0
        with self.assertRaisesRegex(ValueError, 'rounding'):
            preflight.check(doc)

    def test_reject_support_change(self):
        doc = copy.deepcopy(self.doc)
        doc['nodes'][-1]['support'][-1] += 1
        with self.assertRaisesRegex(ValueError, 'union'):
            preflight.check(doc)


if __name__ == '__main__':
    unittest.main()
