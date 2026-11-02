import importlib.util
import os
import signal
import subprocess
import sys
from pathlib import Path
import tempfile
import time
import unittest

spec = importlib.util.spec_from_file_location('build_chain', Path(__file__).with_name('build_chain.py'))
build = importlib.util.module_from_spec(spec)
spec.loader.exec_module(build)


class SchedulerTests(unittest.TestCase):
    def test_sigterm_cleans_child_and_descendant(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / 'A.lean').write_text('-- body\n')
            fake = root / 'lean'
            fake.write_text('''#!/usr/bin/env python3
import os, signal, subprocess, sys, time
from pathlib import Path
child = subprocess.Popen([sys.executable, '-c', 'import time; time.sleep(60)'])
def stop(sig, frame):
    child.wait()
    sys.exit(128 + sig)
signal.signal(signal.SIGTERM, stop)
Path(os.environ['PIDS']).write_text(f'{os.getpid()} {child.pid}')
time.sleep(60)
''')
            fake.chmod(0o755)
            (root / 'out').mkdir(); (root / 'logs').mkdir()
            env = dict(os.environ, PATH=str(root) + os.pathsep + os.environ['PATH'], PIDS=str(root / 'pids'))
            runner = ('import importlib.util, pathlib, sys; '
                      's=importlib.util.spec_from_file_location("build", sys.argv[1]); '
                      'b=importlib.util.module_from_spec(s); s.loader.exec_module(b); '
                      'b.ROOT=pathlib.Path(sys.argv[2]); '
                      'b.build_modules(["A"], b.ROOT/"out", b.ROOT/"logs", __import__("os").environ, 1)')
            proc = subprocess.Popen([sys.executable, '-c', runner, str(Path(build.__file__).resolve()), str(root)],
                                    env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            pids = []
            try:
                deadline = time.monotonic() + 5
                while not (root / 'pids').exists() and time.monotonic() < deadline:
                    time.sleep(0.01)
                pids = [int(p) for p in (root / 'pids').read_text().split()]
                self.assertEqual(len(pids), 2)
                proc.send_signal(signal.SIGTERM)
                proc.wait(timeout=5)
                deadline = time.monotonic() + 2
                while time.monotonic() < deadline and any(Path(f'/proc/{p}').exists() for p in pids):
                    time.sleep(0.01)
                self.assertTrue(all(not Path(f'/proc/{p}').exists() for p in pids), f'surviving processes: {pids}')
                self.assertNotEqual(proc.returncode, 0)
            finally:
                if proc.poll() is None:
                    proc.kill(); proc.wait()
                for pid in pids:
                    try:
                        os.kill(pid, signal.SIGKILL)
                    except ProcessLookupError:
                        pass

    def test_failure_kills_running_and_does_not_start_dependents(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            for name, header in {'A': '', 'B': '', 'C': 'import A\n'}.items():
                (root / (name + '.lean')).write_text(header + '-- body\n')
            fake = root / 'lean'
            fake.write_text('#!/usr/bin/env python3\nimport os,sys,time\nfrom pathlib import Path\n'
                'name=Path(sys.argv[-1]).stem\n'
                'p=Path(os.environ["EVENTS"])\n'
                'with p.open("a") as f: f.write("start "+name+"\\n")\n'
                'time.sleep(0.2 if name == "A" else 3)\n'
                'sys.exit(1 if name == "A" else 0)\n')
            fake.chmod(0o755)
            out = root / 'out'; out.mkdir()
            logs = root / 'logs'; logs.mkdir()
            env = dict(os.environ, PATH=str(root) + os.pathsep + os.environ['PATH'], EVENTS=str(root / 'events'))
            old = build.ROOT; build.ROOT = root
            start = time.monotonic()
            try:
                with self.assertRaisesRegex(RuntimeError, 'failed build: A'):
                    build.build_modules(['A', 'B', 'C'], out, logs, env, workers=2)
            finally:
                build.ROOT = old
            elapsed = time.monotonic() - start
            print(f'mock cancellation elapsed={elapsed:.2f}s', flush=True)
            self.assertLess(elapsed, 2)
            self.assertEqual(set((root / 'events').read_text().splitlines()), {'start A', 'start B'})

    def test_parallel_dependency_barrier(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            for name, header in {'A': '', 'B': '', 'C': 'import A B\n'}.items():
                (root / (name + '.lean')).write_text(header + '-- body\n')
            fake = root / 'lean'
            fake.write_text('#!/usr/bin/env python3\nimport os,sys,time\nfrom pathlib import Path\n'
                'name=Path(sys.argv[-1]).stem\n'
                'assert sys.argv[1:3] == ["-j", "1"]\n'
                'p=Path(os.environ["EVENTS"])\n'
                'with p.open("a") as f: f.write("start "+name+"\\n")\n'
                'time.sleep(0.25)\n'
                'Path(sys.argv[4]).write_text("ok")\n'
                'with p.open("a") as f: f.write("end "+name+"\\n")\n')
            fake.chmod(0o755)
            out = root / 'out'; out.mkdir()
            logs = root / 'logs'; logs.mkdir()
            env = dict(os.environ, PATH=str(root) + os.pathsep + os.environ['PATH'], EVENTS=str(root / 'events'))
            old = build.ROOT; build.ROOT = root
            try:
                build.build_modules(['A', 'B', 'C'], out, logs, env, workers=2)
            finally:
                build.ROOT = old
            events = (root / 'events').read_text().splitlines()
            self.assertEqual(set(events[:2]), {'start A', 'start B'})
            self.assertGreater(events.index('start C'), events.index('end A'))
            self.assertGreater(events.index('start C'), events.index('end B'))
            self.assertEqual(len(list(logs.glob('*.log'))), 3)


if __name__ == '__main__':
    unittest.main()
