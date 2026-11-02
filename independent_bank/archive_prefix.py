#!/usr/bin/env python3
"""Fail-closed reification of the initial small-node prefix; not a Lean parser."""
import hashlib
import lzma
from math import gcd
from pathlib import Path
import sys

from replay_inventory import parse_json

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'audit/source/erdos302_boundary_certificates/baseline/bank.json.xz'
TARGET = ROOT / 'lean/ArchiveSmallPrefix.lean'
SHA256 = '5c1a1fa4edcc1a0bc7ac3fc9cd3bc7fca4eedad6cb689b6540436ca35ed89034'


def load_bank(raw=None):
    if raw is None:
        raw = SOURCE.read_bytes()
    if hashlib.sha256(raw).hexdigest() != SHA256:
        raise ValueError('source SHA-256 mismatch')
    bank = parse_json(lzma.decompress(raw))
    if (type(bank) is not dict or set(bank) != {'schema', 'nodes', 'images', 'roots'}
            or bank['schema'] != 'erdos302-standalone-finite-proof-bank-v1'
            or type(bank['nodes']) is not list):
        raise ValueError('bank schema')
    return bank


def render_prefix(bank, count):
    if type(count) is not int or count < 1 or count > len(bank['nodes']):
        raise ValueError('invalid prefix length')
    lines = []
    for i, node in enumerate(bank['nodes'][:count]):
        if (type(node) is not dict or set(node) != {'t', 'v', 'r'}
                or node['t'] != 'small' or type(node['v']) is not list
                or not node['v'] or any(type(x) is not int or x <= 0 for x in node['v'])
                or node['v'] != sorted(set(node['v'])) or gcd(*node['v']) != 1
                or type(node['r']) is not int or not 1 <= node['r'] <= len(node['v'])):
            raise ValueError(f'unsupported node {i}')
        values = ', '.join(map(str, node['v']))
        lines.append(f"  | {i} => ⟨{{{values}}}, {node['r']}, .small⟩")
    cases = '\n'.join(lines)
    return f'''import BankProfile

/- Generated from pinned bank bytes by archive_prefix.py. Python transcription,
   including parsing and normalization, is not proved inside Lean. -/
namespace ArchiveSmallPrefix

def nodes : ℕ → ArchiveDag.Node
{cases}
  | _ => ⟨∅, 0, .small⟩

theorem valid : ∀ i < {count}, ArchiveDag.Check nodes i := by
  intro i hi
  interval_cases i <;> decide

theorem sound : ∀ i < {count},
    Extended.Bound (nodes i).support (nodes i).demand :=
  ArchiveDag.sound nodes {count} valid

#print axioms valid
#print axioms sound
end ArchiveSmallPrefix
'''


if __name__ == '__main__':
    expected = render_prefix(load_bank(), 4)
    if sys.argv[1:] == ['--write']:
        TARGET.write_text(expected)
    elif sys.argv[1:] == []:
        if TARGET.read_text() != expected:
            raise SystemExit('generated Lean source differs from pinned bank')
        print('nodes 0–3 match pinned bank source')
    else:
        raise SystemExit('usage: archive_prefix.py [--write]')
