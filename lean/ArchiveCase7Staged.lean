import ArchiveSmallPrefix
import ArchiveCase7

/-! Candidate semantic replay. The generated data is checked by Lean, but the
archive-to-data transcription is guarded externally, not proved in Lean. -/
namespace ArchiveCase7Staged

theorem image0 : Extended.Bound ({2, 3, 6} : Finset ℕ) 1 := by
  simpa [ArchiveSmallPrefix.nodes] using ArchiveSmallPrefix.sound 0 (by decide)

theorem image1 : Extended.Bound ({4, 5, 20} : Finset ℕ) 1 := by
  simpa [ArchiveSmallPrefix.nodes] using ArchiveSmallPrefix.sound 2 (by decide)

theorem image2 : Extended.Bound ({10, 15, 30} : Finset ℕ) 1 := by
  have h := ArchiveScaling.bound_image
    (U := (ArchiveSmallPrefix.nodes 0).support) (m := 5) (d := 1) (r := 1)
    (by decide) (by decide) (by intro x hx; exact one_dvd _)
    (ArchiveSmallPrefix.sound 0 (by decide))
  have heq : ArchiveScaling.image (ArchiveSmallPrefix.nodes 0).support 5 1 =
      ({10, 15, 30} : Finset ℕ) := by decide
  rw [heq] at h
  exact h

-- Node 6 is itself a single ordered edge, not a hypothesis on node 7.
theorem image3 : Extended.Bound ({12, 21, 28} : Finset ℕ) 1 := by
  apply Extended.edge_bound
  norm_num [UpperBridge.OrderedEdge]

theorem bound7 : Extended.Bound ArchiveCase7.target ArchiveCase7.demand := by
  intro S hS
  let C := S ∩ ArchiveCase7.target
  have hC : UpperBridge.OrderedCover ArchiveCase7.target C := Extended.cover_inter hS
  have rows : ∀ c ∈ ArchiveCase7.rows, BankCase.Row c.1 c.2 C := by
    intro c hc
    simp only [ArchiveCase7.rows, List.mem_cons, List.not_mem_nil, or_false] at hc
    rcases hc with rfl | rfl | rfl | rfl
    · have h := image0 (C ∩ ({2, 3, 6} : Finset ℕ))
          (Extended.cover_inter (Extended.cover_mono (by decide) hC))
      simpa [BankCase.Row] using h
    · have h := image1 (C ∩ ({4, 5, 20} : Finset ℕ))
          (Extended.cover_inter (Extended.cover_mono (by decide) hC))
      simpa [BankCase.Row] using h
    · have h := image2 (C ∩ ({10, 15, 30} : Finset ℕ))
          (Extended.cover_inter (Extended.cover_mono (by decide) hC))
      simpa [BankCase.Row] using h
    · have h := image3 (C ∩ ({12, 21, 28} : Finset ℕ))
          (Extended.cover_inter (Extended.cover_mono (by decide) hC))
      simpa [BankCase.Row] using h
  by_contra hn
  have hsmall : (C.card : ℤ) ≤ (ArchiveCase7.demand : ℤ) - 1 := by
    have hcard : C.card ≤ S.card := Finset.card_le_card Finset.inter_subset_left
    omega
  have hs : BankCase.State ArchiveCase7.target ∅ ∅ C := by
    simp [BankCase.State, C]
  exact BankCase.check_sound ArchiveCase7.rows ArchiveCase7.target ∅ ∅ C
    ArchiveCase7.demand ArchiveCase7.tree ArchiveCase7.check_valid hs hsmall rows

#print axioms image0
#print axioms image1
#print axioms image2
#print axioms image3
#print axioms bound7
end ArchiveCase7Staged
