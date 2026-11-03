import importlib.util
import unittest
from pathlib import Path

spec = importlib.util.spec_from_file_location('generated_bounded', Path(__file__).with_name('generated_bounded.py'))
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)

class TestGeneratedBounded(unittest.TestCase):
    def test_emits_separate_literal_operands_and_bounded_check(self):
        source = m.emit([0]*5, [0,0,1,1,1], [0,0,1,0,0], [0,0,1,1,1], 4)
        self.assertIn('def old (n : ℕ) : ℕ := ([0,0,1,1,1]', source)
        self.assertIn('def seed (n : ℕ) : ℕ := ([0,0,1,0,0]', source)
        self.assertIn('FiniteCorrectionCheck level 4 parent old seed', source)
        self.assertIn('decide +kernel', source)
    def test_rejects_mismatched_dimensions(self):
        with self.assertRaises(ValueError):
            m.emit([0], [0], [0], [0], 4)

if __name__ == '__main__': unittest.main()
