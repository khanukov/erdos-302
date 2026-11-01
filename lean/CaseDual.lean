import CaseRules

/-! Standalone signed residual dual certificate.  This checks finite data, not
archive parsing, reference validity, or case-tree reachability. -/
namespace BankCase
open Finset
open scoped BigOperators

variable {α ι : Type*} [DecidableEq α] [DecidableEq ι]

/-- Integer row weights retain multiplicity when indices identify occurrences. -/
def dualCheck (I : Finset ι) (R : ι → Finset α) (r w : ι → ℤ)
    (D : ℤ) (T O Z : Finset α) (k : ℕ) : Bool :=
  decide (0 < D ∧ (∀ i ∈ I, 0 < w i) ∧
    (∀ x ∈ Free T O Z, (∑ i ∈ I.filter (fun i => x ∈ R i), w i) ≤ D) ∧
    D * ((k : ℤ) - 1 - (O.card : ℤ)) <
      ∑ i ∈ I, w i * Remaining (R i) (r i) O)

/-- Sum the signed row inequalities, transpose incidences, then use capacity
only on free vertices. No nonnegativity of the residuals is assumed. -/
theorem dual_inequality (I : Finset ι) (R : ι → Finset α) (r w : ι → ℤ)
    (D : ℤ) (T O Z C : Finset α)
    (hs : State T O Z C)
    (hr : ∀ i ∈ I, Row (R i) (r i) C)
    (hw : ∀ i ∈ I, 0 ≤ w i)
    (hcap : ∀ x ∈ Free T O Z,
      (∑ i ∈ I.filter (fun i => x ∈ R i), w i) ≤ D) :
    (∑ i ∈ I, w i * Remaining (R i) (r i) O) ≤
      D * ((C ∩ Free T O Z).card : ℤ) := by
  let S := C ∩ Free T O Z
  have htranspose :
      (∑ i ∈ I, w i * ((C ∩ (R i ∩ Free T O Z)).card : ℤ)) =
      ∑ x ∈ S, ∑ i ∈ I.filter (fun i => x ∈ R i), w i := by
    simp only [Finset.sum_filter]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro i hi
    rw [← Finset.sum_filter]
    have heq : S.filter (fun x => x ∈ R i) = C ∩ (R i ∩ Free T O Z) := by
      ext x
      simp [S, and_assoc, and_left_comm, and_comm]
    rw [heq]
    simp [Int.mul_comm]
  calc
    (∑ i ∈ I, w i * Remaining (R i) (r i) O) ≤
        ∑ i ∈ I, w i * ((C ∩ (R i ∩ Free T O Z)).card : ℤ) := by
      apply Finset.sum_le_sum
      intro i hi
      exact mul_le_mul_of_nonneg_left (remaining_le_selected hs (hr i hi)) (hw i hi)
    _ = ∑ x ∈ S, ∑ i ∈ I.filter (fun i => x ∈ R i), w i := htranspose
    _ ≤ ∑ _x ∈ S, D := by
      apply Finset.sum_le_sum
      intro x hx
      exact hcap x (mem_inter.mp hx).2
    _ = D * ((C ∩ Free T O Z).card : ℤ) := by simp [S, Int.mul_comm]

/-- A checked dual leaf excludes every small model of the supplied rows. -/
theorem dualCheck_sound (I : Finset ι) (R : ι → Finset α) (r w : ι → ℤ)
    (D : ℤ) (T O Z C : Finset α) (k : ℕ)
    (hc : dualCheck I R r w D T O Z k = true)
    (hs : State T O Z C) (hsmall : (C.card : ℤ) ≤ (k : ℤ) - 1)
    (hr : ∀ i ∈ I, Row (R i) (r i) C) : False := by
  simp only [dualCheck, decide_eq_true_eq] at hc
  obtain ⟨hD, hw, hcap, hobj⟩ := hc
  have hineq := dual_inequality I R r w D T O Z C hs hr
    (fun i hi => le_of_lt (hw i hi)) hcap
  have hd : Disjoint O (C ∩ Free T O Z) := by
    apply disjoint_left.mpr
    intro x hx hy
    exact (mem_sdiff.mp (mem_sdiff.mp (mem_inter.mp hy).2).1).2 hx
  have hsub : O ∪ (C ∩ Free T O Z) ⊆ C := by
    intro x hx
    rcases mem_union.mp hx with hx | hx
    · exact hs.2.1 hx
    · exact (mem_inter.mp hx).1
  have hcard := card_le_card hsub
  rw [card_union_of_disjoint hd] at hcard
  have hbudget : ((C ∩ Free T O Z).card : ℤ) ≤
      (k : ℤ) - 1 - (O.card : ℤ) := by omega
  have hmul := mul_le_mul_of_nonneg_left hbudget (le_of_lt hD)
  omega

-- Tiny disjoint rows need two vertices while the budget permits only one.
example : dualCheck ({0, 1} : Finset ℕ) (fun i => if i = 0 then {0} else {1})
    (fun _ => 1) (fun _ => 1) 1 ({0, 1} : Finset ℕ) ∅ ∅ 2 = true := by decide
-- A zero weight is rejected.
example : dualCheck ({0} : Finset ℕ) (fun _ => ({0} : Finset ℕ))
    (fun _ => 1) (fun _ => 0) 1 ({0} : Finset ℕ) ∅ ∅ 1 = false := by decide
-- Capacity overload is rejected even when the objective would exceed the budget.
example : dualCheck ({0, 1} : Finset ℕ) (fun _ => ({0} : Finset ℕ))
    (fun _ => 1) (fun _ => 1) 1 ({0} : Finset ℕ) ∅ ∅ 1 = false := by decide
-- A negative remaining demand stays signed and does not create a false leaf.
example : dualCheck ({0} : Finset ℕ) (fun _ => ({0} : Finset ℕ))
    (fun _ => 0) (fun _ => 1) 1 ({0} : Finset ℕ) {0} ∅ 2 = false := by decide

#print axioms dualCheck_sound
end BankCase
