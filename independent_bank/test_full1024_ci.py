import importlib.util
from pathlib import Path
import subprocess
import os
import sys
from contextlib import contextmanager
import tempfile
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location('full1024_ci', Path(__file__).with_name('full1024_ci.py'))
ci = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ci)


class Full1024Tests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.project = Path(self.temp.name) / 'project'
        self.project.mkdir()
        self.logs = Path(self.temp.name) / 'logs'
        for name in [f'ActualPrefix1024Checks{i}' for i in range(64)] + ['ActualPrefix1024Sound']:
            (self.project / (name + '.lean')).write_text(name)
        self.fake = Path(self.temp.name) / 'lean'
        self.fake.write_text("#!" + sys.executable + "\n" + r"""
import os, pathlib, sys
output = pathlib.Path(sys.argv[2]); module = output.stem
with open(os.environ['CALLS'], 'a') as f: f.write(module + '\n')
bad = os.environ.get('BAD', '')
if module == 'ActualPrefix1024Checks1' and os.environ.get('MUTATE'):
    import time
    while pathlib.Path(os.environ['MUTATE']).read_bytes() != b'mutated': time.sleep(.001)
if module == bad: sys.exit(1)
output.write_bytes(b'olean')
if module == 'ActualPrefix1024Checks0' and os.environ.get('MUTATE'):
    pathlib.Path(os.environ['MUTATE']).write_bytes(b'mutated')
if module == 'ActualPrefix1024Sound':
    names = [f'ActualPrefix1024.segment{i}' for i in range(64)] + ['ActualPrefix1024.checked', 'ActualPrefix1024.sound']
else:
    i = int(module.removeprefix('ActualPrefix1024Checks'))
    names = [f'ActualPrefix1024.check{n}' for n in range(16*i, 16*i+16)]
if bad == 'missing-report' and module == 'ActualPrefix1024Checks3': names.pop()
for name in names: print(f"'{name}' does not depend on any axioms")
if bad == 'forbidden' and module == 'ActualPrefix1024Sound': print('sorryAx')
""")
        self.fake.chmod(0o755)
        self.calls = Path(self.temp.name) / 'calls'
        self.bad = ''

    @property
    def called(self):
        return self.calls.read_text().splitlines() if self.calls.exists() else []

    @contextmanager
    def fake_run(self):
        with patch.dict(os.environ, {'CALLS': str(self.calls), 'BAD': self.bad}):
            original = ci.run
            def run(project, logs):
                return original(project, logs, lean=str(self.fake))
            with patch.object(ci, 'run', run):
                yield

    def test_exact_complete_coverage_and_aggregate_last(self):
        with self.fake_run():
            ci.run(self.project, self.logs)
        self.assertEqual(len(self.called), 65)
        self.assertEqual(self.called[-1], 'ActualPrefix1024Sound')
        import json
        data = json.loads((self.logs / 'full1024-evidence.json').read_text())
        self.assertEqual((data['checks'], data['segments'], len(data['shards'])), (1024, 64, 64))
        self.assertEqual(data['aggregate']['axiom_reports'], 66)
        self.assertEqual(data['shards'][0]['input_manifest'], {
            'ActualPrefix1024Checks0.lean': __import__('hashlib').sha256(b'ActualPrefix1024Checks0').hexdigest()})

    def test_manifest_records_transitive_local_imports(self):
        import hashlib, json
        (self.project / 'ActualPrefix1024Checks0.lean').write_text('import Dependency\n')
        (self.project / 'Dependency.lean').write_text('import Nested\n')
        (self.project / 'Dependency.olean').write_bytes(b'dep')
        (self.project / 'Nested.lean').write_text('-- leaf\n')
        (self.project / 'Nested.olean').write_bytes(b'nested')
        with self.fake_run():
            ci.run(self.project, self.logs)
        record = json.loads((self.logs / 'full1024-evidence.json').read_text())['shards'][0]
        expected = ['ActualPrefix1024Checks0.lean', 'Dependency.lean', 'Dependency.olean', 'Nested.lean', 'Nested.olean']
        self.assertEqual(record['input_manifest'], {name: hashlib.sha256((self.project / name).read_bytes()).hexdigest() for name in expected})

    def test_compiler_input_mutation_fails_before_axiom_gate(self):
        for target in ('ActualPrefix1024Checks0.lean', 'Dependency.olean'):
            with self.subTest(target=target):
                dep = self.project / 'Dependency.olean'
                dep.write_bytes(b'original')
                (self.project / 'Dependency.lean').write_text('dependency')
                (self.project / 'ActualPrefix1024Checks0.lean').write_text('import Dependency\n')
                changed = self.project / target
                with patch.dict(os.environ, {'CALLS': str(self.calls), 'MUTATE': str(changed)}):
                    with patch.object(ci.axioms, 'check', side_effect=AssertionError('gate reached')):
                        with self.assertRaisesRegex(ValueError, 'input.*changed'):
                            ci.run(self.project, self.logs, lean=str(self.fake))
                self.assertFalse((self.logs / 'full1024-evidence.json').exists())
                for p in self.project.glob('ActualPrefix1024Checks*.olean'): p.unlink()
                (self.project / 'ActualPrefix1024Checks0.lean').write_text('ActualPrefix1024Checks0')

    def test_added_initially_missing_import_is_rejected(self):
        (self.project / 'ActualPrefix1024Checks0.lean').write_text('import Mathlib.Added\n')
        script = self.fake.read_text().replace("bad = os.environ.get('BAD', '')", """bad = os.environ.get('BAD', '')
if module == 'ActualPrefix1024Checks0':
    (output.parent / 'Mathlib').mkdir(exist_ok=True)
    (output.parent / 'Mathlib/Added.lean').write_text('-- added')
    (output.parent / 'Mathlib/Added.olean').write_bytes(b'added')
""")
        self.fake.write_text(script)
        with self.fake_run(), self.assertRaisesRegex(ValueError, 'inventory changed'):
            ci.run(self.project, self.logs)
        self.assertIn('ActualPrefix1024Checks0', self.called)
        self.assertFalse((self.logs / 'full1024-evidence.json').exists())

    def test_persistent_inventory_changes_fail(self):
        for kind in ('hidden-add', 'object-add', 'source-delete', 'object-delete'):
            with self.subTest(kind=kind), tempfile.TemporaryDirectory() as temp:
                project = Path(temp) / 'project'; project.mkdir()
                for name in [f'ActualPrefix1024Checks{i}' for i in range(64)] + ['ActualPrefix1024Sound']:
                    (project / (name + '.lean')).write_text(name)
                (project / 'Existing.lean').write_text('existing')
                (project / 'Existing.olean').write_bytes(b'existing')
                operation = {
                    'hidden-add': "(output.parent / '.hidden').mkdir(exist_ok=True); (output.parent / '.hidden/New.lean').write_text('new')",
                    'object-add': "(output.parent / 'New.olean').write_bytes(b'new')",
                    'source-delete': "(output.parent / 'Existing.lean').unlink(missing_ok=True)",
                    'object-delete': "(output.parent / 'Existing.olean').unlink(missing_ok=True)",
                }[kind]
                fake = Path(temp) / 'lean'
                fake.write_text(self.fake.read_text().replace("bad = os.environ.get('BAD', '')", "bad = os.environ.get('BAD', '')\nif module == 'ActualPrefix1024Checks0': " + operation))
                fake.chmod(0o755)
                logs = Path(temp) / 'logs'
                with patch.dict(os.environ, {'CALLS': str(Path(temp) / 'calls')}), self.assertRaisesRegex(ValueError, 'inventory changed'):
                    ci.run(project, logs, lean=str(fake))
                self.assertFalse((logs / 'full1024-evidence.json').exists())

    def test_unknown_import_is_rejected(self):
        (self.project / 'ActualPrefix1024Checks0.lean').write_text('import Added\n')
        with self.fake_run(), self.assertRaisesRegex(ValueError, 'unknown import'):
            ci.run(self.project, self.logs)
        self.assertEqual(self.called, [])

    def test_failed_shard_never_assembles(self):
        self.bad = 'ActualPrefix1024Checks7'
        with self.fake_run():
            with self.assertRaises(subprocess.CalledProcessError):
                ci.run(self.project, self.logs)
        self.assertNotIn('ActualPrefix1024Sound', self.called)
        self.assertFalse((self.logs / 'full1024-evidence.json').exists())

    def test_missing_axiom_report_never_assembles(self):
        self.bad = 'missing-report'
        with self.fake_run():
            with self.assertRaises(ValueError):
                ci.run(self.project, self.logs)
        self.assertNotIn('ActualPrefix1024Sound', self.called)

    def test_forbidden_final_axiom_fails(self):
        self.logs.mkdir()
        (self.logs / 'full1024-evidence.json').write_text('stale')
        self.bad = 'forbidden'
        with self.fake_run():
            with self.assertRaises(ValueError):
                ci.run(self.project, self.logs)
        self.assertFalse((self.logs / 'full1024-evidence.json').exists())

    def test_out_of_order_failure_terminates_process_group_and_clears_evidence(self):
        import os
        import time
        import sys
        fake = Path(self.temp.name) / 'fake-lean'
        fake.write_text("""#!""" + sys.executable + """
import os, pathlib, subprocess, sys, time
module = pathlib.Path(sys.argv[-1]).stem
root = pathlib.Path(os.environ['FAKE_ROOT'])
(root / (module + '.started')).touch()
if module.endswith('Checks0'):
    child = subprocess.Popen([sys.executable, '-c', 'import time; time.sleep(30)'])
    (root / 'child.pid').write_text(str(child.pid))
    time.sleep(30)
elif module.endswith('Checks1'):
    while not (root / 'child.pid').exists(): time.sleep(.01)
    sys.exit(23)
time.sleep(30)
""")
        fake.chmod(0o755)
        self.logs.mkdir()
        evidence = self.logs / 'full1024-evidence.json'
        evidence.write_text('stale success')
        start = time.monotonic()
        with patch.dict(os.environ, {'FAKE_ROOT': self.temp.name}):
            with self.assertRaises(subprocess.CalledProcessError):
                ci.run(self.project, self.logs, lean=str(fake), timeout=40)
        self.assertLess(time.monotonic() - start, 5)
        self.assertFalse(evidence.exists())
        self.assertEqual(sorted(p.name for p in Path(self.temp.name).glob('*.started')),
                         ['ActualPrefix1024Checks0.started', 'ActualPrefix1024Checks1.started'])
        pid = int((Path(self.temp.name) / 'child.pid').read_text())
        # An orphaned zombie is dead, even if init has not reaped it yet.
        stat = Path(f'/proc/{pid}/stat')
        deadline = time.monotonic() + 2
        while stat.exists() and stat.read_text().split()[2] != 'Z' and time.monotonic() < deadline:
            time.sleep(.01)
        self.assertTrue(not stat.exists() or stat.read_text().split()[2] == 'Z')

    def test_atomic_publication_failure_leaves_no_evidence_or_temp(self):
        self.logs.mkdir()
        (self.logs / 'full1024-evidence.json').write_text('stale')
        with self.fake_run(), patch.object(ci.os, 'replace', side_effect=OSError('disk error')):
            with self.assertRaisesRegex(OSError, 'disk error'):
                ci.run(self.project, self.logs)
        self.assertFalse((self.logs / 'full1024-evidence.json').exists())
        self.assertEqual(list(self.logs.glob('.full1024-evidence-*')), [])

    def test_workflow_integrity(self):
        workflow = (Path(__file__).resolve().parents[1] / '.github/workflows/actual-prefix1024-full.yml').read_text()
        for expected in ['timeout-minutes: 360', 'git rev-parse HEAD', 'prefix1024_shards.py --check',
                         'full1024_ci.py', 'timeout 15m lean -o ActualPrefix1024Data.olean',
                         'if: always()', 'retention-days: 30', 'LEAN_NUM_THREADS=1']:
            self.assertIn(expected, workflow)
        self.assertNotIn('ActualPrefix1024Representative', workflow)

    def test_preexisting_output_rejected(self):
        (self.project / 'ActualPrefix1024Checks0.olean').write_bytes(b'stale')
        with self.fake_run():
            with self.assertRaises(ValueError):
                ci.run(self.project, self.logs)
        self.assertNotIn('ActualPrefix1024Sound', self.called)


    def test_search_path_shadow_rejected_before_work_and_stale_evidence_removed(self):
        shadow = Path(self.temp.name) / 'shadow'; shadow.mkdir()
        (shadow / 'ActualPrefix1024Data.olean').write_bytes(b'bad')
        (self.project / 'ActualPrefix1024Data.lean').write_text('data')
        self.logs.mkdir()
        (self.logs / 'full1024-evidence.json').write_text('stale')
        with patch.dict(os.environ, {'LEAN_PATH': str(shadow)}), self.fake_run():
            with self.assertRaisesRegex(ValueError, 'shadow'):
                ci.run(self.project, self.logs)
        self.assertEqual(self.called, [])
        self.assertFalse((self.logs / 'full1024-evidence.json').exists())

    def test_nested_shadow_rejected_but_expected_staged_defs_allowed(self):
        local = self.project / 'Erdos302Lower/Defs.lean'
        local.parent.mkdir(); local.write_text('defs')
        staged = self.project / '.lake/build/lib/lean/Erdos302Lower/Defs.olean'
        staged.parent.mkdir(parents=True); staged.write_bytes(b'legitimate')
        shadow = Path(self.temp.name) / 'shadow/Erdos302Lower/Defs.olean'
        shadow.parent.mkdir(parents=True); shadow.write_bytes(b'bad')
        with patch.dict(os.environ, {'LEAN_PATH': os.pathsep.join([str(shadow.parents[1]), str(staged.parents[1]), str(self.project)])}):
            with self.assertRaisesRegex(ValueError, 'shadow'):
                ci.check_search_path(self.project)
        with patch.dict(os.environ, {'LEAN_PATH': os.pathsep.join([str(staged.parents[1]), str(self.project)])}):
            ci.check_search_path(self.project)
        other = staged.parent / 'Other.olean'
        (local.parent / 'Other.lean').write_text('other'); other.write_bytes(b'bad')
        with patch.dict(os.environ, {'LEAN_PATH': str(staged.parents[1])}):
            with self.assertRaisesRegex(ValueError, 'shadow'):
                ci.check_search_path(self.project)

    def test_child_signal_mask_unblocked(self):
        fake = Path(self.temp.name) / 'mask-lean'
        fake.write_text('#!' + sys.executable + '\n' + '''
import signal, sys
mask = signal.pthread_sigmask(signal.SIG_BLOCK, [])
sys.exit(1 if signal.SIGINT in mask or signal.SIGTERM in mask else 0)
''')
        fake.chmod(0o755)
        with self.assertRaisesRegex(ValueError, 'missing or empty output'):
            ci.run(self.project, self.logs, lean=str(fake))

    def test_successful_leader_descendant_cannot_mutate_output(self):
        fake = Path(self.temp.name) / 'forking-lean'
        fake.write_text('#!' + sys.executable + '\n' + '''
import pathlib, subprocess, sys
output = pathlib.Path(sys.argv[2]); module = output.stem
if module.endswith('Checks0'):
    subprocess.Popen([sys.executable, '-c', "import time,pathlib,sys; time.sleep(.4); pathlib.Path(sys.argv[1]).write_bytes(b'mutated')", str(output)], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
output.write_bytes(b'olean')
if module.endswith('Sound'):
    names = [f'ActualPrefix1024.segment{i}' for i in range(64)] + ['ActualPrefix1024.checked', 'ActualPrefix1024.sound']
else:
    i = int(module.removeprefix('ActualPrefix1024Checks'))
    names = [f'ActualPrefix1024.check{n}' for n in range(16*i,16*i+16)]
for name in names: print(f"'{name}' does not depend on any axioms")
''')
        fake.chmod(0o755)
        ci.run(self.project, self.logs, lean=str(fake))
        self.assertEqual((self.project / 'ActualPrefix1024Checks0.olean').read_bytes(), b'olean')

    def test_sigterm_and_sigint_cleanup_groups_and_stale_evidence(self):
        import signal, time
        for sig in (signal.SIGTERM, signal.SIGINT):
            with self.subTest(signal=sig):
                root = Path(self.temp.name) / str(sig); root.mkdir()
                logs = root / 'logs'; logs.mkdir()
                evidence = logs / 'full1024-evidence.json'; evidence.write_text('stale')
                fake = root / 'lean'
                fake.write_text('#!' + sys.executable + '\n' + '''
import os,pathlib,subprocess,sys,time
root=pathlib.Path(os.environ['FAKE_ROOT'])
child=subprocess.Popen([sys.executable,'-c','import time; time.sleep(30)'])
(root / (pathlib.Path(sys.argv[-1]).stem + '.pid')).write_text(str(child.pid))
time.sleep(30)
''')
                fake.chmod(0o755)
                env = dict(os.environ, FAKE_ROOT=str(root), PATH=str(root) + os.pathsep + os.environ['PATH'])
                proc = subprocess.Popen([sys.executable, str(Path(ci.__file__)), str(self.project), str(logs)], env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                try:
                    deadline = time.monotonic() + 5
                    while len(list(root.glob('*.pid'))) < 2 and time.monotonic() < deadline: time.sleep(.01)
                    self.assertEqual(len(list(root.glob('*.pid'))), 2)
                    pids = [int(p.read_text()) for p in root.glob('*.pid')]
                    proc.send_signal(sig); proc.wait(timeout=5)
                    self.assertNotEqual(proc.returncode, 0)
                    self.assertFalse(evidence.exists())
                    deadline = time.monotonic() + 2
                    for pid in pids:
                        stat = Path(f'/proc/{pid}/stat')
                        while stat.exists() and stat.read_text().split()[2] != 'Z' and time.monotonic() < deadline: time.sleep(.01)
                        self.assertTrue(not stat.exists() or stat.read_text().split()[2] == 'Z')
                finally:
                    if proc.poll() is None: proc.kill(); proc.wait()
                    for p in root.glob('*.pid'):
                        try: os.kill(int(p.read_text()), signal.SIGKILL)
                        except ProcessLookupError: pass

if __name__ == '__main__':
    unittest.main()
