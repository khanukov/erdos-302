import re
import subprocess
import unittest
from pathlib import Path


class CapacityLimitTests(unittest.TestCase):
    def test_sequential_gate_uses_logged_32gib_address_space_cap(self):
        script = Path(__file__).with_name('node1209-capacity-gate.sh').read_text()
        match = re.search(r'^ulimit -v (\d+)$', script, re.M)
        self.assertIsNotNone(match)
        cap = int(match.group(1))
        self.assertEqual(cap, 33554432)
        result = subprocess.check_output(['bash', '-c', f'ulimit -v {cap}; ulimit -Sv; ulimit -Hv'], text=True)
        self.assertEqual(result.splitlines(), [str(cap), str(cap)])
        self.assertIn('resource-limits.log', script)


if __name__ == '__main__':
    unittest.main()
