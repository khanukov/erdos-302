import importlib.util
from pathlib import Path
import tempfile
import unittest

spec = importlib.util.spec_from_file_location('gate', Path(__file__).with_name('verify_staged_hashes.py'))
gate = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gate)


class SourceGateTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.source = Path(self.tmp.name) / 'source'
        self.stage = Path(self.tmp.name) / 'stage'
        self.source.mkdir()
        self.stage.mkdir()
        (self.stage / 'closure.txt').write_text('A\nB\n')
        (self.source / 'A.lean').write_bytes(b'original')
        (self.stage / 'A.lean').write_bytes(b'transformed')
        for root in (self.source, self.stage):
            (root / 'B.lean').write_bytes(b'unchanged')
        self.mapping = {'A.lean': (gate.sha(b'original'), gate.sha(b'transformed'))}

    def check(self):
        gate.verify(self.source, self.stage, self.mapping)

    def test_valid(self):
        self.check()

    def test_reject_bad_original(self):
        (self.source / 'A.lean').write_bytes(b'wrong')
        with self.assertRaises(ValueError): self.check()

    def test_reject_bad_transformed(self):
        (self.stage / 'A.lean').write_bytes(b'wrong')
        with self.assertRaises(ValueError): self.check()

    def test_reject_unreviewed_change(self):
        (self.stage / 'B.lean').write_bytes(b'changed')
        with self.assertRaises(ValueError): self.check()

    def test_reject_missing_transformation(self):
        (self.stage / 'closure.txt').write_text('B\n')
        with self.assertRaises(ValueError): self.check()

    def test_reject_duplicate_inventory_and_extra_source(self):
        (self.stage / 'closure.txt').write_text('A\nB\nB\n')
        with self.assertRaises(ValueError): self.check()
        (self.stage / 'closure.txt').write_text('A\nB\n')
        (self.stage / 'C.lean').write_bytes(b'extra')
        with self.assertRaises(ValueError): self.check()
