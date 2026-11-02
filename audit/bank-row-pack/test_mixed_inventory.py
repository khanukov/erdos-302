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
    'MixedDagLocality', 'MixedDagLocalityTests',
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
            self.assertIn(f'{len(MODULES)} modules plus pinned Defs', baseline.stdout)
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


    def test_locality_inventory_mutations_are_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / 'audit/bank-row-pack').mkdir(parents=True)
            (root / '.github/workflows').mkdir(parents=True)
            shutil.copytree(ROOT / 'lean', root / 'lean')
            shutil.copy(ROOT / 'audit/bank-row-pack/check_mixed_inventory.py', root / 'audit/bank-row-pack')
            workflow = root / '.github/workflows/bank-row-pack-candidate.yml'
            shutil.copy(ROOT / '.github/workflows/bank-row-pack-candidate.yml', workflow)
            command = [sys.executable, '-B', str(root / 'audit/bank-row-pack/check_mixed_inventory.py')]
            source = root / 'lean/MixedDagLocalityTests.lean'
            original_source = source.read_text()
            original_workflow = workflow.read_text()
            mutations = (
                (source, original_source.replace('import MixedDagLocality', 'import MixedDag', 1), 'imports'),
                (workflow, original_workflow.replace(' MixedDagLocalityTests; do', '; do', 1), 'compilation list'),
                (workflow, original_workflow.replace(',MixedDagLocalityTests}.lean', '}.lean', 1), 'copy list'),
            )
            for path, changed, message in mutations:
                with self.subTest(message=message):
                    original = path.read_text()
                    self.assertNotEqual(original, changed)
                    try:
                        path.write_text(changed)
                        result = subprocess.run(command, capture_output=True, text=True)
                        self.assertNotEqual(result.returncode, 0)
                        self.assertIn(message, result.stdout + result.stderr)
                    finally:
                        path.write_text(original)


if __name__ == '__main__':
    unittest.main()
