#!/usr/bin/env python3
"""Data-only comparison of pinned upstream corrections and reported new cells.

Not a certificate checker and not a Lean proof. Reads but does not execute archive
code; the reported cells' mathematical validity is not established here.
"""
import hashlib
import json
from fractions import Fraction
from pathlib import Path
from zipfile import ZipFile

def require(condition, message):
    if not condition:
        raise ValueError(message)

def unique(pairs):
    obj = {}
    for key, value in pairs:
        require(key not in obj, 'duplicate JSON key')
        obj[key] = value
    return obj

def pair(q):
    return [q.numerator, q.denominator]

path = Path(__file__).resolve().parents[1] / 'input/erdos302_boundary_certificates_publication.zip'
blob = path.read_bytes()
if hashlib.sha256(blob).hexdigest() != '9396819eb36e25926d7ae8ee78b85c61cb898801f935fccfe72ebcad491bc196':
    raise ValueError('archive hash mismatch')
from io import BytesIO
with ZipFile(BytesIO(blob)) as z:
    def read(name):
        target = 'erdos302_boundary_certificates/baseline/' + name
        require(z.namelist().count(target) == 1, 'missing or duplicate member')
        return json.loads(z.read(target), object_pairs_hook=unique)
    upstream = read('upstream_intervals.json')
    report = read('VERIFIED_REPORT.json')
    claim = read('claim.json')

primes = list(reversed(upstream['pivots']))
intervals = list(reversed(upstream['intervals']))
require(upstream['commit'] == '9447ceb28138949b2fb32442cec506a6f53104f9', 'upstream commit')
require(primes == [3,2,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71] and all(type(p) is int for p in primes), 'pivots')
require(len(primes) == len(intervals) == len(report['levels']) == 20, 'level count')
N = 10000
oldparent = [0] * (N + 1)
newparent = [0] * (N + 1)
rho = Fraction(1)
gain = Fraction(0)
newgain = Fraction(0)
first = None
for j, (p, oldcells, level) in enumerate(zip(primes, intervals, report['levels']), 1):
    require(type(level['prime']) is int and p == level['prime'] and level['rho'] == pair(rho), 'prime/rho mismatch')
    require(type(oldcells) is list and type(level['cells']) is list, 'cell list')
    olddelta = [0] * (N + 2)
    newdelta = [0] * (N + 2)
    for cell in oldcells:
        require(type(cell) is list and len(cell) == 2 and all(type(x) is int for x in cell), 'old cell shape')
        a, b = cell
        require(1 <= a <= b <= 500001, 'old cell bounds')
        gain += rho * (Fraction(1, a) - Fraction(1, b))
        if a <= N: olddelta[a] += 1
        if b <= N: olddelta[b] -= 1
    integral, height, last = Fraction(0), 0, 1
    for cell in level['cells']:
        require(type(cell) is list and len(cell) == 3 and all(type(x) is int for x in cell), 'new cell shape')
        a, b, h = cell
        require(last <= a < b <= 500001 and h > 0, 'new cell bounds or overlap')
        last = b
        height += h
        integral += h * (Fraction(1,a) - Fraction(1,b))
        if a <= N: newdelta[a] += h
        if b <= N: newdelta[b] -= h
    require(type(level['correction_cells']) is int and level['correction_cells'] == len(level['cells']) and type(level['height_sum']) is int and level['height_sum'] == height and level['J'] == pair(integral), 'level aggregate mismatch')
    newgain += rho * integral
    rho *= Fraction(p - 1, p)
    old = [0] * (N + 1)
    new = [0] * (N + 1)
    io = ine = 0
    for n in range(1, N + 1):
        io += olddelta[n]
        ine += newdelta[n]
        old[n] = oldparent[n] + old[n // p] + io
        new[n] = newparent[n] + new[n // p] + ine
        if first is None and new[n] > old[n]:
            first = (j, p, n, old[n], new[n])
    oldparent, newparent = old, new
old_c = 1 - gain
new_c = 1 - newgain
require(old_c == Fraction(303298432907684665348375061155255053723893276661771828230864577892179469,358435072543067896655954874015956559321978063343228205466655134412800000), 'old aggregate mismatch')
require(report['exact_upper'] == pair(new_c) and claim['exact_upper'] == pair(new_c), 'reported coefficient mismatch')
require(first == (14, 43, 1984, 217, 218), 'first observed increase mismatch')
require(old_c > new_c, 'no coefficient improvement')
print('Old upstream coefficient:', old_c)
print('Reported archive coefficient:', new_c)
print('Old minus reported:', old_c - new_c)
print('First observed strict increase (level, prime, n, old, new):', first)
