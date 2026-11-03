import unittest
import node1209_closure as closure
import node1209_dense as dense
import node1209_nonsmall as ns

class NonSmallTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.doc = closure.extract()
        cls.files = ns.generate(cls.doc)

    def test_inventory_and_exact_bytes(self):
        closure.verify()
        for name, text in dense.generate_files(self.doc).items():
            self.assertEqual((closure.OUT / name).read_bytes(), text.encode())
        ns.check_files(self.files, {p.name: p.read_bytes() for p in ns.OUT.glob('*.lean')})
        self.assertEqual(len(self.files), 7)

    def test_mutations_rejected(self):
        for name in self.files:
            for old, new in ((b' := by\n  decide', b' := by\n  sorry'),
                             (b'import Dense', b'import Dag'),
                             (b'extraCheck', b'extraChecK')):
                changed = dict(self.files)
                self.assertIn(old, changed[name])
                changed[name] = changed[name].replace(old, new, 1)
                with self.assertRaises(ValueError): ns.check_files(self.files, changed)
            changed = dict(self.files)
            del changed[name]
            with self.assertRaises(ValueError): ns.check_files(self.files, changed)
        changed = dict(self.files)
        changed['unexpected.lean'] = b''
        with self.assertRaises(ValueError): ns.check_files(self.files, changed)

    def test_inventory_rejects_corruption(self):
        import copy
        doc = copy.deepcopy(self.doc)
        doc['nodes'][4]['raw_node']['t'] = 'trim'
        with self.assertRaises(ValueError): ns.generate(doc)

if __name__ == '__main__':
    unittest.main()
