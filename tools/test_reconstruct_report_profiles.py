import hashlib
import io
import json
import tempfile
import copy
import contextlib
from fractions import Fraction
from array import array
import unittest
import zipfile
from pathlib import Path
from unittest.mock import patch

import reconstruct_report_profiles as r


class ExtractionTests(unittest.TestCase):
    def archive(self, entries):
        out = io.BytesIO()
        with zipfile.ZipFile(out, 'w') as z:
            for name, data in entries:
                z.writestr(name, data)
        return out.getvalue()

    def test_reads_only_pinned_members(self):
        root = 'erdos302_boundary_certificates/baseline/'
        data = self.archive([(root+'VERIFIED_REPORT.json', b'{}'),
                             (root+'upstream_intervals.json', b'{}'),
                             ('evil.py', b'raise Exception()')])
        with tempfile.TemporaryDirectory() as d:
            path = Path(d)/'input.zip'; path.write_bytes(data)
            with patch.object(r, 'ZIP_HASH', hashlib.sha256(data).hexdigest()), \
                 patch.object(r, 'REPORT_HASH', hashlib.sha256(b'{}').hexdigest()), \
                 patch.object(r, 'INTERVAL_HASH', hashlib.sha256(b'{}').hexdigest()):
                self.assertEqual(r.read_archive(path), ({}, {}))
                path.write_bytes(data+b'x')
                with self.assertRaisesRegex(ValueError, 'digest'): r.read_archive(path)

    def test_duplicate_members_and_duplicate_json_keys_rejected(self):
        root = 'erdos302_boundary_certificates/baseline/'
        for entries in [ [(root+'VERIFIED_REPORT.json', b'{}')]*2 + [(root+'upstream_intervals.json', b'{}')],
                         [(root+'VERIFIED_REPORT.json', b'{"x":1,"x":2}'), (root+'upstream_intervals.json', b'{}')]]:
            data = self.archive(entries)
            with tempfile.TemporaryDirectory() as d:
                path=Path(d)/'input.zip'; path.write_bytes(data)
                with patch.object(r, 'ZIP_HASH', hashlib.sha256(data).hexdigest()), \
                     patch.object(r, 'REPORT_HASH', hashlib.sha256(entries[0][1]).hexdigest()), \
                     patch.object(r, 'INTERVAL_HASH', hashlib.sha256(b'{}').hexdigest()):
                    with self.assertRaises(ValueError): r.read_archive(path)


class ReconstructionTests(unittest.TestCase):
    def fixture(self):
        # Independent direct definition, without difference arrays.
        p = (3, 2); cutoff = 12
        cells = [[[2, 13, 1]], [[4, 13, 2]]]
        levels = []; parent = [0] * (cutoff + 1); rho = Fraction(1); gain = Fraction(); error = 0
        for j, (prime, rows) in enumerate(zip(p, cells), 1):
            current = [0] * (cutoff + 1)
            for n in range(1, cutoff + 1):
                current[n] = parent[n] + current[n // prime] + sum(h for a,b,h in rows if a <= n < b)
            data = b''.join(n.to_bytes(4, 'little') for n in current)
            J = sum((h * (Fraction(1,a)-Fraction(1,b)) for a,b,h in rows), Fraction())
            levels.append(dict(prime=prime, rho=[rho.numerator,rho.denominator], cells=rows,
                correction_cells=len(rows), height_sum=sum(row[2] for row in rows),
                J=[J.numerator,J.denominator], table_sha256=hashlib.sha256(data).hexdigest()))
            gain += rho*J; error += 2**j * sum(row[2] for row in rows)
            rho *= Fraction(prime-1,prime); parent = current
        upper = 1-gain
        report = dict(levels=levels, exact_upper=[upper.numerator,upper.denominator],finite_error=error)
        source = dict(commit='9447ceb28138949b2fb32442cec506a6f53104f9', pivots=list(p[::-1]), intervals=[[],[]])
        return report, source, parent

    def execute(self, report, source, output=None):
        with patch.object(r, 'P', (3,2)), patch.object(r, 'X', 12), \
             patch.object(r, 'read_archive', return_value=(report, source)), \
             contextlib.redirect_stdout(io.StringIO()):
            r.run(Path('ignored'), output)

    def test_independent_small_recurrence_and_binary_output(self):
        report, source, expected = self.fixture()
        with tempfile.TemporaryDirectory() as d:
            self.execute(report, source, Path(d))
            self.assertEqual((Path(d)/'profile-02.u32le').read_bytes(), b''.join(n.to_bytes(4,'little') for n in expected))

    def test_adversarial_mutations_rejected(self):
        report, source, _ = self.fixture()
        def missing(x): x['levels'][0]['cells'].clear()
        def height(x): x['levels'][0]['cells'][0][2] += 1
        def impostor(x): x['levels'][0]['cells'][0][2] = True
        def meta_impostor(x): x['levels'][0]['height_sum'] = True
        def digest(x): x['levels'][0]['table_sha256'] = '0'*64
        for mutate in (missing,height,impostor,meta_impostor,digest):
            with self.subTest(mutate=mutate.__name__):
                obj=copy.deepcopy(report); mutate(obj)
                with self.assertRaises((ValueError, KeyError)): self.execute(obj,source)


if __name__ == '__main__': unittest.main()
