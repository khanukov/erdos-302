"""Projection checks; these do not constitute Lean verification."""
import importlib.util
from pathlib import Path
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('probe', ROOT / 'audit/reciprocal-bridge/prepare_four_probe.py')
probe = importlib.util.module_from_spec(spec)
spec.loader.exec_module(probe)


class ProbeTest(unittest.TestCase):
    def test_exact_projection(self):
        generated = probe.project()
        original = (probe.BASE / 'FourEdgeShard_1097_129_192.lean').read_text()
        restored = (generated['FourProbe.lean']
                    .replace('import FourProbeLiterals', 'import FourEdgeUniversesCandidate')
                    .replace('edges_1097_129_132', 'edges_1097_129_192')
                    .replace('Finset.Icc 129 132', 'Finset.Icc 129 192'))
        self.assertEqual(original, restored)
        self.assertIn('Finset.Icc 129 132', generated['FourProbe.lean'])
        for source, name in [('FourExternalCandidate.lean', 'active_1097'),
                             ('FourEdgeUniversesCandidate.lean', 'universe_1097')]:
            line = next(x for x in (probe.BASE / source).read_text().splitlines()
                        if x.startswith('def ' + name + ' :'))
            self.assertIn(line + '\n', generated['FourProbeLiterals.lean'])

    def test_changed_source_pin_rejected(self):
        with patch.dict(probe.PINS, {'FourExternalCandidate.lean': '0' * 64}):
            with self.assertRaisesRegex(ValueError, 'source pin mismatch'):
                probe.project()


if __name__ == '__main__':
    unittest.main()
