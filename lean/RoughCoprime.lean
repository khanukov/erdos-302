import SmoothCover
import Mathlib.Data.Nat.GCD.BigOperators

/-! Identify the rough-index partition with the coprimality-indexed partition
when every element of Q is prime. Positivity is essential even for empty Q. -/
namespace SmoothPartition
open Finset
open scoped BigOperators

/-- Roughness is positivity plus coprimality to the product of the Q-primes. -/
theorem rough_iff_coprime_product {Q : Finset ℕ} {n : ℕ}
    (hprime : ∀ p ∈ Q, p.Prime) :
    Rough Q n ↔ 0 < n ∧ Nat.Coprime n (∏ p ∈ Q, p) := by
  constructor
  · intro h
    refine ⟨h.1, ?_⟩
    apply Nat.coprime_prod_right_iff.mpr
    intro p hp
    exact ((hprime p hp).coprime_iff_not_dvd.mpr (h.2 p (hprime p hp) hp)).symm
  · rintro ⟨hn, hc⟩
    refine ⟨hn, ?_⟩
    intro p hp hmem
    have hcp : Nat.Coprime n p := (Nat.coprime_prod_right_iff.mp hc) p hmem
    exact hp.coprime_iff_not_dvd.mp hcp.symm

/-- The actual finite index set agrees with the usual coprimality filter. -/
theorem roughIndices_eq_coprime (Q : Finset ℕ) (N : ℕ)
    (hprime : ∀ p ∈ Q, p.Prime) :
    roughIndices Q N = (Icc 1 N).filter (fun a => Nat.Coprime a (∏ p ∈ Q, p)) := by
  classical
  ext a
  simp only [roughIndices, Finset.mem_filter, rough_iff_coprime_product hprime,
    Finset.mem_Icc]
  omega

/-- The finite partition covers [1,N] with coprimality-indexed blocks. -/
theorem coprime_blocks_cover (Q : Finset ℕ) (N : ℕ)
    (hprime : ∀ p ∈ Q, p.Prime) :
    ((Icc 1 N).filter (fun a => Nat.Coprime a (∏ p ∈ Q, p))).biUnion
      (block Q N) = Icc 1 N := by
  rw [← roughIndices_eq_coprime Q N hprime]
  exact blocks_cover Q N

/-- Distinct coprimality-indexed blocks are disjoint. -/
theorem coprime_indexed_blocks_disjoint {Q : Finset ℕ} {N a b : ℕ}
    (hprime : ∀ p ∈ Q, p.Prime)
    (ha : a ∈ (Icc 1 N).filter (fun a => Nat.Coprime a (∏ p ∈ Q, p)))
    (hb : b ∈ (Icc 1 N).filter (fun a => Nat.Coprime a (∏ p ∈ Q, p)))
    (hne : a ≠ b) : Disjoint (block Q N a) (block Q N b) := by
  apply indexed_blocks_disjoint (Q := Q) (N := N) ?_ ?_ hne
  · rw [roughIndices_eq_coprime Q N hprime]; exact ha
  · rw [roughIndices_eq_coprime Q N hprime]; exact hb

#print axioms rough_iff_coprime_product
#print axioms roughIndices_eq_coprime
#print axioms coprime_blocks_cover
#print axioms coprime_indexed_blocks_disjoint
end SmoothPartition
