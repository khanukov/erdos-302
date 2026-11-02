import ArchiveSmallPrefix
import ArchiveCase4

/-! Candidate semantic replay of node 4.  The byte-to-Lean transcription is
not verified in Lean; the tree and image arithmetic are checked in Lean. -/
namespace ArchiveCase4Staged

-- All three premises come from the previously checked node prefix.
theorem image0 : Extended.Bound ({4, 5, 20} : Finset ℕ) 1 := by
  have h := ArchiveScaling.bound_image
    (U := (ArchiveSmallPrefix.nodes 2).support) (m := 1) (d := 1) (r := 1)
    (by decide) (by decide) (by intro x hx; exact one_dvd _)
    (ArchiveSmallPrefix.sound 2 (by decide))
  have heq : ArchiveScaling.image (ArchiveSmallPrefix.nodes 2).support 1 1 =
      ({4, 5, 20} : Finset ℕ) := by decide
  rw [heq] at h
  exact h

theorem image1 : Extended.Bound ({6, 10, 15} : Finset ℕ) 1 := by
  have h := ArchiveScaling.bound_image
    (U := (ArchiveSmallPrefix.nodes 3).support) (m := 1) (d := 1) (r := 1)
    (by decide) (by decide) (by intro x hx; exact one_dvd _)
    (ArchiveSmallPrefix.sound 3 (by decide))
  have heq : ArchiveScaling.image (ArchiveSmallPrefix.nodes 3).support 1 1 =
      ({6, 10, 15} : Finset ℕ) := by decide
  rw [heq] at h
  exact h

theorem image2 : Extended.Bound ({8, 12, 24} : Finset ℕ) 1 := by
  have h := ArchiveScaling.bound_image
    (U := (ArchiveSmallPrefix.nodes 0).support) (m := 4) (d := 1) (r := 1)
    (by decide) (by decide) (by intro x hx; exact one_dvd _)
    (ArchiveSmallPrefix.sound 0 (by decide))
  have heq : ArchiveScaling.image (ArchiveSmallPrefix.nodes 0).support 4 1 =
      ({8, 12, 24} : Finset ℕ) := by decide
  rw [heq] at h
  exact h

/-- The archived dual is checked, and its rows follow from the image bounds. -/
theorem bound4 : Extended.Bound ArchiveCase4.target ArchiveCase4.demand := by
  intro S hS
  let C := S ∩ ArchiveCase4.target
  have hC : UpperBridge.OrderedCover ArchiveCase4.target C := Extended.cover_inter hS
  have rows : ∀ c ∈ ArchiveCase4.rows, BankCase.Row c.1 c.2 C := by
    intro c hc
    simp only [ArchiveCase4.rows, List.mem_cons, List.mem_singleton] at hc
    rcases hc with rfl | rfl | rfl
    · have h := image0 (C ∩ ({4, 5, 20} : Finset ℕ))
          (Extended.cover_inter (Extended.cover_mono (by decide) hC))
      simpa [BankCase.Row] using h
    · have h := image1 (C ∩ ({6, 10, 15} : Finset ℕ))
          (Extended.cover_inter (Extended.cover_mono (by decide) hC))
      simpa [BankCase.Row] using h
    · have h := image2 (C ∩ ({8, 12, 24} : Finset ℕ))
          (Extended.cover_inter (Extended.cover_mono (by decide) hC))
      simpa [BankCase.Row] using h
  by_contra hn
  have hsmall : (C.card : ℤ) ≤ (ArchiveCase4.demand : ℤ) - 1 := by
    have hcard : C.card ≤ S.card := Finset.card_le_card Finset.inter_subset_left
    omega
  have hs : BankCase.State ArchiveCase4.target ∅ ∅ C := by
    simp [BankCase.State, C]
  exact BankCase.check_sound ArchiveCase4.rows ArchiveCase4.target ∅ ∅ C
    ArchiveCase4.demand ArchiveCase4.tree ArchiveCase4.check_valid hs hsmall rows

/-- The semantic prefix has five nodes; the first four remain DAG checked. -/
def support (i : ℕ) : Finset ℕ :=
  if i = 4 then ArchiveCase4.target else (ArchiveSmallPrefix.nodes i).support

def demand (i : ℕ) : ℕ :=
  if i = 4 then ArchiveCase4.demand else (ArchiveSmallPrefix.nodes i).demand

theorem sound : ∀ i < 5, Extended.Bound (support i) (demand i) := by
  intro i hi
  by_cases h : i = 4
  · subst i; simpa [support, demand] using bound4
  · have hi4 : i < 4 := by omega
    simpa [support, demand, h] using ArchiveSmallPrefix.sound i hi4

#print axioms image0
#print axioms image1
#print axioms image2
#print axioms bound4
#print axioms sound
end ArchiveCase4Staged
