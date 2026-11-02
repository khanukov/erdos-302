import ArchiveCase7Staged
set_option maxRecDepth 8192
set_option maxHeartbeats 0

/- Generated from pinned archive node 8; byte correspondence is checked externally. -/
namespace ArchiveTrim8
open UpperBridge

def target : Finset ℕ := {2, 3, 4, 5, 6, 8, 10, 12, 15, 20, 21, 24, 28, 30}
def demand : ℕ := 4
def imageRef : ℕ × ℕ × ℕ × ℕ := (7, 7, 1, 1)

theorem all_edges_retained :
    ∀ a ∈ ArchiveCase7.target, ∀ b ∈ ArchiveCase7.target,
      ∀ c ∈ ArchiveCase7.target, OrderedEdge ArchiveCase7.target a b c →
        a ∈ target ∧ b ∈ target ∧ c ∈ target := by
  unfold OrderedEdge
  decide

theorem target_subset : target ⊆ ArchiveCase7.target := by decide

def edgeWitnesses : List (ℕ × ℕ × ℕ) :=
  [(2,3,6), (3,4,12), (4,5,20), (4,6,12), (5,6,30),
   (6,8,24), (6,10,15), (8,12,24), (10,15,30), (12,20,30), (12,21,28)]

theorem witnesses_valid : ∀ e ∈ edgeWitnesses,
    OrderedEdge ArchiveCase7.target e.1 e.2.1 e.2.2 := by
  unfold OrderedEdge
  decide

theorem every_retained_has_witness : ∀ v ∈ target, ∃ e ∈ edgeWitnesses,
    v = e.1 ∨ v = e.2.1 ∨ v = e.2.2 := by decide

theorem image7_eq : ArchiveScaling.image ArchiveCase7.target 1 1 = ArchiveCase7.target := by
  decide

theorem image7_bound : Extended.Bound (ArchiveScaling.image ArchiveCase7.target 1 1)
    ArchiveCase7.demand := by
  rw [image7_eq]
  exact ArchiveCase7Staged.bound7

theorem bound8 : Extended.Bound target demand := by
  apply Extended.trim_bound target_subset
  · intro a b c he
    exact all_edges_retained a he.1 b he.2.1 c he.2.2.1 he
  · have h := image7_bound
    rw [image7_eq] at h
    simpa [demand, ArchiveCase7.demand] using h

#print axioms all_edges_retained
#print axioms target_subset
#print axioms witnesses_valid
#print axioms every_retained_has_witness
#print axioms image7_eq
#print axioms image7_bound
#print axioms bound8
end ArchiveTrim8
