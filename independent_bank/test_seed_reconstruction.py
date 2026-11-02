import unittest
import tempfile
from pathlib import Path
from seed_reconstruction import ranks, seeds, renew_level, extensions, load_inputs

class ReconstructionTests(unittest.TestCase):
    def test_changed_archive_rejected(self):
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / 'archive.zip'; p.write_bytes(b'not pinned')
            with self.assertRaises(ValueError): load_inputs(p)

    def test_seed_rejects_boolean_vertex(self):
        with self.assertRaises(ValueError): seeds([((True,),1)], ranks(3), 0, 3)

    def test_seed_projection(self):
        r = ranks(12)
        self.assertEqual(seeds([((3, 9), 1)], r, 0, 12)[9], 1)

    def test_max_uses_seed_and_monotonicity(self):
        old, new, cells = renew_level([0]*9, [0]*9, [0,0,0,1,0,0,0,0,0], 2, [])
        self.assertEqual(list(new), [0,0,0,1,1,1,1,1,1])
        self.assertEqual(cells, [[3,6,1]])

    def test_extension_checks_every_source_edge(self):
        row = dict(source_node=0, prime_level=0, delete=[2], threshold=6, required=1, old=0, outside=2, outside_edges=1)
        self.assertEqual(extensions([row], [((2,3,6),2)]), [((3,),1)])
        row['delete'] = []
        with self.assertRaises(ValueError): extensions([row], [((2,3,6),2)])

    def test_extension_rejects_boolean_reference(self):
        row = dict(source_node=True, prime_level=0, delete=[], threshold=3, required=1, old=0, outside=0, outside_edges=0)
        with self.assertRaises(ValueError): extensions([row], [((1,2,3),1)])
