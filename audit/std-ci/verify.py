#!/usr/bin/env python3
"""Re-derive the selected certificate sources and compile one deterministic shard."""
import argparse
import hashlib
import itertools
import json
import lzma
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
AUDIT = ROOT / 'audit'
SOURCE = AUDIT / 'source/erdos302_boundary_certificates/baseline/bank.json.xz'
SOURCE_SHA = '5c1a1fa4edcc1a0bc7ac3fc9cd3bc7fca4eedad6cb689b6540436ca35ed89034'
CHECKER_SHA = '0f7e49f1e1f8ba8d5b1ac1c38eb1d631fcf849ac0af187c93b789b1048ef5a0a'
PRIOR_SHA = 'b418967d8562ec67b503b6d51b1fe3c5e1bd7f67749c0ba8dedae452752b70da'
SHARDS = 32
HEADER = 'import Checker\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\nnamespace Archive\nopen SmallStd\n'


def require(condition, message):
    if not condition:
        raise ValueError(message)


def chunk_success(chunk):
    require(type(chunk['success']) is bool, 'chunk success must be boolean')
    return chunk['success']


def pinned(path, digest):
    data = path.read_bytes()
    require(hashlib.sha256(data).hexdigest() == digest, f'hash mismatch: {path}')
    return data


def source_for(indices, nodes):
    parts = [HEADER]
    for i in indices:
        n = nodes[i]
        v = n['v']
        edges = [(a, b, c) for a, b, c in itertools.combinations(range(len(v)), 3)
                 if v[b]*v[c] == v[a]*(v[b]+v[c])]
        require(bool(edges), f'node {i} has no edges')
        parts.append(f"theorem bank_node_{i} : Checked {v} {edges} {n['r']} := by decide\n#print axioms bank_node_{i}\n")
    return ''.join(parts) + 'end Archive\n'


def inventory():
    nodes_obj = json.loads(lzma.decompress(pinned(SOURCE, SOURCE_SHA)))
    nodes = nodes_obj['nodes']
    require(nodes_obj['schema'] == 'erdos302-standalone-finite-proof-bank-v1' and len(nodes) == 4106, 'archive schema/count')
    small = set()
    for i, n in enumerate(nodes):
        if n.get('t') != 'small':
            continue
        v, r = n['v'], n['r']
        require(set(n) == {'t','v','r'} and isinstance(v, list) and bool(v) and
                all(type(x) is int and x > 0 for x in v) and v == sorted(set(v)) and
                type(r) is int and r >= 0, f'invalid node {i}')
        small.add(i)
    require(len(small) == 3528, 'small count')
    prior_data = json.loads(pinned(AUDIT/'upper-small-bank/coverage.json', PRIOR_SHA))['compiled_indices']
    require(len(prior_data) == len(set(prior_data)) == 1900 and 4022 not in prior_data, 'prior inventory')
    prior = set(prior_data) | {4022}
    require(prior <= small, 'prior indices not small')
    target = small - prior
    require(len(target) == 1627, 'target count')
    checker = pinned(AUDIT/'upper-small-std/Checker.lean', CHECKER_SHA)
    require(pinned(AUDIT/'upper-small-std-final/Checker.lean', CHECKER_SHA) == checker, 'checker mismatch')
    chunks = []
    seen = set()
    for folder in ('upper-small-std', 'upper-small-std-final'):
        base = AUDIT / folder
        manifest = json.loads((base/'coverage.json').read_text())
        for ch in manifest['chunks']:
            if not chunk_success(ch):
                continue
            name, ids = ch['chunk'], ch['indices']
            require(re.fullmatch(r'Chunk[0-9]{4}', name) is not None, 'invalid chunk name')
            require(ids and all(type(i) is int for i in ids) and len(ids) == len(set(ids)), 'invalid indices')
            require(set(ids) <= target and not seen.intersection(ids), 'duplicate or unexpected node')
            expected = source_for(ids, nodes)
            path = base/'generated'/f'{name}.lean'
            require(path.read_text() == expected, f'archive/source mismatch: {path}')
            seen.update(ids)
            chunks.append((folder, name, ids, expected))
    require(seen == target, f'coverage mismatch: missing {len(target-seen)}, extra {len(seen-target)}')
    return checker, chunks


def check_axioms(output, names):
    lines = output.splitlines()
    for name in names:
        allowed = {f"'{name}' does not depend on any axioms", f"'{name}' depends on axioms: [propext]"}
        matches = [x for x in lines if x.startswith(f"'{name}' ")]
        require(len(matches) == 1 and matches[0] in allowed, f'axiom report missing or forbidden for {name}: {matches}')
    require(not any('error:' in x or 'sorryAx' in x or 'ofReduceBool' in x for x in lines), 'Lean output has errors or forbidden axioms')


def run_lean(args, cwd, env, names):
    p = subprocess.run(['lean', '+leanprover/lean4:v4.27.0', *args], cwd=cwd, env=env,
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=1800)
    print(p.stdout, end='', flush=True)
    require(p.returncode == 0, f'Lean failed: {args}')
    check_axioms(p.stdout, names)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--check-only', action='store_true')
    parser.add_argument('--shard', type=int)
    args = parser.parse_args()
    checker, chunks = inventory()
    print(f'Validated archive/source bijection: {sum(len(x[2]) for x in chunks)} nodes in {len(chunks)} chunks', flush=True)
    if args.check_only:
        return
    require(args.shard is not None and 0 <= args.shard < SHARDS, 'invalid shard')
    with tempfile.TemporaryDirectory(prefix='std-ci-') as tmp:
        d = Path(tmp)
        (d/'Checker.lean').write_bytes(checker)
        env = dict(os.environ, LEAN_PATH=str(d))
        run_lean(['-o', 'Checker.olean', 'Checker.lean'], d, env, ['SmallStd.sound','SmallStd.edges_sound'])
        selected = [(folder, name, ids, text) for j, (folder, name, ids, text) in enumerate(chunks) if j % SHARDS == args.shard]
        require(bool(selected), 'empty shard')
        for folder, name, ids, text in selected:
            path = d / 'Certificate.lean'
            path.write_text(text)
            print(f'shard {args.shard}: {folder}/{name} ({len(ids)} nodes)', flush=True)
            run_lean([str(path)], d, env, [f'Archive.bank_node_{i}' for i in ids])
        print(f'PASS shard {args.shard}: {sum(len(x[2]) for x in selected)} nodes', flush=True)


if __name__ == '__main__':
    try:
        main()
    except (ValueError, OSError, subprocess.TimeoutExpired, KeyError, TypeError) as e:
        print(f'FAIL: {e}', file=sys.stderr)
        sys.exit(1)
