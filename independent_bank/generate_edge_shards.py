"""Generate uncompiled closed Lean edge-retention shards from the checked-in literals.

This does NOT prove that the universe literals equal the upstream smooth sets or
that these literals faithfully transcribe the archive. Run four_external_data.py
separately for independent, non-kernel transcription checks.
"""
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / 'audit/reciprocal-bridge/FourExternalData.json'
BASE = ROOT / 'audit/reciprocal-bridge'
OUT = BASE / 'FourEdgeShardsCandidate.lean'


def render():
    data = json.loads(DATA.read_text())
    assert [x['node'] for x in data] == [1097, 1107, 1112, 1114]
    universes = ['''import FourExternalCandidate

/- CANDIDATE: closed finite edge-retention certificates on literal universes.
   No archive correspondence or equality with the upstream smooth universe is
   asserted here. These declarations require actual Lean/axiom CI verification. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 80000000
namespace FourExternal

''']
    modules = {}
    imports = []
    for x in data:
        i, n = x['node'], x['n']
        u, v = x['universe'], x['active']
        assert u == sorted(set(u)) and v == sorted(set(v))
        assert all(type(z) is int and 1 <= z <= n for z in u)
        assert set(v) <= set(u)
        universes.append(f"def universe_{i} : Finset ℕ := {{{', '.join(map(str, u))}}}\n\n")
        # Each pair is covered exactly once by its first coordinate's interval.
        # Division is only a candidate: the equality test rejects rounding.
        for lo in range(1, n + 1, 64):
            hi = min(n, lo + 63)
            name = f'FourEdgeShard_{i}_{lo}_{hi}'
            imports.append(name)
            modules[name + '.lean'] = f'''import FourEdgeUniversesCandidate

set_option maxRecDepth 100000
set_option maxHeartbeats 80000000
namespace FourExternal

theorem edges_{i}_{lo}_{hi} :
    ∀ b ∈ (Finset.Icc {lo} {hi}), ∀ c ∈ universe_{i},
      b ∈ universe_{i} → b < c →
      let a := b * c / (b + c)
      a ∈ universe_{i} → b * c = a * (b + c) →
      a ∈ active_{i} ∧ b ∈ active_{i} ∧ c ∈ active_{i} := by
  decide +kernel

#print axioms edges_{i}_{lo}_{hi}

end FourExternal
'''
    universes.append('end FourExternal\n')
    modules['FourEdgeUniversesCandidate.lean'] = ''.join(universes)
    modules[OUT.name] = ''.join(f'import {name}\n' for name in imports)
    assert len(imports) == 44 and len(set(imports)) == 44
    return modules


def main():
    modules = render()
    expected = set(modules)
    actual = {p.name for p in BASE.glob('FourEdgeShard_*.lean')} | {OUT.name, 'FourEdgeUniversesCandidate.lean'}
    if '--write' in sys.argv:
        if actual - expected:
            raise RuntimeError(f'unexpected shard files: {sorted(actual - expected)}')
        for name, text in modules.items():
            (BASE / name).write_text(text)
    else:
        assert actual == expected, f'shard file set differs: {sorted(actual ^ expected)}'
        for name, text in modules.items():
            assert (BASE / name).read_text() == text, f'generated shard differs: {name}'
    print('deterministic shard candidate:', len(modules) - 2, 'closed declarations; compilation NOT checked')


if __name__ == '__main__':
    main()
