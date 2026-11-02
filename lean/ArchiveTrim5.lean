import ArchiveCase4Staged
set_option maxRecDepth 8192
set_option maxHeartbeats 0

/- Generated from archive node 5. Correspondence with archive bytes is checked
   externally by trim5.py, not proved in Lean. -/
namespace ArchiveTrim5
open UpperBridge

def target : Finset ℕ := {2, 3, 4, 5, 6, 8, 10, 12, 15, 20, 24}
def demand : ℕ := 3
def imageRef : ℕ × ℕ × ℕ × ℕ := (3, 4, 1, 1)

/-- The complete edge predicate, not a selected edge list, determines trimming. -/
theorem all_edges_retained :
    ∀ a ∈ ArchiveCase4.target, ∀ b ∈ ArchiveCase4.target,
      ∀ c ∈ ArchiveCase4.target, OrderedEdge ArchiveCase4.target a b c →
        a ∈ target ∧ b ∈ target ∧ c ∈ target := by
  decide

theorem target_subset : target ⊆ ArchiveCase4.target := by decide

-- Each retained vertex has a concrete edge witness (the converse is above).
def edgeWitnesses : List (ℕ × ℕ × ℕ) :=
  [(2,3,6), (3,4,12), (4,5,20), (4,6,12), (6,8,24), (6,10,15), (8,12,24)]

theorem witnesses_valid : ∀ e ∈ edgeWitnesses,
    OrderedEdge ArchiveCase4.target e.1 e.2.1 e.2.2 := by decide

theorem every_retained_has_witness : ∀ v ∈ target, ∃ e ∈ edgeWitnesses,
    v = e.1 ∨ v = e.2.1 ∨ v = e.2.2 := by decide

/-- A reusable isolated-vertex rule; no edge enumeration is assumed complete. -/
theorem isolated_trim {U V : Finset ℕ} {r : ℕ} (hVU : V ⊆ U)
    (hkeep : ∀ a b c, OrderedEdge U a b c → a ∈ V ∧ b ∈ V ∧ c ∈ V)
    (upstream : Extended.Bound U r) : Extended.Bound V r :=
  Extended.trim_bound hVU hkeep upstream

/-- The image referenced by node 5 has exactly the node 4 support. -/
theorem image3_eq : ArchiveScaling.image ArchiveCase4.target 1 1 = ArchiveCase4.target := by
  decide

theorem image3_bound : Extended.Bound (ArchiveScaling.image ArchiveCase4.target 1 1)
    ArchiveCase4.demand := by
  rw [image3_eq]
  exact ArchiveCase4Staged.bound4

/-- Node 5 depends only on the preceding verified semantic node, not an arbitrary bound. -/
theorem bound5 : Extended.Bound target demand := by
  apply isolated_trim target_subset
  · intro a b c he
    exact all_edges_retained a he.1 b he.2.1 c he.2.2.1 he
  · have h := image3_bound
    rw [image3_eq] at h
    simpa [demand, ArchiveCase4.demand] using h

def support (i : ℕ) : Finset ℕ :=
  if i = 5 then target else ArchiveCase4Staged.support i

def nodeDemand (i : ℕ) : ℕ :=
  if i = 5 then demand else ArchiveCase4Staged.demand i

theorem sound : ∀ i < 6, Extended.Bound (support i) (nodeDemand i) := by
  intro i hi
  by_cases h : i = 5
  · subst i; simpa [support, nodeDemand] using bound5
  · have hi5 : i < 5 := by omega
    simpa [support, nodeDemand, h] using ArchiveCase4Staged.sound i hi5

#print axioms all_edges_retained
#print axioms isolated_trim
#print axioms image3_eq
#print axioms image3_bound
#print axioms bound5
#print axioms sound
end ArchiveTrim5
