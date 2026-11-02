#!/usr/bin/env python3
"""Reconstruct reported profiles from pinned correction cells; never run archive code.

This checks internal numerical consistency, NOT the seed/max recurrence or graph proofs.
"""
import argparse
from array import array
from fractions import Fraction
import hashlib
import json
from pathlib import Path
import sys
import io
import zipfile

ZIP_HASH = '9396819eb36e25926d7ae8ee78b85c61cb898801f935fccfe72ebcad491bc196'
X = 500000
P = (3, 2, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71)
REPORT_HASH = 'abefb2c518a98cbb80a000fac3441133006db89e58fb1ef4ffacf12b6a2a1c48'
INTERVAL_HASH = 'b9f1b518c895fffc8efe40b6abb9b39cd877ef77ef0c78b5211b5b103b117111'

def pairs(xs):
    d = {}
    for k, v in xs:
        if k in d: raise ValueError('duplicate key')
        d[k] = v
    return d

def read_archive(path):
    raw = path.read_bytes()
    if hashlib.sha256(raw).hexdigest() != ZIP_HASH:
        raise ValueError('wrong archive digest')
    prefix = 'erdos302_boundary_certificates/baseline/'
    result = []
    with zipfile.ZipFile(io.BytesIO(raw)) as z:
        for name, digest in [('VERIFIED_REPORT.json', REPORT_HASH),
                             ('upstream_intervals.json', INTERVAL_HASH)]:
            matches = [i for i in z.infolist() if i.filename == prefix + name]
            if len(matches) != 1 or matches[0].is_dir():
                raise ValueError('missing or duplicate archive member')
            data = z.read(matches[0])
            if hashlib.sha256(data).hexdigest() != digest:
                raise ValueError('wrong member digest: ' + name)
            result.append(json.loads(data, object_pairs_hook=pairs))
    return tuple(result)


def uint(x):
    return type(x) is int and x >= 0

def validate_numbers(value):
    # Reject booleans everywhere, including metadata compared to integers.
    if type(value) is bool or type(value) is float:
        raise ValueError('boolean/float impostor')
    if type(value) is list:
        for item in value: validate_numbers(item)
    elif type(value) is dict:
        for item in value.values(): validate_numbers(item)

def table_bytes(a):
    b = array('I', a)
    if b.itemsize != 4: raise ValueError('need 32-bit unsigned int')
    if sys.byteorder != 'little': b.byteswap()
    return b.tobytes()

def run(base, output=None):
    report, source = read_archive(base)
    for key in ('levels', 'exact_upper', 'finite_error'):
        validate_numbers(report[key])
    for key in ('pivots', 'intervals'):
        validate_numbers(source[key])
    if source['commit'] != '9447ceb28138949b2fb32442cec506a6f53104f9' or source['pivots'] != list(P[::-1]): raise ValueError('source pin')
    levels = report['levels']; oldlevels = source['intervals'][::-1]
    if len(levels) != len(P) or len(oldlevels) != len(P): raise ValueError('level count')
    parent = array('I', [0]) * (X+1); oldparent = array('I', [0]) * (X+1)
    rho = Fraction(1); gain = Fraction(); error = 0; count = 0
    if output: output.mkdir(parents=True, exist_ok=True)
    for j, (p, level, intervals) in enumerate(zip(P, levels, oldlevels), 1):
        if level['prime'] != p or level['rho'] != [rho.numerator, rho.denominator]: raise ValueError('prime/rho')
        diff = array('i', [0]) * (X+2); olddiff = array('i', [0]) * (X+2)
        cells = level['cells']; previous_end = 1; J = Fraction(); heights = 0
        for row in cells:
            if type(row) is not list or len(row) != 3 or not all(uint(v) for v in row): raise ValueError('cell type')
            a,b,h = row
            if not (1 <= a < b <= X+1 and h > 0 and a >= previous_end): raise ValueError('cell interval/overlap')
            previous_end = b; diff[a] += h; diff[b] -= h
            J += h*(Fraction(1,a)-Fraction(1,b)); heights += h
        if level['correction_cells'] != len(cells) or level['height_sum'] != heights or level['J'] != [J.numerator,J.denominator]: raise ValueError('cell metadata')
        for a,b in intervals:
            if not (uint(a) and uint(b) and 1 <= a <= b <= X+1): raise ValueError('old interval')
            olddiff[a] += 1; olddiff[b] -= 1
        new = array('I', [0])*(X+1); old = array('I', [0])*(X+1); d=0; od=0
        for n in range(1,X+1):
            d += diff[n]; od += olddiff[n]
            new[n] = parent[n]+new[n//p]+d
            old[n] = oldparent[n]+old[n//p]+od
            if d < 0 or od < 0 or new[n] < new[n-1] or new[n] < old[n]: raise ValueError(f'profile invariant at {j},{n}')
        h = hashlib.sha256(table_bytes(new)).hexdigest()
        if h != level['table_sha256']: raise ValueError(f'profile hash level {j}')
        if output: (output / f'profile-{j:02}.u32le').write_bytes(table_bytes(new))
        print(f'{j:2} p={p:2} cells={len(cells):4} sha256={h}')
        parent,oldparent=new,old; count+=len(cells);gain+=rho*J;error+=(2**j)*heights;rho*=Fraction(p-1,p)
    result=1-gain
    if report['exact_upper'] != [result.numerator,result.denominator] or report['finite_error'] != error: raise ValueError('global arithmetic')
    print(f'validated cells={count} error={error} exact_upper={result}')
    print('LIMIT: cell-driven recurrence and hashes only; no seed-max recurrence or cover proof checked')

if __name__ == '__main__':
    ap=argparse.ArgumentParser();ap.add_argument('archive',type=Path);ap.add_argument('--output',type=Path)
    args=ap.parse_args();run(args.archive,args.output)
