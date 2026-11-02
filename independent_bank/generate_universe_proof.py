"""Generate a partitioned, uncompiled smooth-universe candidate."""
from pathlib import Path
import sys

OUT = Path(__file__).resolve().parents[1] / 'audit/reciprocal-bridge/FourUniverseCandidate.lean'
CASES = [(1097, 420, 71), (1107, 644, 102), (1112, 806, 124), (1114, 814, 125)]

def render():
    s = '''import FourEdgeAssemblyCandidate

/- UNCHECKED CANDIDATE. Archive-to-literal correspondence remains external. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 80000000
namespace FourExternal
open UpperBridge Erdos302PrimeBlockFC Erdos302FinitePrimeDecompositionFC

def boundedSupported (x : ℕ) : Prop :=
  ∀ p ∈ Finset.Icc 1 x, p.Prime → p ∣ x → p ∈ P

instance (x : ℕ) : Decidable (boundedSupported x) := by
  unfold boundedSupported
  infer_instance

theorem supported_iff_bounded {x : ℕ} (hx : 0 < x) :
    PrimeSupported P x ↔ boundedSupported x := by
  constructor
  · intro h p hp hprime hdvd
    exact h p hprime hdvd
  · intro h p hprime hdvd
    exact h p (Finset.mem_Icc.mpr ⟨hprime.pos, Nat.le_of_dvd hx hdvd⟩) hprime hdvd

theorem mem_U_iff (n x : ℕ) :
    x ∈ U n ↔ x ∈ Finset.Icc 1 n ∧ boundedSupported x := by
  classical
  change x ∈ smoothSet P n ↔ _
  simp only [smoothSet, Finset.mem_filter]
  constructor
  · rintro ⟨hx, hs⟩
    exact ⟨hx, (supported_iff_bounded (Finset.mem_Icc.mp hx).1).mp hs⟩
  · rintro ⟨hx, hs⟩
    exact ⟨hx, (supported_iff_bounded (Finset.mem_Icc.mp hx).1).mpr hs⟩

'''
    for i, n, bound in CASES:
        ranges = [(lo, min(lo + 31, n)) for lo in range(1, n + 1, 32)]
        for lo, hi in ranges:
            s += f'''theorem universe_part_{i}_{lo}_{hi} :
    ∀ x ∈ Finset.Icc {lo} {hi}, (x ∈ universe_{i} ↔ boundedSupported x) := by
  decide +kernel

'''
        s += f'''theorem universe_range_{i} : ∀ x ∈ universe_{i}, x ∈ Finset.Icc 1 {n} := by
  decide +kernel

theorem universe_eq_{i} : U {n} = universe_{i} := by
  ext x
  rw [mem_U_iff]
  constructor
  · rintro ⟨hx, hs⟩
'''
        def split(source, conclusion):
            t = '    have ranges :\n      ' + ' ∨\n      '.join(f'x ∈ Finset.Icc {lo} {hi}' for lo, hi in ranges)
            t += f' := by\n      simp only [Finset.mem_Icc] at {source} ⊢\n      omega\n'
            t += '    rcases ranges with ' + ' | '.join(f'h{k}' for k in range(len(ranges))) + '\n'
            for k, (lo, hi) in enumerate(ranges):
                t += f'    · exact (universe_part_{i}_{lo}_{hi} x h{k}).{conclusion}\n'
            return t
        s += split('hx', 'mpr hs')
        s += f'  · intro hx\n    have hr := universe_range_{i} x hx\n    refine ⟨hr, ?_⟩\n'
        s += split('hr', 'mp hx')
        s += f'''\ntheorem closed_bound_{i} : Extended.Bound active_{i} {bound} :=
  bound_retained_{i} universe_eq_{i}

#print axioms universe_eq_{i}
#print axioms closed_bound_{i}

'''
    return s + 'end FourExternal\n'

def main():
    text = render()
    if '--write' in sys.argv:
        OUT.write_text(text)
    elif OUT.read_text() != text:
        raise SystemExit('candidate differs from generator')
    print('Generated candidate; Lean compilation and resource adequacy unverified')

if __name__ == '__main__':
    main()
