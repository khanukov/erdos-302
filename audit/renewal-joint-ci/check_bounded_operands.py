"""Independently replay the bounded operands; not an archive-to-Lean proof."""
from array import array
from pathlib import Path
import re
import sys

root = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(root / 'independent_bank'))
from seed_reconstruction import load_inputs, verify, extensions, ranks, seeds, renew_level, PRIMES

bank, intervals, rows, report = load_inputs(root / 'input/erdos302_boundary_certificates_publication.zip')
witnesses = verify(bank, intervals)
ext = extensions(rows, witnesses)
assert len(witnesses) == 4106 and len(ext) == 515
rank = ranks(500000)
old = parent = array('I', [0]) * 25
for j in range(2):
    seed = seeds(witnesses + ext, rank, j, 500000)[:25]
    previous_old, previous_parent = old, parent
    old, parent, cells = renew_level(old, parent, seed, PRIMES[j], list(reversed(intervals['intervals']))[j])
    if j == 1:
        assert list(previous_parent) == [0] * 25
        assert list(old) == [0,0,0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2]
        assert list(seed) == [0,0,0,0,0,0,1,0,0,0,0,0,2,0,0,0,0,0,1,0,0,0,0,0,1]
        assert list(parent) == [0,0,0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2]
        assert PRIMES[j] == report['levels'][j]['prime'] == 2
        source = (root / 'tests/ArchiveRenewalJointTests.lean').read_text()
        assert source.count('def parent (_ : ℕ) : ℕ := 0') == 1
        assert report['levels'][j]['cells'][0] == [6, 24, 1]
        assert all(sum(h for a, b, h in report['levels'][j]['cells'] if a <= n < b) == 1 for n in range(6, 24))
        assert sum(h for a, b, h in report['levels'][j]['cells'] if a <= 24 < b) == 0
        for name, expected in [('old', old), ('seed', seed), ('table', parent)]:
            matches = re.findall(r'def ' + name + r' \(n : ℕ\) : ℕ := \(\[([0-9,]+)\] : List ℕ\)', source)
            assert len(matches) == 1 and [int(x) for x in matches[0].split(',')] == list(expected), name
        for n in range(1, 25):
            correction = sum(h for a, b, h in report['levels'][j]['cells'] if a <= n < b)
            assert correction == parent[n] - previous_parent[n] - parent[n // 2]
print('PASS: pinned archive operands and corrections through 24; no Lean provenance proof')
