import Mathlib

/-!
Case-rule soundness, independent of the archive parser.  All residuals and
budgets are integers; in particular a negative residual is not truncated.
The premises are deliberately explicit: this file does not certify the bank.
-/
namespace BankCase
open Finset

variable {α : Type*} [DecidableEq α]

def Free (T O Z : Finset α) : Finset α := (T \ O) \ Z

def State (T O Z C : Finset α) : Prop :=
  C ⊆ T ∧ O ⊆ C ∧ Disjoint C Z

def Row (R : Finset α) (r : ℤ) (C : Finset α) : Prop :=
  r ≤ ((C ∩ R).card : ℤ)

def Residual (U T : Finset α) (r : ℕ) : ℤ :=
  (r : ℤ) - ((U \ T).card : ℤ)

/-- An image bound applied to C∩U induces the archive's signed residual row.
The extra U\T term is retained even if C is already contained in T. -/
theorem residual_sound (U T C : Finset α) (r : ℕ)
    (h : r ≤ (C ∩ U).card) : Row (U ∩ T) (Residual U T r) C := by
  have hs : C ∩ U ⊆ (U \ T) ∪ (C ∩ (U ∩ T)) := by
    intro x hx
    simp only [mem_inter] at hx
    by_cases ht : x ∈ T
    · exact mem_union_right _ (mem_inter.mpr ⟨hx.1, mem_inter.mpr ⟨hx.2, ht⟩⟩)
    · exact mem_union_left _ (mem_sdiff.mpr ⟨hx.2, ht⟩)
  have hc := card_le_card hs
  have hu := card_union_le (U \ T) (C ∩ (U ∩ T))
  unfold Row Residual
  omega

/-- Decompose a selected row into already-selected and selected free vertices. -/
theorem row_decompose {T O Z C R : Finset α} (h : State T O Z C) :
    (C ∩ R).card = (O ∩ R).card + (C ∩ (R ∩ Free T O Z)).card := by
  rcases h with ⟨hCT, hOC, hCZ⟩
  have hd : Disjoint (O ∩ R) (C ∩ (R ∩ Free T O Z)) := by
    apply disjoint_left.mpr
    intro x hx hy
    have hxO : x ∈ O := (mem_inter.mp hx).1
    have hyfree := (mem_inter.mp (mem_inter.mp hy).2).2
    exact (mem_sdiff.mp (mem_sdiff.mp hyfree).1).2 hxO
  have heq : C ∩ R = (O ∩ R) ∪ (C ∩ (R ∩ Free T O Z)) := by
    ext x
    simp only [mem_inter, mem_union, Free, mem_sdiff]
    constructor
    · rintro ⟨hxC, hxR⟩
      by_cases hxO : x ∈ O
      · exact Or.inl ⟨hxO, hxR⟩
      · have hxZ : x ∉ Z := fun hz => disjoint_left.mp hCZ hxC hz
        exact Or.inr ⟨hxC, hxR, ⟨⟨hCT hxC, hxO⟩, hxZ⟩⟩
    · rintro (⟨hxO, hxR⟩ | ⟨hxC, hxR, _⟩)
      · exact ⟨hOC hxO, hxR⟩
      · exact ⟨hxC, hxR⟩
  rw [heq, card_union_of_disjoint hd]

/-- The actual integer residual after accounting for the selected ones. -/
def Remaining (R : Finset α) (r : ℤ) (O : Finset α) : ℤ :=
  r - ((O ∩ R).card : ℤ)

theorem remaining_le_selected {T O Z C R : Finset α} {r : ℤ}
    (hs : State T O Z C) (hr : Row R r C) :
    Remaining R r O ≤ ((C ∩ (R ∩ Free T O Z)).card : ℤ) := by
  have h := row_decompose (R := R) hs
  unfold Remaining Row at *
  omega

/-- The row leaf rejects exactly when demand exceeds available free vertices. -/
theorem row_reject {T O Z C R : Finset α} {r : ℤ}
    (hs : State T O Z C) (hr : Row R r C)
    (bad : ((R ∩ Free T O Z).card : ℤ) < Remaining R r O) : False := by
  have h := remaining_le_selected hs hr
  have hc := card_le_card (inter_subset_right : C ∩ (R ∩ Free T O Z) ⊆ R ∩ Free T O Z)
  omega

/-- Equality forces *every* free vertex in this row into the cover.
Positivity is not needed for soundness, though the archive checks it. -/
theorem force_sound {T O Z C R : Finset α} {r : ℤ}
    (hs : State T O Z C) (hr : Row R r C)
    (eq : Remaining R r O = ((R ∩ Free T O Z).card : ℤ)) :
    State T (O ∪ (R ∩ Free T O Z)) Z C := by
  have h := remaining_le_selected hs hr
  have hsub : C ∩ (R ∩ Free T O Z) ⊆ R ∩ Free T O Z := inter_subset_right
  have hc : (R ∩ Free T O Z).card ≤ (C ∩ (R ∩ Free T O Z)).card := by omega
  have heq : C ∩ (R ∩ Free T O Z) = R ∩ Free T O Z := eq_of_subset_of_card_le hsub hc
  refine ⟨hs.1, ?_, hs.2.2⟩
  intro x hx
  rcases mem_union.mp hx with hx | hx
  · exact hs.2.1 hx
  · have : x ∈ C ∩ (R ∩ Free T O Z) := by rw [heq]; exact hx
    exact (mem_inter.mp this).1

/-- Archive budget k−1−|ones|, without natural subtraction. -/
theorem budget_reject {T O Z C : Finset α} {k : ℕ}
    (hs : State T O Z C) (hsmall : (C.card : ℤ) ≤ (k : ℤ) - 1)
    (bad : (k : ℤ) - 1 - (O.card : ℤ) < 0) : False := by
  have h := card_le_card hs.2.1
  omega

/-- Both children are required, with zeros first as in the archive. -/
theorem split_sound {T O Z C : Finset α} (x : α)
    (hs : State T O Z C)
    (zero : State T O (insert x Z) C → False)
    (one : State T (insert x O) Z C → False) : False := by
  by_cases hx : x ∈ C
  · apply one
    refine ⟨hs.1, ?_, hs.2.2⟩
    intro y hy
    rcases mem_insert.mp hy with rfl | hy
    · exact hx
    · exact hs.2.1 hy
  · apply zero
    refine ⟨hs.1, hs.2.1, ?_⟩
    apply disjoint_left.mpr
    intro y hy hz
    rcases mem_insert.mp hz with rfl | hz
    · exact hx hy
    · exact disjoint_left.mp hs.2.2 hy hz

#print axioms residual_sound
#print axioms force_sound
#print axioms budget_reject
#print axioms split_sound
end BankCase
