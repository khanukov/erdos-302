import PrimePowerReindex
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic

/-! Candidate finite prime-power reindexing, pending Lean checking. -/
namespace PrimePowerSum
open Finset

/-- The bounded q,k support. Both coordinates are explicitly bounded by N. -/
def pairs (p P N : ℕ) : Finset (ℕ × ℕ) :=
  ((Icc 1 N).product (Icc 0 N)).filter fun x =>
    ¬ p ∣ x.1 ∧ Nat.Coprime x.1 P ∧ x.1 * p ^ x.2 ≤ N

/-- Positive integers up to N coprime to the earlier prime product. -/
def targets (P N : ℕ) : Finset ℕ :=
  (Icc 1 N).filter fun t => Nat.Coprime t P

-- Concrete boundary tests; these do not depend on the abstract theorem.
example : pairs 2 3 8 = {(1, 0), (1, 1), (1, 2), (1, 3), (5, 0), (7, 0)} := by decide
example : targets 3 8 = {1, 2, 4, 5, 7, 8} := by decide
example : pairs 2 3 0 = ∅ := by decide

/-- For p ≥ 2, every exponent k is strictly below p^k. -/
theorem exponent_lt_pow {p : ℕ} (hp : 2 ≤ p) (k : ℕ) : k < p ^ k := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [pow_succ]
      have hpos : 0 < p ^ k := by omega
      nlinarith

/-- Forward support membership, using coprimality of p with the earlier product. -/
theorem maps_to_target {p P N : ℕ} (hp : p.Prime)
    (hpP : Nat.Coprime p P) {x : ℕ × ℕ} (hx : x ∈ pairs p P N) :
    x.1 * p ^ x.2 ∈ targets P N := by
  simp only [pairs, mem_filter, mem_product, mem_Icc] at hx
  simp only [targets, mem_filter, mem_Icc]
  refine ⟨⟨?_, hx.2.2.2⟩, ?_⟩
  · exact Nat.mul_pos (by omega) (pow_pos hp.pos _)
  · exact Nat.Coprime.mul_left hx.2.2.1 (Nat.Coprime.pow_left _ hpP)

/-- Injectivity follows from uniqueness of prime-power decompositions. -/
theorem pair_injective {p P N : ℕ} (hp : p.Prime)
    {x y : ℕ × ℕ} (hx : x ∈ pairs p P N) (hy : y ∈ pairs p P N)
    (h : x.1 * p ^ x.2 = y.1 * p ^ y.2) : x = y := by
  simp only [pairs, mem_filter, mem_product, mem_Icc] at hx hy
  obtain ⟨h1, h2⟩ := PrimePowerReindex.decomposition_unique hp
    (by omega : 0 < x.1) (by omega : 0 < y.1) hx.2.1 hy.2.1 h
  exact Prod.ext h1 h2

/-- Every target has a bounded pair, including an exponent bounded by N. -/
theorem target_has_pair {p P N t : ℕ} (hp : p.Prime)
    (ht : t ∈ targets P N) : ∃ x ∈ pairs p P N, t = x.1 * p ^ x.2 := by
  simp only [targets, mem_filter, mem_Icc] at ht
  obtain ⟨x, hx, _⟩ := PrimePowerReindex.bounded_decomposition hp
    (by omega : 0 < t) ht.1.2 ht.2
  obtain ⟨hq, hn, hcop, hbound, heq⟩ := hx
  have hpow : 1 ≤ p ^ x.2 := by have := pow_pos hp.pos x.2; omega
  have hqN : x.1 ≤ N := by nlinarith
  have hkN : x.2 ≤ N := by
    have hk := exponent_lt_pow hp.two_le x.2
    nlinarith
  refine ⟨x, ?_, heq⟩
  simp only [pairs, mem_filter, mem_product, mem_Icc]
  exact ⟨⟨⟨by omega, hqN⟩, ⟨Nat.zero_le _, hkN⟩⟩, hn, hcop, hbound⟩

/-- Exact reindexing for arbitrary additive weights, not an assumed equality. -/
theorem sum_reindex {p P N : ℕ} (hp : p.Prime)
    (hpP : Nat.Coprime p P) {A : Type*} [AddCommMonoid A] (f : ℕ → A) :
    (∑ x ∈ pairs p P N, f (x.1 * p ^ x.2)) = ∑ t ∈ targets P N, f t := by
  apply Finset.sum_bij (fun x _ => x.1 * p ^ x.2)
  · intro x hx
    exact maps_to_target hp hpP hx
  · intro x hx y hy h
    exact pair_injective hp hx hy h
  · intro t ht
    obtain ⟨x, hx, he⟩ := target_has_pair hp ht
    exact ⟨x, hx, he.symm⟩
  · intro x hx
    rfl

#print axioms sum_reindex
end PrimePowerSum
