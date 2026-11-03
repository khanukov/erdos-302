import importlib.util
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


class AssemblyInventory(unittest.TestCase):
    def test_workflow_sources_and_topological_imports(self):
        spec = importlib.util.spec_from_file_location('sparse_closure', ROOT / 'audit/actual-sparse64/closure.py')
        closure = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(closure)
        modules, _ = closure.inventory()
        seen = set(modules)
        ordered = [ROOT / 'lean' / (n + '.lean') for n in
                   ('MixedDag', 'CaseRules', 'CaseDual', 'CaseTree',
                    'MixedCaseTrimCandidate', 'Node1209SourceCandidate')]
        ordered += sorted((ROOT / 'audit/node1209-closure').glob('Small*.lean'))
        ordered += [ROOT / 'audit/node1209-closure' / (n + '.lean')
                    for n in ('Dense', 'AssemblyCandidate', 'AssemblyContract', 'AssemblyExactTypeCandidate')]
        self.assertEqual(len(ordered), 33)
        for path in ordered:
            text = path.read_text()
            for dep in re.findall(r'^import ([\w.]+)$', text, re.M):
                self.assertTrue(dep in seen or dep.startswith('Mathlib.'), (path, dep))
            self.assertIsNone(re.search(r'\b(?:sorry|admit|native_decide)\b', text), path)
            self.assertNotIn(path.stem, seen)
            seen.add(path.stem)
        self.assertIn('FirstExtensionBridge', modules)
        self.assertNotIn('ExtensionFirstArchive', modules)

    def test_all_cases_and_conditional_contract(self):
        src = (ROOT / 'audit/node1209-closure/AssemblyCandidate.lean').read_text()
        checks = [int(n) for n in re.findall(r'^  · exact Node1209Dense.check(\d+)$', src, re.M)]
        holes = [int(n) for n in re.findall(r'^  · exact h(\d+)$', src, re.M)]
        self.assertEqual(holes, [4, 5, 7, 8, 14, 15, 374, 375])
        self.assertEqual(len(checks), 368)
        branches = [int(n) for n in re.findall(r'^  · exact (?:Node1209Dense\.check|h)(\d+)$', src, re.M)]
        self.assertEqual(branches, list(range(376)))
        dense = (ROOT / 'audit/node1209-closure/Dense.lean').read_text()
        for i, rule in [(4, 'caseRule'), (5, 'trimRule'), (7, 'caseRule'),
                        (8, 'trimRule'), (14, 'caseRule'), (15, 'trimRule'),
                        (374, 'caseRule'), (375, '.pack')]:
            arm = re.search(rf'^  \| {i} => (.*)$', dense, re.M)
            self.assertIsNotNone(arm)
            self.assertIn(rule, arm.group(1))
        source = (ROOT / 'lean/Node1209SourceCandidate.lean').read_text()
        root = re.search(r'^  \| 375 => (⟨\{.*?\}, 258,)', dense, re.M)
        original = re.search(r'^  (⟨\{.*?\}, 258,)', source, re.M)
        self.assertIsNotNone(root)
        self.assertIsNotNone(original)
        self.assertEqual(root.group(1), original.group(1))
        self.assertIn('FirstExtensionBridge.target_bound (source_bound', src)
        contract = (ROOT / 'audit/node1209-closure/AssemblyContract.lean').read_text()
        for theorem in ('valid', 'source_bound', 'target_bound'):
            self.assertIn('Node1209AssemblyCandidate.' + theorem, contract)
        self.assertEqual(contract.count('Check 374 → Check 375 →'), 3)

    def test_workflow_enforces_contract_and_axioms(self):
        workflow = (ROOT / '.github/workflows/node1209-assembly-candidate.yml').read_text()
        for text in ('permissions:\n  contents: read', 'persist-credentials: false',
                     'audit/actual-sparse64/closure.py', 'audit/actual-sparse64/build.py',
                     'Small*.lean,Dense.lean,AssemblyCandidate.lean,AssemblyContract.lean,AssemblyExactTypeCandidate.lean',
                     'AssemblyCandidate AssemblyContract AssemblyExactTypeCandidate', 'set -euo pipefail',
                     'Node1209AssemblyCandidate.valid Node1209AssemblyCandidate.source_bound Node1209AssemblyCandidate.target_bound'):
            self.assertIn(text, workflow)


if __name__ == '__main__':
    unittest.main()
