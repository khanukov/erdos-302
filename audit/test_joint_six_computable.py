from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]

class ComputableCandidate(unittest.TestCase):
    def test_kernel_candidate_and_original_target(self):
        s = (ROOT / 'lean/JointSixCandidate.lean').read_text()
        for token in ('def boundedSmooth', 'theorem boundedSmooth_iff', 'def fastMultiplicity',
                      'theorem fastMultiplicity_eq', 'theorem literal_weight',
                      'height i * mult 6 i 1', 'decide +kernel'):
            self.assertIn(token, s)
        self.assertNotRegex(s, r'\b(sorry|admit|native_decide)\b')

if __name__ == '__main__': unittest.main()
