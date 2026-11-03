import ArchiveFirstSeedCandidate

open Finset UpperBridge RenewalNext SmoothRenewal

-- Exact public contract: no graph-bound premise, for every natural argument.
example : ∀ (Q : Finset ℕ), 3 ∈ Q → ∀ n : ℕ,
    Demand Edge (vertices (insert 2 Q) n) (ArchiveFirstSeedCandidate.seed n) :=
  ArchiveFirstSeedCandidate.seed_demand

example : ArchiveFirstSeedCandidate.seed 6 ≠ 2 := by decide
example : ArchiveFirstSeedCandidate.seed 12 ≠ 1 := by decide
example : ArchiveFirstSeedCandidate.seed 25 = 0 := by decide
example : ArchiveFirstSeedCandidate.seed 100 = 0 := by decide

-- Membership of 3 is not available for the empty set.
example : (3 : ℕ) ∉ (∅ : Finset ℕ) := by decide
example : True := by
  fail_if_success have : Demand Edge (vertices (insert 2 (∅ : Finset ℕ)) 12)
      (ArchiveFirstSeedCandidate.seed 12) :=
    ArchiveFirstSeedCandidate.seed_demand ∅ (by decide) 12
  trivial

#print axioms ArchiveFirstSeedCandidate.ordered_to_demand
#print axioms ArchiveFirstSeedCandidate.seed_demand
