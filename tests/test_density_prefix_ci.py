#!/usr/bin/env python3
"""Guard the bounded hosted density proof and its axiom-audit wiring."""
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


class DensityCI(unittest.TestCase):
    def test_lake_roots_and_no_proof_escapes(self):
        exclusions = (ROOT / 'audit/upper-integration-excluded.txt').read_text().splitlines()
        for name in ('DensityPrefixCandidate', 'DensityPrefixCandidateTests'):
            self.assertIn(name, exclusions)
            text = (ROOT / 'lean' / (name + '.lean')).read_text()
            self.assertNotRegex(text, r'\b(sorry|admit|native_decide|axiom|unsafe)\b')

    def test_finite_checks_use_kernel_reduction_with_bounded_scope(self):
        text = (ROOT / 'lean/DensityPrefixCandidate.lean').read_text()
        self.assertNotIn('primes_nodup.take k', text)
        self.assertRegex(text, r'exact primes_nodup\.take\s*\n')
        for name in ('entry_prefixes', 'rational_prefixes'):
            self.assertRegex(text, r'set_option maxRecDepth 100000 in\s*set_option maxHeartbeats 0 in\s*/--(?:(?!-/)[\s\S])*-/\s*theorem ' + name)
        self.assertEqual(text.count('decide +kernel'), 2)

    def test_hosted_compile_and_axiom_gate(self):
        workflow = (ROOT / '.github/workflows/density-prefix.yml').read_text()
        self.assertIn('workflow_dispatch:', workflow)
        self.assertRegex(workflow, r'timeout-minutes:\s*180\b')
        self.assertIn('timeout 120m lake build ArchiveLedgerSumBridge', workflow)
        self.assertIn('timeout 20m lake env lean -o lean/DensityPrefixCandidate.olean lean/DensityPrefixCandidate.lean', workflow)
        self.assertIn('set -euo pipefail', workflow)
        checker_lines = [line for line in workflow.splitlines() if 'check_axioms.py' in line and 'test_check' not in line]
        self.assertEqual(len(checker_lines), 2)
        for theorem in ('primes_nodup', 'all_prefixes_nodup', 'entry_prefixes', 'rational_prefixes', 'real_prefix', 'indexed_density', 'indexed_density_direct'):
            self.assertIn('DensityPrefixCandidate.' + theorem, checker_lines[0].split())
        self.assertIn('DensityPrefixCandidate.indexed_density', checker_lines[1].split())
        self.assertIn('da1f94df976c7cd38117281c57d6ee3046c8d104', workflow)
        self.assertIn('python3 -B -O tests/test_density_prefix_ci.py', workflow)


if __name__ == '__main__':
    unittest.main()
