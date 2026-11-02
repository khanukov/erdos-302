import RenewalMultiplicityCandidate

/-! Candidate: occurrence indices are not quotiented by their level or argument.
The caller must exhibit an indexing of the nested expansion and prove the local
correction identities; neither obligation follows from the abstract recurrence. -/
namespace RenewalPointwiseAllocation
open Finset RenewalMultiplicityCandidate

/-- The multiplicity of a cell is a sum over occurrence indices. Distinct
indices can have identical level and argument, and each is counted. -/
def multiplicity {α ι : Type*} (occ : Finset α) (hits : α → ι → ℕ)
    (i : ι) : ℕ := ∑ a ∈ occ, hits a i

/-- An arbitrary finite indexing of the nested expansion yields pointwise
allocation. `index_expansion` is the exact indexing obligation for that
expansion; `correction` is local to each indexed occurrence. No allocation
inequality is assumed. -/
theorem allocation {α ι : Type*} (occ : Finset α) (cells : Finset ι)
    (level arg : α → ℕ) (hits : α → ι → ℕ) (height : ι → ℕ)
    (p : ℕ → ℕ) (d u : ℕ → ℕ → ℕ) (levels n r : ℕ)
    (hp : ∀ j, 1 < p j)
    (hbase : ∀ x, u 0 x = 0)
    (hu0 : ∀ j, u j 0 = 0)
    (hd0 : ∀ j, d j 0 = 0)
    (hrec : ∀ j x, 0 < x →
      u (j + 1) x = u j x + u (j + 1) (x / p j) + d j x)
    (index_expansion : expansion p d levels n =
      ∑ a ∈ occ, d (level a) (arg a))
    (correction : ∀ a ∈ occ, d (level a) (arg a) =
      ∑ i ∈ cells, height i * hits a i)
    (bound : u levels n ≤ r) :
    (∑ i ∈ cells, height i * multiplicity occ hits i) ≤ r := by
  have hsum : (∑ i ∈ cells, height i * multiplicity occ hits i) =
      ∑ a ∈ occ, d (level a) (arg a) := by
    calc
      (∑ i ∈ cells, height i * multiplicity occ hits i) =
          ∑ i ∈ cells, ∑ a ∈ occ, height i * hits a i := by
            apply Finset.sum_congr rfl
            intro i hi
            simp only [multiplicity, Finset.mul_sum]
      _ = ∑ a ∈ occ, ∑ i ∈ cells, height i * hits a i := Finset.sum_comm
      _ = ∑ a ∈ occ, d (level a) (arg a) := by
            apply Finset.sum_congr rfl
            intro a ha
            exact (correction a ha).symm
  rw [hsum, ← index_expansion, ← expansion_eq p d u hp hbase hu0 hd0 hrec]
  exact bound

#print axioms allocation
end RenewalPointwiseAllocation
