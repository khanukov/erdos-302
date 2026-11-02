import json
import pathlib
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]

class UpperProjectTests(unittest.TestCase):
    def test_manifest_has_only_mathlib_and_its_dependencies(self):
        manifest = json.loads((ROOT / 'lake-manifest.json').read_text())
        packages = {p['name']: p for p in manifest['packages']}
        self.assertNotIn('erdos301', packages)
        self.assertNotIn('erdos327', packages)
        self.assertEqual(packages['mathlib']['rev'], 'da1f94df976c7cd38117281c57d6ee3046c8d104')
        self.assertFalse(packages['mathlib']['inherited'])

    def test_literal_no_triple_definition(self):
        text = (ROOT / 'lean/Erdos302Lower/Defs.lean').read_text()
        self.assertIn('∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A,\n    a ≠ b → a ≠ c → b ≠ c →\n      (1 : ℚ) / a ≠ (1 : ℚ) / b + (1 : ℚ) / c', text)

    def test_lake_roots_match_recursive_local_imports(self):
        import re
        import tomllib
        config = tomllib.loads((ROOT / 'lakefile.toml').read_text())
        libs = {lib['name']: lib for lib in config['lean_lib']}
        self.assertEqual(set(libs), {'UpperIntegration', 'ArchiveLedgerPilot'})
        self.assertEqual(config['defaultTargets'], ['UpperIntegration'])
        self.assertEqual(libs['UpperIntegration']['srcDir'], 'lean')
        self.assertEqual(libs['ArchiveLedgerPilot']['srcDir'], 'audit/ledger-candidate/lean')
        sources = {}
        for lib in libs.values():
            directory = ROOT / lib['srcDir']
            for path in directory.rglob('*.lean'):
                name = '.'.join(path.relative_to(directory).with_suffix('').parts)
                self.assertNotIn(name, sources, f'duplicate module: {name}')
                sources[name] = path
        seen = set()
        def visit(name):
            if name in seen or name.split('.')[0] in {'Mathlib', 'Lean', 'Std'}:
                return
            self.assertIn(name, sources, f'unresolved local import: {name}')
            seen.add(name)
            for line in re.findall(r'^import\s+([^\n]+)', sources[name].read_text(), re.M):
                for dep in line.split():
                    visit(dep)
        visit('UpperIntegration')
        for lib in libs.values():
            roots = lib['roots']
            self.assertEqual(len(roots), len(set(roots)), 'duplicate root')
            owned = {name for name, path in sources.items()
                     if path.is_relative_to(ROOT / lib['srcDir'])}
            expected = seen & owned
            self.assertEqual(set(roots), expected, lib['name'])
            # Lake roots are namespace prefixes, not just individual modules.
            expanded = {name for name in owned for root in roots
                        if name == root or name.startswith(root + '.')}
            self.assertEqual(expanded, expected, 'implicit extra root descendants')
        exclusions = (ROOT / 'audit/upper-integration-excluded.txt').read_text().splitlines()
        exclusions = [line for line in exclusions if line and not line.startswith('#')]
        self.assertEqual(len(exclusions), len(set(exclusions)))
        self.assertEqual(set(exclusions), set(sources) - seen, 'unrecorded source exclusion')
        self.assertTrue({'GainFold', 'GainPrefix', 'GainPrefixTest'} <= seen)
        self.assertIn('ArchiveLedgerSumBridge', seen)
        self.assertTrue({'ArchiveErrorMatchCandidate', 'ArchiveErrorMatchCandidateTests',
                         'ArchiveIndexedEndpoint', 'ArchiveIndexedEndpointTests'} <= seen)
        self.assertIn('ArchiveLedger', seen)
        self.assertIn('LedgerChecker', seen)
        self.assertIn('LedgerTests', seen)
        self.assertNotIn('PilotAudit', seen)  # Reports are integrated directly.
        self.assertNotIn('Pack1094Tests', seen)  # monolithic proof previously exited 143

    def test_integrated_axiom_audit_and_ledger_gates(self):
        source = (ROOT / 'lean/UpperIntegration.lean').read_text()
        workflow = (ROOT / '.github/workflows/upper-integration.yml').read_text()
        commands = [line.strip() for line in workflow.splitlines()
                    if line.strip().startswith('python3 audit/mathlib-bridge-ci/check_axioms.py ')]
        self.assertEqual(len(commands), 1)
        audit_args = commands[0].split()
        for name in ['GainFold.fold_gain_occurrences', 'GainFold.fold_gain_fin',
                     'GainFold.fold_project', 'GainPrefix.occurrences_eq_prefix_entries',
                     'GainPrefix.fold_eq_prefix_entries',
                     'ArchiveSmallPrefix.valid', 'ArchiveSmallPrefix.sound',
                     'ArchiveLedger.archive_check', 'ArchiveLedger.archive_valid',
                     'ArchiveLedger.archive_arithmetic',
                     'ArchiveLedgerSumBridge.ledger_gain_complement',
                     'ArchiveLedgerSumBridge.ledger_error_real',
                     'ArchiveLedgerSumBridge.conditional_literal_endpoint',
                     'ArchiveLedgerSumBridge.conditional_indexed_endpoint',
                     'ArchiveErrorMatchCandidate.entries_error',
                     'ArchiveErrorMatchCandidate.occurrence_error',
                     'ArchiveErrorMatchCandidate.indexed_error',
                     'ArchiveLedgerSumBridge.indexed_endpoint_no_error']:
            self.assertIn('#print axioms ' + name, source)
            self.assertIn(name, audit_args)
        self.assertIn('unittest discover -s audit/ledger-candidate/tests', workflow)
        self.assertIn('python3 -B -O -m unittest discover -s audit/ledger-candidate/tests', workflow)
        self.assertIn('python3 -B -m unittest discover -s independent_bank -p test_archive_prefix.py', workflow)
        self.assertIn('python3 -B -O -m unittest discover -s independent_bank -p test_archive_prefix.py', workflow)
        self.assertIn('python3 -B independent_bank/archive_prefix.py', workflow)
        self.assertIn('import ArchiveSmallPrefixTest', source)

    def test_case7_integrated_and_audited(self):
        import tomllib
        config = tomllib.loads((ROOT / 'lakefile.toml').read_text())
        roots = next(lib['roots'] for lib in config['lean_lib'] if lib['name'] == 'UpperIntegration')
        for module in ('ArchiveCase7', 'ArchiveCase7Staged', 'ArchiveCase7StagedTest'):
            self.assertIn(module, roots)
            self.assertNotIn(module, (ROOT / 'audit/upper-integration-excluded.txt').read_text().splitlines())
        source = (ROOT / 'lean/UpperIntegration.lean').read_text()
        workflow = (ROOT / '.github/workflows/upper-integration.yml').read_text()
        self.assertIn('import ArchiveCase7StagedTest', source)
        for theorem in ('ArchiveCase7.check_valid', 'ArchiveCase7Staged.image0',
                        'ArchiveCase7Staged.image1', 'ArchiveCase7Staged.image2',
                        'ArchiveCase7Staged.image3', 'ArchiveCase7Staged.bound7',
                        'ArchiveCase7StagedTest.replay_bound'):
            self.assertIn('#print axioms ' + theorem, source)
            self.assertIn(theorem, workflow.split('python3 audit/mathlib-bridge-ci/check_axioms.py ')[-1].split())
        for command in ('python3 -B -m unittest discover -s independent_bank -p test_case7_translation.py',
                        'python3 -B -O -m unittest discover -s independent_bank -p test_case7_translation.py',
                        'python3 -B independent_bank/case7_translation.py'):
            self.assertIn(command, workflow)

    def test_trim8_integrated_and_audited(self):
        import tomllib
        roots = next(lib['roots'] for lib in tomllib.loads(
            (ROOT / 'lakefile.toml').read_text())['lean_lib']
            if lib['name'] == 'UpperIntegration')
        for module in ('ArchiveTrim8', 'ArchiveTrim8Test'):
            self.assertIn(module, roots)
            self.assertNotIn(module, (ROOT / 'audit/upper-integration-excluded.txt').read_text().splitlines())
        source = (ROOT / 'lean/UpperIntegration.lean').read_text().splitlines()
        workflow = (ROOT / '.github/workflows/upper-integration.yml').read_text()
        self.assertIn('import ArchiveTrim8Test', source)
        audit = next(line.split() for line in workflow.splitlines()
                     if line.strip().startswith('python3 audit/mathlib-bridge-ci/check_axioms.py '))
        for name in ('ArchiveTrim8.all_edges_retained', 'ArchiveTrim8.target_subset',
                     'ArchiveTrim8.witnesses_valid', 'ArchiveTrim8.every_retained_has_witness',
                     'ArchiveTrim8.image7_eq', 'ArchiveTrim8.image7_bound',
                     'ArchiveTrim8.bound8', 'ArchiveTrim8Test.replay_bound'):
            self.assertIn('#print axioms ' + name, source)
            self.assertIn(name, audit)
        for command in ('python3 -B -m unittest discover -s independent_bank -p test_trim8.py',
                        'python3 -B -O -m unittest discover -s independent_bank -p test_trim8.py',
                        'python3 -B independent_bank/trim8.py'):
            self.assertIn(command, workflow)
        test = (ROOT / 'lean/ArchiveTrim8Test.lean').read_text()
        self.assertIn('using ArchiveTrim8.bound8', test)

    def test_hgain_endpoint_is_integration_gated(self):
        source = (ROOT / 'lean/UpperIntegration.lean').read_text()
        workflow = (ROOT / '.github/workflows/upper-integration.yml').read_text()
        for module in ['DensityPrefixCandidateTests', 'HGainCandidateTest', 'ArchiveIndexedGainEndpointTest']:
            self.assertIn('import ' + module, source)
        for name in ['DensityPrefixCandidate.indexed_density_direct', 'HGainCandidate.indexed_hgain', 'ArchiveLedgerSumBridge.indexed_endpoint_no_error_no_gain']:
            self.assertIn('#print axioms ' + name, source)
            self.assertIn(name, workflow)
        for pattern in ['lean/HGainCandidate*.lean', 'lean/DensityPrefixCandidate*.lean', 'lean/ArchiveIndexedGainEndpoint*.lean']:
            self.assertIn(pattern, workflow)

    def test_endpoint_premises_integrated_without_weakening(self):
        import re
        import tomllib
        roots = next(lib['roots'] for lib in tomllib.loads(
            (ROOT / 'lakefile.toml').read_text())['lean_lib']
            if lib['name'] == 'UpperIntegration')
        exclusions = (ROOT / 'audit/upper-integration-excluded.txt').read_text().splitlines()
        source = (ROOT / 'lean/UpperIntegration.lean').read_text()
        workflow = (ROOT / '.github/workflows/upper-integration.yml').read_text()
        for module in ('EndpointPremisesCandidate', 'EndpointPremisesCandidateTests'):
            self.assertIn(module, roots)
            self.assertNotIn(module, exclusions)
        self.assertIn('import EndpointPremisesCandidateTests', source.splitlines())
        audit = next(line.split() for line in workflow.splitlines()
                     if line.strip().startswith('python3 audit/mathlib-bridge-ci/check_axioms.py '))
        for suffix in ('literal_cell_bounds', 'literal_prefix_inputs', 'indexed_a_pos',
                       'indexed_a_lt_b', 'indexed_b_pos', 'indexed_quotient_order',
                       'indexed_prime', 'indexed_density_bounds', 'indexed_budget',
                       'endpoint_of_cover'):
            name = 'EndpointPremisesCandidate.' + suffix
            self.assertIn('#print axioms ' + name, source.splitlines())
            self.assertIn(name, audit)
        self.assertIn('lean/EndpointPremisesCandidate*.lean', workflow)
        for cmd in ('python3 -B tests/test_endpoint_premises.py',
                    'python3 -B -O tests/test_endpoint_premises.py'):
            self.assertIn(cmd, workflow)
        theorem = (ROOT / 'lean/EndpointPremisesCandidate.lean').read_text()
        declaration = re.search(r'theorem endpoint_of_cover\b(.*?)\s*:= by', theorem, re.S)
        self.assertIsNotNone(declaration)
        self.assertEqual(' '.join(declaration.group(1).split()), ' '.join('''
            (N : ℕ) (f : ℝ)
            (hcover : f + ArchiveSummation.weightedCount Finset.univ cellHeight
              (fun i => (ArchiveSummation.cellCount N (cellA i) (cellB i)
                (fun q => Nat.Coprime q (∏ p ∈ cellPrimes i, p)) : ℝ)) ≤ N) :
            f ≤ (ArchiveLedger.targetC : ℝ) * (N : ℝ) + 55064831540
        '''.split()))

    def test_automatic_ci_builds_integration(self):
        text = (ROOT / '.github/workflows/upper-integration.yml').read_text()
        for s in ['pull_request:', 'push:', 'main', 'lake build UpperIntegration']:
            self.assertIn(s, text)

if __name__ == '__main__': unittest.main()
