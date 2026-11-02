import RenewalPointwiseAllocation
open Finset RenewalMultiplicityCandidate RenewalPointwiseAllocation

private def occ : Finset ℕ := {0, 1}
private def cells : Finset ℕ := {0, 1}
private def hits (a i : ℕ) : ℕ := if a = i then 1 else 0
private def correction (_ n : ℕ) : ℕ := if 0 < n then 1 else 0

-- Synthetic equal indices demonstrate the abstract indexing interface; the
-- recurrence and bound below are assumptions, not an existence certificate.
example : (∑ a ∈ occ, correction 0 1) = 2 := by decide
example : multiplicity occ hits 0 = 1 ∧ multiplicity occ hits 1 = 1 := by decide
example : expansion (fun _ => 3) correction 1 3 =
    ∑ a ∈ occ, correction 0 1 := by decide
example : ∀ a ∈ occ, correction 0 1 = ∑ i ∈ cells, 1 * hits a i := by decide

-- The instantiated lemma derives the joint bound, rather than assuming it.
example (u : ℕ → ℕ → ℕ)
    (hbase : ∀ n, u 0 n = 0) (hu0 : ∀ j, u j 0 = 0)
    (hrec : ∀ j n, 0 < n →
      u (j + 1) n = u j n + u (j + 1) (n / 3) + correction j n)
    (bound : u 1 3 ≤ 2) :
    (∑ i ∈ cells, 1 * multiplicity occ hits i) ≤ 2 := by
  apply allocation occ cells (fun _ => 0) (fun _ => 1) hits (fun _ => 1)
    (fun _ => 3) correction u 1 3 2
  · intro j; decide
  · exact hbase
  · exact hu0
  · intro j; decide
  · exact hrec
  · decide
  · decide
  · exact bound

-- Repeated hits at one index are counted, not collapsed to a set.
example : multiplicity ({0, 1} : Finset ℕ) (fun _ _ => 2) 0 = 4 := by decide
example : multiplicity (∅ : Finset ℕ) hits 0 = 0 := by decide
