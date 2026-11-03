import unittest
import node1209_pack_all
import node1209_root_literal as literal


class LiteralTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.rows = node1209_pack_all.generate()['rows']

    def test_exact_generated_candidate(self):
        self.assertEqual(literal.OUT.read_text(encoding='utf-8'), literal.render(self.rows))
        self.assertEqual(sum(r['weight'] * r['demand'] for r in self.rows), 257941)

    def test_mutation_changes_output(self):
        rows = [dict(r) for r in self.rows]
        rows[0]['weight'] += 1
        self.assertNotEqual(literal.render(rows), literal.OUT.read_text(encoding='utf-8'))

    def test_reject_missing_reordered_or_boolean(self):
        with self.assertRaises(ValueError):
            literal.render(self.rows[:-1])
        rows = [dict(r) for r in self.rows]
        rows[0], rows[1] = rows[1], rows[0]
        with self.assertRaises(ValueError):
            literal.render(rows)
        rows = [dict(r) for r in self.rows]
        rows[0]['demand'] = True
        with self.assertRaises(ValueError):
            literal.render(rows)
