import ArchiveRenewalJointCandidate

open ArchiveRenewalJointCandidate

-- Real level-one literal data: first cell begins at six, and ends at 24.
example : cellCorrection ⟨2, ArchiveLedger.cells1⟩ 5 = 0 := by decide +kernel
example : cellCorrection ⟨2, ArchiveLedger.cells1⟩ 6 = 1 := by decide +kernel
example : cellCorrection ⟨2, ArchiveLedger.cells1⟩ 24 = 0 := by decide +kernel

-- Multiplicity is intentional, including coincident occurrences.
example : cellCorrection ⟨2, [⟨1, 4, 2⟩, ⟨1, 4, 2⟩]⟩ 3 = 4 := by decide
example : cellCorrection ⟨2, [⟨1, 4, 2⟩]⟩ 4 = 0 := by decide

-- The max identity does not require the finite correction check.
example (parent old seed : ℕ → ℕ) :
    profile 2 10 parent old seed 1 =
      max (max (max (parent 1 + profile 2 10 parent old seed (1 / 2))
        (profile 2 10 parent old seed (1 - 1))) (old 1)) (seed 1) := by
  exact profile_max_update 2 10 parent old seed (by decide) (by decide) (by decide)
