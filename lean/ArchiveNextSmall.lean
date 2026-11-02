import ArchiveTrim5

/- Generated from pinned archive data; Python transcription is external to Lean. -/
namespace ArchiveNextSmall

def nodes : ℕ → ArchiveDag.Node
  | 6 => ⟨{12, 21, 28}, 1, .small⟩
  | _ => ⟨∅, 0, .small⟩

theorem bound6 : Extended.Bound (nodes 6).support (nodes 6).demand :=
  ArchiveDag.small_sound (by unfold ArchiveDag.SmallCheck UpperBridge.OrderedEdge nodes; decide)

def support (i : ℕ) : Finset ℕ :=
  if i < 6 then ArchiveTrim5.support i else (nodes i).support

def demand (i : ℕ) : ℕ :=
  if i < 6 then ArchiveTrim5.nodeDemand i else (nodes i).demand

theorem sound : ∀ i < 7, Extended.Bound (support i) (demand i) := by
  intro i hi
  by_cases h : i < 6
  · simpa [support, demand, h] using ArchiveTrim5.sound i h
  · have hlo : 6 ≤ i := by omega
    interval_cases i
    · simpa [support, demand] using bound6

#print axioms bound6
#print axioms sound
end ArchiveNextSmall
