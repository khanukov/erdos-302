import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from zipfile import ZipFile

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / 'audit/profile-only-gap.py'
ARCHIVE = ROOT / 'input/erdos302_boundary_certificates_publication.zip'
PREFIX = 'erdos302_boundary_certificates/baseline/'
PIN = '9396819eb36e25926d7ae8ee78b85c61cb898801f935fccfe72ebcad491bc196'

class Mutations(unittest.TestCase):
    def test_independent_direct_interval_oracle(self):
        with ZipFile(ARCHIVE) as z:
            u = json.loads(z.read(PREFIX + 'upstream_intervals.json'))
            r = json.loads(z.read(PREFIX + 'VERIFIED_REPORT.json'))
        oldparent = [0] * 1985
        newparent = [0] * 1985
        first = None
        for j, (p, rows, level) in enumerate(zip(reversed(u['pivots']), reversed(u['intervals']), r['levels']), 1):
            old, new = [0] * 1985, [0] * 1985
            for n in range(1, 1985):
                old[n] = oldparent[n] + old[n // p] + sum(a <= n < b for a, b in rows)
                new[n] = newparent[n] + new[n // p] + sum(h for a, b, h in level['cells'] if a <= n < b)
                if first is None and new[n] > old[n]:
                    first = (j, p, n, old[n], new[n])
            oldparent, newparent = old, new
        self.assertEqual(first, (14, 43, 1984, 217, 218))

    def run_mutation(self, mutate):
        with ZipFile(ARCHIVE) as z:
            upstream = json.loads(z.read(PREFIX + 'upstream_intervals.json'))
            report = json.loads(z.read(PREFIX + 'VERIFIED_REPORT.json'))
            claim = z.read(PREFIX + 'claim.json')
        mutate(upstream, report)
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            (root / 'input').mkdir()
            (root / 'audit').mkdir()
            archive = root / 'input/erdos302_boundary_certificates_publication.zip'
            with ZipFile(archive, 'w') as z:
                z.writestr(PREFIX + 'upstream_intervals.json', json.dumps(upstream))
                z.writestr(PREFIX + 'VERIFIED_REPORT.json', json.dumps(report))
                z.writestr(PREFIX + 'claim.json', claim)
            script = root / 'audit/profile-only-gap.py'
            script.write_text(SCRIPT.read_text().replace(PIN, hashlib.sha256(archive.read_bytes()).hexdigest()))
            return subprocess.run([sys.executable, '-I', '-S', '-B', '-O', str(script)], capture_output=True, text=True)

    def test_wrong_prime_rejected_under_optimization(self):
        def mutate(u, r):
            r['levels'][0]['prime'] = 5
        result = self.run_mutation(mutate)
        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertIn('prime/rho mismatch', result.stderr)

    def test_truncated_levels_rejected(self):
        result = self.run_mutation(lambda u, r: r['levels'].pop())
        self.assertIn('level count', result.stderr)
        self.assertNotEqual(result.returncode, 0)

    def test_changed_cell_rejected(self):
        def mutate(u, r):
            r['levels'][1]['cells'][0][2] += 1
        result = self.run_mutation(mutate)
        self.assertIn('level aggregate mismatch', result.stderr)
        self.assertNotEqual(result.returncode, 0)

    def test_changed_coefficient_rejected(self):
        def mutate(u, r):
            r['exact_upper'][0] += 1
        result = self.run_mutation(mutate)
        self.assertIn('reported coefficient mismatch', result.stderr)
        self.assertNotEqual(result.returncode, 0)

    def test_boolean_cell_rejected(self):
        def mutate(u, r):
            r['levels'][1]['cells'][0][2] = True
        result = self.run_mutation(mutate)
        self.assertIn('new cell shape', result.stderr)
        self.assertNotEqual(result.returncode, 0)

if __name__ == '__main__':
    unittest.main()
