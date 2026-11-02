"""Generate an uncompiled Lean candidate from locally reproduced data."""
import json
from pathlib import Path
import sys
R=Path(__file__).resolve().parents[1]
data=json.loads((R/'audit/reciprocal-bridge/FourExternalData.json').read_text())
header='''import ActiveSupport
import Erdos302ReflectiveChainTopFC

/- CI CANDIDATE ONLY: support equalities are explicit premises; source chain,
   reduction of predT, and this file have not been compiled together. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 80000000
open Erdos302ReflectiveChain Erdos302Reflective Erdos302PrimeBlockFC
open UpperBridge
namespace FourExternal
noncomputable section

def P : Finset ℕ := {2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71}
def U (n : ℕ) : Finset ℕ := smoothSet P n

theorem positive (n : ℕ) : ∀ x ∈ U n, 0 < x := by
  classical
  intro x hx
  have hx' : x ∈ Finset.Icc 1 n := (Finset.mem_filter.mp hx).1
  exact (Finset.mem_Icc.mp hx').1

/-- Literal support correspondence and exact packed-tree evaluation are separately
    supplied; this theorem makes the trim and source-chain dependencies visible. -/
theorem from_chain (n r : ℕ) (V : Finset ℕ)
    (hn : n ≤ 500000) (heval : predT TL_0 0 n = r)
    (hsupport : V = activeSupport (U n)) : Extended.Bound V r := by
  subst V
  apply activeSupport_bound_of_upstream (positive n)
  intro S hS
  have h := chain_0.2 n S hS
  rw [chain_0.1 n hn, heval] at h
  exact h

'''
parts=[header]
for x in data:
 i,n,r=x['node'],x['n'],x['demand']
 vals=', '.join(map(str,x['active']))
 parts.append(f'''/-- Enumerated externalActive node {i}; transcription remains external. -/
def active_{i} : Finset ℕ := {{{vals}}}

/-- Concrete packed-tree evaluation: candidate kernel reduction. -/
theorem eval_{i} : predT TL_0 0 {n} = {r} := by
  decide +kernel

/-- Exact semantic trim obligation, deliberately not asserted as proved. -/
def support_obligation_{i} : Prop := active_{i} = activeSupport (U {n})

theorem bound_{i} (hs : support_obligation_{i}) :
    Extended.Bound active_{i} {r} := by
  exact from_chain {n} {r} active_{i} (by decide) eval_{i} hs

#print axioms eval_{i}
#print axioms bound_{i}

''')
parts.append('end\nend FourExternal\n')
text=''.join(parts)
out=R/'audit/reciprocal-bridge/FourExternalCandidate.lean'
if '--write' in sys.argv: out.write_text(text)
else: assert out.read_text()==text, 'generated Lean differs'
print('Lean candidate deterministic; not compiled')
