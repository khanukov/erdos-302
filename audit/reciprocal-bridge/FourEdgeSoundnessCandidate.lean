import FourEdgeShardsCandidate

/- Candidate semantic bridge. The retention hypothesis is deliberately explicit:
   the shard assembly and upstream-universe correspondence are not yet proved. -/
namespace FourExternal
open UpperBridge Erdos302ReflectiveChain Erdos302Reflective

/-- Retaining all edge endpoints is sufficient; equality with activeSupport is
not needed. No requirement that the covering set is contained in V is used. -/
theorem bound_from_edge_retention (n r : ℕ) (V : Finset ℕ)
    (hn : n ≤ 500000) (heval : predT TL_0 0 n = r)
    (retain : ∀ a b c, OrderedEdge (U n) a b c →
      a ∈ V ∧ b ∈ V ∧ c ∈ V) : Extended.Bound V r := by
  intro S hs
  have hcover : OrderedCover (U n) S := by
    intro a b c he
    obtain ⟨ha, hb, hc⟩ := retain a b c he
    exact hs a b c ⟨ha, hb, hc, he.2.2.2⟩
  have h := chain_0.2 n S (orderedCover_to_upstream (positive n) hcover)
  rw [chain_0.1 n hn, heval] at h
  exact h

#print axioms bound_from_edge_retention
end FourExternal
