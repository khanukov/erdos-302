#!/usr/bin/env python3
"""Pinned archive node 1090 -> Lean candidate. Python translation is not a proof."""
import hashlib
import json
import lzma
import math
from fractions import Fraction
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ARCHIVE = ROOT / 'audit/source/erdos302_boundary_certificates/baseline/bank.json.xz'
OUTPUT = ROOT / 'lean/BankRowPackArchive1090.lean'
SHA256 = '5c1a1fa4edcc1a0bc7ac3fc9cd3bc7fca4eedad6cb689b6540436ca35ed89034'
INDEX = 1090

def nat(x, minimum=0):
    if type(x) is not int or x < minimum:
        raise ValueError('expected natural number')
    return x

def translate(bank):
    if type(bank) is not dict or bank.get('schema') != 'erdos302-standalone-finite-proof-bank-v1':
        raise ValueError('schema')
    nodes, images = bank['nodes'], bank['images']
    node = nodes[INDEX]
    if type(node) is not dict or set(node) != {'t', 'rows'} or node['t'] != 'qpack':
        raise ValueError('expected qpack')
    if type(node['rows']) is not list or not node['rows']:
        raise ValueError('empty rows')
    raw, sources, seen = [], {}, set()
    for row in node['rows']:
        if type(row) is not list or len(row) != 3:
            raise ValueError('row shape')
        j, num, den = nat(row[0]), nat(row[1], 1), nat(row[2], 1)
        if j in seen or j >= len(images):
            raise ValueError('image reference')
        seen.add(j)
        image = images[j]
        if type(image) is not list or len(image) != 3:
            raise ValueError('image shape')
        source, mul, div = nat(image[0]), nat(image[1], 1), nat(image[2], 1)
        if source >= INDEX or math.gcd(mul, div) != 1:
            raise ValueError('image source or scale')
        src = nodes[source]
        if type(src) is not dict or set(src) != {'t', 'v', 'r'} or src['t'] != 'small':
            raise ValueError('unsupported source')
        v, demand = src['v'], nat(src['r'], 1)
        if type(v) is not list or len(v) != 3 or any(type(x) is not int or x <= 0 for x in v) or v != sorted(set(v)) or math.gcd(*v) != 1 or demand != 1 or v[1]*v[2] != v[0]*(v[1]+v[2]):
            raise ValueError('source not normalized edge')
        if any(x*mul % div for x in v):
            raise ValueError('nonintegral image')
        sources[source] = v
        raw.append((j, source, mul, div, Fraction(num, den), [x*mul//div for x in v]))
    weights_den = math.lcm(*(r[4].denominator for r in raw))
    loads = {}
    for _, _, _, _, w, vs in raw:
        for x in vs:
            loads[x] = loads.get(x, Fraction()) + w
    if not loads or max(loads.values()) > 1:
        raise ValueError('capacity')
    g = math.gcd(*loads)
    support = sorted(x//g for x in loads)
    obj = sum((r[4] for r in raw), Fraction())
    demand = -(-obj.numerator // obj.denominator)
    if demand < 1:
        raise ValueError('demand')
    rows = []
    for j, source, mul, div, w, _ in raw:
        # Normalize the union by g, preserving exact rational scale.
        d = div*g
        h = math.gcd(mul, d)
        mul, d = mul//h, d//h
        if any(x*mul % d for x in sources[source]):
            raise ValueError('normalization not integral')
        rows.append((j, source, mul, d, int(w*weights_den)))
    return sources, rows, weights_den, demand, support

def render(data):
    sources, rows, cap, demand, support = data
    fs = lambda v: '{' + ','.join(map(str, v)) + '}'
    out = ['import BankRowPack', '', '/- Generated from pinned archive node 1090; see audit/bank-row-pack/ARCHIVE1090.md. -/', 'open Finset UpperBridge', 'namespace BankRowPackArchive1090', '']
    out += ['def nodes (i : ℕ) : ArchiveDag.Node :=']
    for i, v in sorted(sources.items()):
        out += [f'  if i = {i} then ⟨{fs(v)}, 1, .edge {v[0]} {v[1]} {v[2]}⟩ else']
    out += ['  ⟨{2,3,6}, 1, .edge 2 3 6⟩', '', 'def rows (i : Fin ' + str(len(rows)) + ') : BankRowPack.Row :=']
    for idx, (image, src, mul, div, w) in enumerate(rows[:-1]):
        out += [f'  if i.val = {idx} then ⟨{src},{mul},{div},{w}⟩ else -- archive image {image}']
    image, src, mul, div, w = rows[-1]
    out += [f'  ⟨{src},{mul},{div},{w}⟩ -- archive image {image}', '', f'def support : Finset ℕ := {fs(support)}', '', 'theorem prior (i : ℕ) : ArchiveDag.Check nodes i := by', '  unfold ArchiveDag.Check nodes', '  split_ifs <;> dsimp only <;> decide', '', f'theorem checked : BankRowPack.Check nodes {INDEX} {len(rows)} rows {cap} {demand} support := by', '  decide', '', f'theorem bound : Extended.Bound support {demand} := by', f'  apply BankRowPack.sound nodes {INDEX} {len(rows)} rows {cap} {demand} support', '  · intro i hi; exact prior i', '  · exact checked', '', '#print axioms BankRowPackArchive1090.prior', '#print axioms BankRowPackArchive1090.checked', '#print axioms BankRowPackArchive1090.bound', 'end BankRowPackArchive1090', '']
    return '\n'.join(out)

def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    raw = ARCHIVE.read_bytes()
    if hashlib.sha256(raw).hexdigest() != SHA256:
        raise ValueError('archive digest mismatch')
    text = render(translate(json.loads(lzma.decompress(raw))))
    if args.check:
        if OUTPUT.read_text() != text:
            raise ValueError('generated Lean differs')
    else:
        OUTPUT.write_text(text)
    print('archive 1090 translation verified' if args.check else 'generated archive 1090 translation')

if __name__ == '__main__':
    main()
