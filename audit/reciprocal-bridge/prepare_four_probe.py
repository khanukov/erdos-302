#!/usr/bin/env python3
"""Create an isolated four-b probe from byte-pinned candidate declarations.

This projection deliberately does not build/import the upstream chain; it is
not a proof of the original module or of its 44-shard assembly.
"""
import hashlib
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[2]
BASE = ROOT / 'audit/reciprocal-bridge'
PINS = {
    'FourExternalCandidate.lean': '3ad9ae42a4271cef9d8f7e4a81a35296ab58a9f78569937457f07833f943495b',
    'FourEdgeUniversesCandidate.lean': 'be21454788d0ed269ed1a26dc28e447ee3fe2417a4997555ec4677015f368938',
    'FourEdgeShard_1097_129_192.lean': '01d79297bd50ea4a85fad63f2eeb5e41129c9908a5d0d77a7eea7af455d01e68',
}


def project():
    sources = {}
    for name, digest in PINS.items():
        raw = (BASE / name).read_bytes()
        if hashlib.sha256(raw).hexdigest() != digest:
            raise ValueError(f'source pin mismatch: {name}')
        sources[name] = raw.decode('utf-8')
    def declaration(file, name):
        matches = re.findall(rf'^def {name} : Finset ℕ := \{{[0-9, ]+\}}$', sources[file], re.M)
        if len(matches) != 1:
            raise ValueError(f'expected one literal declaration: {name}')
        return matches[0]
    active = declaration('FourExternalCandidate.lean', 'active_1097')
    universe = declaration('FourEdgeUniversesCandidate.lean', 'universe_1097')
    shard = sources['FourEdgeShard_1097_129_192.lean']
    if shard.count('edges_1097_129_192') != 2 or shard.count('Finset.Icc 129 192') != 1:
        raise ValueError('unexpected original shard structure')
    # Only change import, theorem identifier, and interval; proposition body is exact.
    shard = shard.replace('import FourEdgeUniversesCandidate', 'import FourProbeLiterals')
    shard = shard.replace('edges_1097_129_192', 'edges_1097_129_132')
    shard = shard.replace('Finset.Icc 129 192', 'Finset.Icc 129 132')
    literals = ('import Mathlib\nset_option maxRecDepth 100000\n'
                'namespace FourExternal\nnoncomputable section\n' + active + '\n' + universe +
                '\nend\nend FourExternal\n')
    return {'FourProbeLiterals.lean': literals, 'FourProbe.lean': shard}


def main():
    if len(sys.argv) != 2:
        raise SystemExit('usage: prepare_four_probe.py EMPTY_OUTPUT_DIR')
    out = Path(sys.argv[1])
    out.mkdir(parents=True, exist_ok=True)
    if any(out.iterdir()):
        raise ValueError('output directory must be empty')
    for name, text in project().items():
        (out / name).write_text(text)
    print('projected pinned candidate: node 1097, b=129..132; not original closure')


if __name__ == '__main__':
    main()
