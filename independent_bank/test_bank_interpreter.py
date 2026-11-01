import unittest
from bank_interpreter import interpret, CheckError

class TestInterpreter(unittest.TestCase):
    def test_pack_scale_trim_and_case(self):
        nodes = [dict(t='leaf'), dict(t='pack', D=1, rows=[[0,1],[1,1]]), dict(t='trim',ref=2), dict(t='case',v=[2,3,6],r=1,cs=[0],tree=[['dual',1,[[0,1]]]],root=0)]
        images = [[0,1,1],[0,5,1],[1,1,1]]
        out=interpret(nodes,images,lambda i,n: ((2,3,6),1))
        self.assertEqual(out[1],((2,3,6,10,15,30),2))
        self.assertEqual(out[2],out[1])
        self.assertEqual(out[3],((2,3,6),1))
    def test_reject_overload(self):
        with self.assertRaises(CheckError):
            interpret([{'t':'leaf'},{'t':'pack','D':1,'rows':[[0,1],[1,1]]}],[[0,1,1],[0,1,1]],lambda i,n: ((2,3,6),1))
    def test_qpack_fraction_and_rounding(self):
        nodes=[{'t':'leaf'},{'t':'qpack','rows':[[0,1,2],[1,1,2]]}]
        self.assertEqual(interpret(nodes,[[0,1,1],[0,1,1]],lambda i,n: ((2,3,6),1))[1],((2,3,6),1))
    def test_case_split_and_forced_branch(self):
        tree=[['row',0],['budget'],['force',0,1],['split',2,0,2]]
        nodes=[{'t':'leaf'},{'t':'case','v':[2,3,6],'r':1,'cs':[0], 'tree':tree,'root':3}]
        # A row requiring all three vertices is an explicit assumed leaf for this synthetic test.
        self.assertEqual(interpret(nodes,[[0,1,1]],lambda i,n: ((2,3,6),3))[1],((2,3,6),1))
    def test_false_dual_rejected(self):
        nodes=[{'t':'leaf'},{'t':'case','v':[2,3,6],'r':2,'cs':[0], 'tree':[['dual',1,[[0,1]]]],'root':0}]
        with self.assertRaises(CheckError): interpret(nodes,[[0,1,1]],lambda i,n: ((2,3,6),1))
    def test_reject_forward_ref(self):
        with self.assertRaises(CheckError):
            interpret([{'t':'trim','ref':0}],[[0,1,1]],lambda i,n: None)

if __name__ == '__main__': unittest.main()
