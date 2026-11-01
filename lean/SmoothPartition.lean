import SmoothRenewal
import BlockAccounting

/-! Disjoint bounded smooth blocks indexed by positive rough integers.
The prime set need not consist entirely of primes. This proves uniqueness and
finite block disjointness, not existence of a decomposition or a cover bound. -/
namespace SmoothPartition
open Finset

/-- A rough number is positive and has no prime divisor belonging to Q. -/
def Rough (Q : Finset ℕ) (n : ℕ) : Prop :=
  0 < n ∧ ∀ p, p.Prime → p ∈ Q → ¬ p ∣ n

/-- Euclid's lemma / unique prime factorization makes the two parts coprime. -/
theorem rough_coprime_smooth {Q : Finset ℕ} {a x : ℕ}
    (ha : Rough Q a) (hx : SmoothRenewal.Smooth Q x) : Nat.Coprime a x := by
  apply Nat.coprime_of_dvd
  intro p hp hpa hpx
  exact ha.2 p hp (hx p hp hpx) hpa

/-- A positive smooth factor and a positive rough factor are uniquely determined
by their product. Zero smooth factors must be excluded. -/
theorem decomposition_unique {Q : Finset ℕ} {a b x y : ℕ}
    (ha : Rough Q a) (hb : Rough Q b) (hx : 0 < x) (hy : 0 < y)
    (hsx : SmoothRenewal.Smooth Q x) (hsy : SmoothRenewal.Smooth Q y)
    (h : a * x = b * y) : a = b ∧ x = y := by
  have hab : a ∣ b := by
    apply (rough_coprime_smooth ha hsy).dvd_mul_right.mp
    rw [← h]
    exact ⟨x, rfl⟩
  have hba : b ∣ a := by
    apply (rough_coprime_smooth hb hsx).dvd_mul_right.mp
    rw [h]
    exact ⟨y, rfl⟩
  have heq : a = b := Nat.dvd_antisymm hab hba
  refine ⟨heq, ?_⟩
  subst b
  exact Nat.eq_of_mul_eq_mul_left ha.1 h

/-- The positive Q-smooth multiples of a, truncated to [1,N]. -/
noncomputable def block (Q : Finset ℕ) (N a : ℕ) : Finset ℕ := by
  classical
  exact (SmoothRenewal.vertices Q N).image (fun x => a * x) ∩ Icc 1 N

theorem block_subset (Q : Finset ℕ) (N a : ℕ) : block Q N a ⊆ Icc 1 N := by
  intro z hz
  exact (Finset.mem_inter.mp hz).2

/-- Different positive rough indices cannot share a point. -/
theorem blocks_disjoint {Q : Finset ℕ} {N a b : ℕ}
    (ha : Rough Q a) (hb : Rough Q b) (hne : a ≠ b) :
    Disjoint (block Q N a) (block Q N b) := by
  classical
  rw [Finset.disjoint_left]
  intro z hza hzb
  obtain ⟨x, hx, hax⟩ := Finset.mem_image.mp (Finset.mem_inter.mp hza).1
  obtain ⟨y, hy, hby⟩ := Finset.mem_image.mp (Finset.mem_inter.mp hzb).1
  have hx' := Finset.mem_filter.mp hx
  have hy' := Finset.mem_filter.mp hy
  have hxpos : 0 < x := (Finset.mem_Icc.mp hx'.1).1
  have hypos : 0 < y := (Finset.mem_Icc.mp hy'.1).1
  exact hne (decomposition_unique ha hb hxpos hypos hx'.2 hy'.2
    (hax.trans hby.symm)).1

/-- The concrete blocks satisfy the disjointness input to the global ledger;
local complement demand is still a separate hypothesis. -/
theorem global_accounting {Q : Finset ℕ} {N : ℕ} {A s : Finset ℕ}
    {weight count : ℕ → ℕ} (hA : A ⊆ Icc 1 N)
    (hrough : ∀ i ∈ s, Rough Q i)
    (hdemand : ∀ i ∈ s, weight i * count i ≤
      (block Q N i ∩ (Icc 1 N \ A)).card) :
    A.card + ∑ i ∈ s, weight i * count i ≤ N := by
  apply BlockAccounting.global_block_accounting hA
  · intro i hi
    exact block_subset Q N i
  · intro i hi j hj hij
    exact blocks_disjoint (hrough i hi) (hrough j hj) hij
  · exact hdemand

#print axioms decomposition_unique
#print axioms blocks_disjoint
#print axioms global_accounting
end SmoothPartition
