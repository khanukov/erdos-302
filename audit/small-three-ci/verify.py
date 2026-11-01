#!/usr/bin/env python3
"""Kernel-check all three-vertex small nodes derived directly from the archive."""
import argparse
import hashlib
import itertools
import json
import lzma
import os
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
ARCHIVE = ROOT / 'audit/source/erdos302_boundary_certificates/baseline/bank.json.xz'
CHECKER = ROOT / 'audit/upper-small-std/Checker.lean'
ARCHIVE_SHA = '5c1a1fa4edcc1a0bc7ac3fc9cd3bc7fca4eedad6cb689b6540436ca35ed89034'
CHECKER_SHA = '0f7e49f1e1f8ba8d5b1ac1c38eb1d631fcf849ac0af187c93b789b1048ef5a0a'
SHARDS = 32
CHUNK = 20

def require(value, message):
    if not value:
        raise ValueError(message)

def pinned(path, digest):
    raw = path.read_bytes()
    require(hashlib.sha256(raw).hexdigest() == digest, f'hash mismatch: {path}')
    return raw

def inventory():
    obj = json.loads(lzma.decompress(pinned(ARCHIVE, ARCHIVE_SHA)))
    nodes = obj['nodes']
    require(obj['schema'] == 'erdos302-standalone-finite-proof-bank-v1' and len(nodes) == 4106, 'archive schema/count')
    small = []
    for i, n in enumerate(nodes):
        if n.get('t') != 'small':
            continue
        v, r = n['v'], n['r']
        require(set(n) == {'t', 'v', 'r'} and type(v) is list and v and
                all(type(x) is int and x > 0 for x in v) and v == sorted(set(v)) and
                type(r) is int and r >= 0, f'invalid node {i}')
        small.append((i, n))
    require(len(small) == 3528, 'small-node count')
    selected = [(i, n) for i, n in small if len(n['v']) == 3]
    require(len(selected) == 2786, 'three-vertex count')
    return pinned(CHECKER, CHECKER_SHA), selected

def source_for(batch):
    lines = ['import Checker\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\nnamespace Archive\nopen SmallStd\n']
    for i, n in batch:
        v = n['v']
        edges = [(a,b,c) for a,b,c in itertools.combinations(range(len(v)), 3)
                 if v[b]*v[c] == v[a]*(v[b]+v[c])]
        require(bool(edges), f'node {i}: no arithmetic edge')
        lines.append(f"theorem bank_node_{i} : Checked {v} {edges} {n['r']} := by decide\n#print axioms bank_node_{i}\n")
    return ''.join(lines) + 'end Archive\n'

def check_axioms(output, names):
    lines = output.splitlines()
    for name in names:
        allowed = {f"'{name}' does not depend on any axioms", f"'{name}' depends on axioms: [propext]"}
        matches = [line for line in lines if line.startswith(f"'{name}' ")]
        require(len(matches) == 1 and matches[0] in allowed, f'bad axiom report for {name}: {matches}')
    require(not any('error:' in x or 'sorryAx' in x or 'ofReduceBool' in x for x in lines), 'forbidden output')

def run_lean(args, cwd, env, names):
    p = subprocess.run(['lean', *args], cwd=cwd, env=env, text=True,
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=1800)
    print(p.stdout, end='', flush=True)
    require(p.returncode == 0, f'Lean failed: {args}')
    check_axioms(p.stdout, names)

def main():
    ap = argparse.ArgumentParser()
    group = ap.add_mutually_exclusive_group(required=True)
    group.add_argument('--check-only', action='store_true')
    group.add_argument('--shard', type=int)
    args = ap.parse_args()
    checker, selected = inventory()
    shards = [[item for item in selected if item[0] % SHARDS == k] for k in range(SHARDS)]
    require(sum(map(len, shards)) == len(selected) and all(shards), 'sharding mismatch')
    for shard in shards:
        for j in range(0, len(shard), CHUNK):
            source_for(shard[j:j+CHUNK])
    print(f'archive-derived: {len(selected)} three-vertex nodes; shard counts: {[len(s) for s in shards]}', flush=True)
    if args.check_only:
        return
    require(0 <= args.shard < SHARDS, 'invalid shard')
    version = subprocess.run(['lean', '--version'], capture_output=True, text=True, check=True).stdout
    require('version 4.27.0' in version, f'wrong Lean: {version}')
    with tempfile.TemporaryDirectory(prefix='small-three-ci-') as tmp:
        d = Path(tmp)
        (d/'Checker.lean').write_bytes(checker)
        env = dict(os.environ, LEAN_PATH=str(d))
        run_lean(['-o', 'Checker.olean', 'Checker.lean'], d, env, ['SmallStd.sound', 'SmallStd.edges_sound'])
        shard = shards[args.shard]
        for j in range(0, len(shard), CHUNK):
            batch = shard[j:j+CHUNK]
            (d/'Certificate.lean').write_text(source_for(batch))
            print(f'shard {args.shard}, chunk {j//CHUNK}: indices {[i for i, _ in batch]}', flush=True)
            run_lean(['Certificate.lean'], d, env, [f'Archive.bank_node_{i}' for i, _ in batch])
    print(f'PASS shard {args.shard}: {len(shard)} nodes', flush=True)

if __name__ == '__main__':
    try:
        main()
    except (ValueError, OSError, subprocess.SubprocessError, KeyError, TypeError) as exc:
        print(f'FAIL: {exc}', file=sys.stderr)
        sys.exit(1)
