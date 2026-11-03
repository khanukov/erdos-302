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
