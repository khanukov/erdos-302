#!/usr/bin/env python3
"""Extract and arithmetically check the published ledger, not its provenance proof."""
import argparse
import hashlib
import json
from fractions import Fraction
from io import BytesIO
from pathlib import Path
from zipfile import ZipFile

ZIP_SHA = '9396819eb36e25926d7ae8ee78b85c61cb898801f935fccfe72ebcad491bc196'
PREFIX = 'erdos302_boundary_certificates/baseline/'
PRIMES = (3,2,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71)

def require(p, message):
    if not p:
        raise ValueError(message)

def pair(q):
    return [q.numerator, q.denominator]

def unique_object(pairs):
    obj = {}
    for key, value in pairs:
        require(key not in obj, f"duplicate JSON key: {key}")
        obj[key] = value
    return obj

def export(path):
    raw = Path(path).read_bytes()
    require(hashlib.sha256(raw).hexdigest() == ZIP_SHA, 'archive hash mismatch')
    with ZipFile(BytesIO(raw)) as z:
        report = json.loads(z.read(PREFIX + 'VERIFIED_REPORT.json'), object_pairs_hook=unique_object)
        claim = json.loads(z.read(PREFIX + 'claim.json'), object_pairs_hook=unique_object)
    levels = report['levels']
    require(len(levels) == len(PRIMES), 'level count')
    rho, gain, error, count = Fraction(1), Fraction(0), 0, 0
    out = []
    for i, (p, level) in enumerate(zip(PRIMES, levels)):
        require(level['prime'] == p and level['rho'] == pair(rho), 'prime/rho mismatch')
        cells, last, height, j = level['cells'], 1, 0, Fraction(0)
        for cell in cells:
            require(type(cell) is list and len(cell) == 3 and all(type(x) is int for x in cell), 'cell shape')
            a,b,h = cell
            require(last <= a < b <= 500001 and h > 0, 'cell bounds or overlap')
            last = b
            height += h
            j += h * (Fraction(1,a) - Fraction(1,b))
        require(level['correction_cells'] == len(cells) and level['height_sum'] == height and level['J'] == pair(j), 'level aggregate mismatch')
        count += len(cells)
        gain += rho*j
        error += (2**(i+1))*height
        out.append({'prime':p, 'cells':cells})
        rho *= Fraction(p-1,p)
    require(count == 4705, 'cell count')
    require(pair(1-gain) == report['exact_upper'] == claim['exact_upper'], 'coefficient mismatch')
    require(error == report['finite_error'] == claim['finite_error'], 'error mismatch')
    return {'schema':'erdos302-archive-cells-v1', 'archive_sha256':ZIP_SHA, 'cutoff':500000,
            'levels':out, 'exact_upper':pair(1-gain), 'finite_error':error}

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('archive', type=Path)
    parser.add_argument('output', type=Path)
    args = parser.parse_args()
    args.output.write_text(json.dumps(export(args.archive), sort_keys=True, separators=(',', ':'))+'\n', encoding='utf-8')

if __name__ == '__main__':
    main()
