import JointIndependenceCandidate

/-! Small proposed Lean regressions. Uncompiled until hosted checking. -/
open Finset RenewalNext JointIndependenceCandidate

example : SmoothRenewal.Edge ({2, 3, 6} : Finset ℕ) := by
  refine ⟨2, 3, 6, ?_, ?_, ?_, ?_, rfl⟩ <;> norm_num

example : SmoothRenewal.Edge ({5, 6, 30} : Finset ℕ) := by
  refine ⟨5, 6, 30, ?_, ?_, ?_, ?_, rfl⟩ <;> norm_num

example (E : Finset ℕ → Prop) (S : Finset ℕ) (r : ℕ)
    (h : Demand E S r) :
    ∀ B, B ⊆ S → Independent E B → B.card + r ≤ S.card :=
  independence_of_demand E S r h

example (E : Finset ℕ → Prop) (S : Finset ℕ) : Demand E S 0 := by
  apply demand_of_independence
  intro B hB _
  simpa using Finset.card_le_card hB
