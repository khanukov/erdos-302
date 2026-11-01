import PackRule

open Finset UpperBridge
open scoped BigOperators

namespace ArchivePack

/-- Shards partition the *checks*, not the rows: every capacity check uses the
    complete index set. Overlap is harmless. The other three fields of Valid
    must be supplied independently. -/
theorem valid_of_capacity_shards {ι σ : Type*} [DecidableEq ι]
    (I : Finset ι) (T : ι → Finset ℕ) (w r : ι → ℕ)
    (D k : ℕ) (support : Finset ℕ) (shard : σ → ℕ → Prop)
    (hD : 0 < D)
    (hsub : ∀ i ∈ I, T i ⊆ support)
    (hcover : ∀ x ∈ support, ∃ s, shard s x)
    (hcap : ∀ s x, shard s x →
      (∑ i ∈ I.filter (fun i => x ∈ T i), w i) ≤ D)
    (hround : D * (k - 1) < ∑ i ∈ I, w i * r i) :
    Valid I T w r D k support := by
  refine ⟨hD, hsub, ?_, hround⟩
  intro x hx
  obtain ⟨s, hs⟩ := hcover x hx
  exact hcap s x hs

#print axioms valid_of_capacity_shards
end ArchivePack
