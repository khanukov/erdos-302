import importlib.util
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name('cap_probe.py')
spec = importlib.util.spec_from_file_location('cap_probe', SCRIPT)
probe = importlib.util.module_from_spec(spec)
spec.loader.exec_module(probe)


class CapProbeTests(unittest.TestCase):
    def test_diagnostic_workflow_preserves_required_and_search_roots(self):
        workflow = (SCRIPT.parents[2] / '.github/workflows/full-local-assembly-candidate.yml').read_text()
        diagnostic = workflow.split('\n  resource_diagnostic:\n', 1)[1]
        step = diagnostic.split('      - name: Compare fresh FullLocalCommon processes (diagnostic only)\n', 1)[1]
        step = step.split('\n      - name:', 1)[0]
        self.assertIn('python3 -m unittest discover -s "$GITHUB_WORKSPACE/audit/full-reflective" -p test_cap_probe.py -v', step)
        self.assertIn('inputs=(--input "$p" --input "$(lean --print-prefix)")', step)
        self.assertIn('IFS=: read -r -a lean_paths <<< "$LEAN_PATH"', step)
        self.assertIn('for dir in "${lean_paths[@]}"; do\n            test -z "$dir" || inputs+=(--allow-missing-input "$dir")\n          done', step)
        self.assertIn('"${inputs[@]}" --', step)
        self.assertIn('if: always()', diagnostic)
        self.assertIn('${{ runner.temp }}/cap-comparison/', diagnostic)

    def test_timeout_preserves_rss(self):
        with tempfile.TemporaryDirectory() as tmp:
            report = probe.run(1048576, [sys.executable, '-c',
                'import time; x=bytearray(24*1024*1024); time.sleep(30)'], Path(tmp), 1)
            self.assertTrue(report['timed_out'])
            self.assertGreater(report['max_rss_kib'], 20000)

    def test_stable_inputs_and_failed_commands_are_reported_for_both_caps(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / 'input').write_text('fixed')
            result = subprocess.run([sys.executable, str(SCRIPT), '--output', str(root / 'out'),
                '--timeout', '2', '--input', str(root / 'input'), '--', sys.executable, '-c',
                'import sys; sys.exit(3)'], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            reports = json.loads((root / 'out' / 'comparison.json').read_text())
            self.assertEqual([r['returncode'] for r in reports], [3, 3])
            self.assertTrue(all(r['inputs_unchanged'] and r['inputs_identical_across_runs'] for r in reports))

    def test_declared_missing_search_root_is_recorded_and_existing_files_hashed(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            existing = root / 'project'
            existing.mkdir()
            (existing / 'Dep.olean').write_text('dependency')
            missing = root / 'Cli' / '.lake' / 'build' / 'lib' / 'lean'
            result = subprocess.run([sys.executable, str(SCRIPT), '--output', str(root / 'out'),
                '--input', str(existing), '--allow-missing-input', str(missing), '--',
                sys.executable, '-c', 'pass'], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            data = json.loads((root / 'out' / '8388608' / 'inputs-before.json').read_text())
            self.assertIn(str(existing / 'Dep.olean'), data['files'])
            self.assertEqual(data['missing_roots'], [str(missing)])

    def test_missing_required_root_fails(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            result = subprocess.run([sys.executable, str(SCRIPT), '--output', str(root / 'out'),
                '--input', str(root / 'missing'), '--', sys.executable, '-c', 'pass'],
                capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)

    def test_optional_root_appearing_invalidates_comparison(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            required = root / 'required'
            required.mkdir()
            missing = root / 'missing'
            result = subprocess.run([sys.executable, str(SCRIPT), '--output', str(root / 'out'),
                '--input', str(required), '--allow-missing-input', str(missing), '--',
                sys.executable, '-c', 'from pathlib import Path; Path(%r).mkdir(exist_ok=True)' % str(missing)],
                capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            reports = json.loads((root / 'out' / 'comparison.json').read_text())
            self.assertFalse(reports[0]['inputs_unchanged'])
            self.assertFalse(reports[0]['inputs_identical_across_runs'])

    def test_existing_optional_root_mutation_invalidates_comparison(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            required = root / 'required'
            required.mkdir()
            dependency = root / 'dependency'
            dependency.mkdir()
            file = dependency / 'Dep.olean'
            file.write_text('original')
            result = subprocess.run([sys.executable, str(SCRIPT), '--output', str(root / 'out'),
                '--input', str(required), '--allow-missing-input', str(dependency), '--',
                sys.executable, '-c', 'from pathlib import Path; Path(%r).write_text("modified")' % str(file)],
                capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            reports = json.loads((root / 'out' / 'comparison.json').read_text())
            self.assertFalse(reports[0]['inputs_unchanged'])

    def test_optional_dangling_symlink_fails_closed(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / 'required').mkdir()
            (root / 'link').symlink_to(root / 'missing')
            result = subprocess.run([sys.executable, str(SCRIPT), '--output', str(root / 'out'),
                '--input', str(root / 'required'), '--allow-missing-input', str(root / 'link' / 'child'),
                '--', sys.executable, '-c', 'pass'], capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)

    def test_per_run_input_hash_detects_transitive_mutation(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            inputs = root / 'inputs'
            inputs.mkdir()
            transitive = inputs / 'nested' / 'Dep.olean'
            transitive.parent.mkdir()
            transitive.write_text('original')
            result = subprocess.run([sys.executable, str(SCRIPT), '--output', str(root / 'out'),
                '--timeout', '2', '--input', str(inputs), '--', sys.executable, '-c',
                'from pathlib import Path; p=Path(%r); p.write_text(p.read_text()+"x")' % str(transitive)],
                capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            reports = json.loads((root / 'out' / 'comparison.json').read_text())
            self.assertEqual(len(reports), 2)
            first = json.loads((root / 'out' / str(8388608) / 'inputs-before.json').read_text())
            second = json.loads((root / 'out' / str(25165824) / 'inputs-before.json').read_text())
            self.assertNotEqual(first, second)
            self.assertFalse(reports[0]['inputs_unchanged'])

if __name__ == '__main__':
    unittest.main()
