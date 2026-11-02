import RenewalPointwiseAllocation
import OccurrenceIndex

/-! Candidate Mathlib bridge: concrete occurrence lists, with no assumed global
index identity. The list positions retain duplicate exponent choices. -/
namespace RenewalConcreteOccurrence
open Finset RenewalMultiplicityCandidate RenewalOccurrenceIndex

private theorem list_range_sum_eq (f : ℕ → ℕ) (n : ℕ) :
    ((List.range n).map f).sum = ∑ k ∈ Finset.range n, f k := by
  induction n with
  | zero => simp
  | succ n ih =>
      simp only [List.range_succ, List.map_append, List.map_cons, List.map_nil,
        List.sum_append, List.sum_cons, List.sum_nil, Nat.add_zero,
        Finset.sum_range_succ, ih]

theorem expansion_list (p : ℕ → ℕ) (d : ℕ → ℕ → ℕ) (levels n : ℕ) :
    expansion p d levels n = listExpansion p d levels n := by
  induction levels generalizing n with
  | zero => rfl
  | succ j ih =>
      simp only [expansion, listExpansion, list_range_sum_eq]
      apply Finset.sum_congr rfl
      intro k hk
      rw [ih]

theorem index_expansion (p : ℕ → ℕ) (d : ℕ → ℕ → ℕ) (levels n : ℕ) :
    expansion p d levels n =
      ((occurrences p levels n).map (fun a => d a.level a.arg)).sum := by
  rw [expansion_list, RenewalOccurrenceIndex.index_expansion]

def multiplicity {ι : Type*} (occ : List Occurrence) (hits : Occurrence → ι → ℕ)
    (i : ι) : ℕ := ((occ.map fun a => hits a i)).sum

private theorem list_sum_swap {ι : Type*} (cells : Finset ι) (xs : List Occurrence)
    (weight : Occurrence → ι → ℕ) :
    (∑ i ∈ cells, ((xs.map fun a => weight a i)).sum) =
      ((xs.map fun a => ∑ i ∈ cells, weight a i)).sum := by
  induction xs with
  | nil => simp
  | cons a xs ih =>
      simp only [List.map_cons, List.sum_cons, Finset.sum_add_distrib, ih]

theorem allocation {ι : Type*} (cells : Finset ι)
    (hits : Occurrence → ι → ℕ) (height : ι → ℕ)
    (p : ℕ → ℕ) (d u : ℕ → ℕ → ℕ) (levels n r : ℕ)
    (hp : ∀ j, 1 < p j)
    (hbase : ∀ x, u 0 x = 0)
    (hu0 : ∀ j, u j 0 = 0)
    (hd0 : ∀ j, d j 0 = 0)
    (hrec : ∀ j x, 0 < x →
      u (j + 1) x = u j x + u (j + 1) (x / p j) + d j x)
    (correction : ∀ a ∈ occurrences p levels n, d a.level a.arg =
      ∑ i ∈ cells, height i * hits a i)
    (bound : u levels n ≤ r) :
    (∑ i ∈ cells, height i * multiplicity (occurrences p levels n) hits i) ≤ r := by
  have hsum : (∑ i ∈ cells, height i * multiplicity (occurrences p levels n) hits i) =
      ((occurrences p levels n).map (fun a => d a.level a.arg)).sum := by
    calc
      _ = ∑ i ∈ cells, (((occurrences p levels n).map fun a => height i * hits a i)).sum := by
        apply Finset.sum_congr rfl
        intro i hi
        simp [multiplicity, List.sum_map_mul_left]
      _ = (((occurrences p levels n).map fun a =>
          ∑ i ∈ cells, height i * hits a i)).sum := list_sum_swap cells _ _
      _ = _ := by
        congr 1
        apply List.map_congr_left
        intro a ha
        exact (correction a ha).symm
  rw [hsum, ← index_expansion, ← expansion_eq p d u hp hbase hu0 hd0 hrec]
  exact bound

#print axioms index_expansion
#print axioms allocation
end RenewalConcreteOccurrence
