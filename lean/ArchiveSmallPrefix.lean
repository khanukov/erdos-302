import BankProfile

/- Generated from pinned bank bytes by archive_prefix.py. Python transcription,
   including parsing and normalization, is not proved inside Lean. -/
namespace ArchiveSmallPrefix

def nodes : ℕ → ArchiveDag.Node
  | 0 => ⟨{2, 3, 6}, 1, .small⟩
  | 1 => ⟨{2, 3, 4, 6, 12}, 2, .small⟩
  | 2 => ⟨{4, 5, 20}, 1, .small⟩
  | 3 => ⟨{6, 10, 15}, 1, .small⟩
  | _ => ⟨∅, 0, .small⟩

theorem valid : ∀ i < 4, ArchiveDag.Check nodes i := by
  intro i hi
  interval_cases i <;> decide

theorem sound : ∀ i < 4,
    Extended.Bound (nodes i).support (nodes i).demand :=
  ArchiveDag.sound nodes 4 valid

#print axioms valid
#print axioms sound
end ArchiveSmallPrefix
