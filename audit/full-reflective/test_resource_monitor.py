import importlib.util
from pathlib import Path
import subprocess
import sys
import unittest

SCRIPT = Path(__file__).resolve().parents[2] / '.github/kitamura/resource_monitor.py'
spec = importlib.util.spec_from_file_location('resource_monitor', SCRIPT)
monitor = importlib.util.module_from_spec(spec)
spec.loader.exec_module(monitor)


class ResourceMonitorTests(unittest.TestCase):
    def test_sample_is_serializable(self):
        import json
        value = monitor.sample()
        json.dumps(value)
        self.assertIn('processes', value)
        self.assertIn('cgroup', value)

    def test_observes_named_process_and_limits(self):
        code = "import ctypes,time; ctypes.CDLL(None).prctl(15,b'lean',0,0,0); time.sleep(10)"
        process = subprocess.Popen([sys.executable, '-c', code])
        try:
            import time
            for _ in range(100):
                matches = [p for p in monitor.sample()['processes'] if p['pid'] == process.pid]
                if matches:
                    break
                time.sleep(.01)
            self.assertTrue(matches)
            self.assertIn('Threads', matches[0])
            self.assertIn('Max address space', matches[0]['limits'])
        finally:
            process.terminate()
            process.wait(timeout=5)

    def test_monitor_emits_sample(self):
        process = subprocess.Popen([sys.executable, str(SCRIPT)], stdout=subprocess.PIPE, text=True)
        try:
            import json
            self.assertIn('time', json.loads(process.stdout.readline()))
        finally:
            process.terminate()
            process.communicate(timeout=5)


if __name__ == '__main__':
    unittest.main()
