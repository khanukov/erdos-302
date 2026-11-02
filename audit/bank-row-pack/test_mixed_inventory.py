#!/usr/bin/env python3
"""Mutation regressions for the mixed-case source inventory gate."""
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
MODULES = (
    'UpperBridge', 'UpperBank', 'Extended', 'Weighted', 'Scaling', 'PackRule',
    'Dag', 'BankRowPack', 'BankRowPackTests', 'BankRowPackArchive1090',
    'MixedDag', 'MixedDagTests', 'CaseRules', 'CaseDual', 'CaseTree',
    'MixedCaseTrimCandidate', 'MixedCaseTrimCandidateTest',
)


class InventoryMutationTests(unittest.TestCase):
    def test_forbidden_tokens_rejected_in_every_local_module(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / 'audit/bank-row-pack').mkdir(parents=True)
            (root / '.github/workflows').mkdir(parents=True)
            shutil.copytree(ROOT / 'lean', root / 'lean')
            checker = Path(os.environ.get('INVENTORY_CHECKER', ROOT / 'audit/bank-row-pack/check_mixed_inventory.py'))
            shutil.copy(checker, root / 'audit/bank-row-pack/check_mixed_inventory.py')
            shutil.copy(ROOT / '.github/workflows/bank-row-pack-candidate.yml', root / '.github/workflows')
            command = [sys.executable, '-B', str(root / 'audit/bank-row-pack/check_mixed_inventory.py')]
            baseline = subprocess.run(command, capture_output=True, text=True)
            self.assertEqual(baseline.returncode, 0, baseline.stderr + baseline.stdout)
            self.assertIn('17 modules plus pinned Defs', baseline.stdout)
            for module in MODULES:
                path = root / 'lean' / (module + '.lean')
                original = path.read_text()
                try:
                    for token in ('sorry', 'admit', 'native_decide'):
                        with self.subTest(module=module, token=token):
                            path.write_text(original + '\n-- mutation: ' + token + '\n')
                            result = subprocess.run(command, capture_output=True, text=True)
                            self.assertNotEqual(result.returncode, 0, f'{module}: accepted {token}')
                            self.assertIn(f'{module}: forbidden proof token', result.stderr + result.stdout)
                finally:
                    path.write_text(original)


if __name__ == '__main__':
    unittest.main()
