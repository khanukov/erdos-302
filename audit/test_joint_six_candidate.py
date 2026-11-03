from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]

class CandidateContract(unittest.TestCase):
    def test_closed_targets_and_no_placeholder(self):
        p = ROOT / 'lean/JointSixCandidate.lean'
        self.assertTrue(p.exists(), 'concrete Lean candidate missing')
        s = p.read_text()
        for token in ('theorem literal_weight', 'theorem independent_bound', 'theorem joint_six', 'height i * mult 6 i 1', 'SmoothRenewal.Edge'):
            self.assertIn(token, s)
        import re
        self.assertNotRegex(s, r'\b(sorry|admit|axiom|native_decide)\b')

if __name__ == '__main__': unittest.main()
