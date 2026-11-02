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
OUT = ROOT / 'audit/reciprocal-bridge/FourEdgeShardsCandidate.lean'


def render():
    data = json.loads(DATA.read_text())
    assert [x['node'] for x in data] == [1097, 1107, 1112, 1114]
    out = ['''import FourExternalCandidate

/- CANDIDATE: closed finite edge-retention certificates on literal universes.
   No archive correspondence or equality with the upstream smooth universe is
   asserted here. These declarations require actual Lean/axiom CI verification. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 80000000
namespace FourExternal

''']
    for x in data:
        i, n = x['node'], x['n']
        u, v = x['universe'], x['active']
        assert u == sorted(set(u)) and v == sorted(set(v))
        assert all(type(z) is int and 1 <= z <= n for z in u)
        assert set(v) <= set(u)
        out.append(f"def universe_{i} : Finset ℕ := {{{', '.join(map(str, u))}}}\n\n")
        # Each pair is covered exactly once by its first coordinate's interval.
        # Division is only a candidate: the equality test rejects rounding.
        for lo in range(1, n + 1, 64):
            hi = min(n, lo + 63)
            out.append(f'''theorem edges_{i}_{lo}_{hi} :
    ∀ b ∈ (Finset.Icc {lo} {hi}), ∀ c ∈ universe_{i},
      b ∈ universe_{i} → b < c →
      let a := b * c / (b + c)
      a ∈ universe_{i} → b * c = a * (b + c) →
      a ∈ active_{i} ∧ b ∈ active_{i} ∧ c ∈ active_{i} := by
  decide +kernel

#print axioms edges_{i}_{lo}_{hi}

''')
    out.append('end FourExternal\n')
    return ''.join(out)


def main():
    text = render()
    if '--write' in sys.argv:
        OUT.write_text(text)
    else:
        assert OUT.read_text() == text, 'generated edge shards differ'
    print('deterministic shard candidate:', text.count('theorem edges_'), 'closed declarations; compilation NOT checked')


if __name__ == '__main__':
    main()
