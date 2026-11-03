import importlib.util
import os
from pathlib import Path
import sys
import tempfile
import time
import unittest

SCRIPT = Path(__file__).with_name('node1209_parallel.py')


def load():
    spec = importlib.util.spec_from_file_location('node1209_parallel', SCRIPT)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


class ParallelTests(unittest.TestCase):
    def test_success_and_compiler_failure_are_fail_closed(self):
        m = load()
        with tempfile.TemporaryDirectory() as d:
            p = Path(d)
            fake = p / 'fake.py'
            fake.write_text('import pathlib,sys\np=pathlib.Path(sys.argv[1]); p.write_text("ok")\nsys.exit(int(sys.argv[2]))\n')
            good = m.Job('good', [sys.executable, str(fake), str(p/'good'), '0'], [])
            bad = m.Job('bad', [sys.executable, str(fake), str(p/'bad'), '3'], [])
            m.run_jobs([good], p, 2, 5, 1024)
            with self.assertRaises(RuntimeError):
                m.run_jobs([bad], p, 2, 5, 1024)

    def test_timeout_kills_process_group(self):
        m = load()
        with tempfile.TemporaryDirectory() as d:
            p = Path(d)
            fake = p/'fake.py'
            fake.write_text('import os,subprocess,sys,time\nsubprocess.Popen([sys.executable,"-c","import time; time.sleep(.8); open(%r, \'w\').write(\'escaped\')" ]); time.sleep(20)\n' % str(p/'escaped'))
            job = m.Job('stuck', [sys.executable, str(fake)], [])
            with self.assertRaises(RuntimeError):
                m.run_jobs([job], p, 1, .2, 1024)
            time.sleep(1)
            self.assertFalse((p/'escaped').exists())

    def test_address_space_limit_reaches_compiler(self):
        m = load()
        with tempfile.TemporaryDirectory() as d:
            p = Path(d)
            out = p/'limit'
            cmd = [sys.executable, '-c', 'import resource,sys; open(sys.argv[1],"w").write(str(resource.getrlimit(resource.RLIMIT_AS)[0]))', str(out)]
            m.run_jobs([m.Job('limit', cmd, [], out)], p, 1, 5, 256)
            self.assertEqual(int(out.read_text()), 256 * 1024 * 1024)

    def test_large_virtual_address_limit_reaches_compiler(self):
        m = load()
        with tempfile.TemporaryDirectory() as d:
            p = Path(d)
            out = p/'limit'
            cmd = [sys.executable, '-c', 'import resource,sys; open(sys.argv[1],"w").write(str(resource.getrlimit(resource.RLIMIT_AS)[0]))', str(out)]
            m.run_jobs([m.Job('limit', cmd, [], out)], p, 1, 5, 32768)
            self.assertEqual(int(out.read_text()), 32768 * 1024 * 1024)

    def test_missing_output_and_missing_axiom_report_are_rejected(self):
        m = load()
        with tempfile.TemporaryDirectory() as d:
            p = Path(d)
            cmd = [sys.executable, '-c', 'print("no reports")']
            with self.assertRaises(RuntimeError):
                m.run_jobs([m.Job('missing-output', cmd, [], p/'not-created')], p, 1, 5, 1024)
            with self.assertRaises(RuntimeError):
                m.run_jobs([m.Job('missing-report', cmd, ['Example.check'])], p, 1, 5, 1024)

    def test_fake_compiler_mutating_source_is_rejected(self):
        m = load()
        with tempfile.TemporaryDirectory() as d:
            p = Path(d)
            source = p / 'A.lean'
            source.write_text('original')
            expected = m.source_snapshot(p)
            def guard():
                if m.source_snapshot(p) != expected:
                    raise RuntimeError('source changed')
            code = "from pathlib import Path; import sys; Path(sys.argv[1]).write_text('changed'); Path(sys.argv[2]).write_text('object'); print(\"'A.check' does not depend on any axioms\")"
            job = m.Job('fake', [sys.executable, '-c', code, str(source), str(p/'A.olean')], ['A.check'], p/'A.olean')
            with self.assertRaisesRegex(RuntimeError, 'source changed'):
                m.run_jobs([job], p/'logs', 1, 5, 1024, source_guard=guard)

    def test_gate_mutation_is_rejected(self):
        m = load()
        with tempfile.TemporaryDirectory() as d:
            p = Path(d)
            fake = p/'fake.py'
            fake.write_text('print("\'Example.check\' depends on axioms: [sorryAx]")\n')
            with self.assertRaises(RuntimeError):
                m.run_jobs([m.Job('bad', [sys.executable, str(fake)], ['Example.check'])], p, 1, 5, 1024)

if __name__ == '__main__':
    unittest.main()
