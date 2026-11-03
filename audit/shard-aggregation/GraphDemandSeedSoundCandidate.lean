import BankProfileTests
import SeedMaxFirstCellCandidate

/-! CI candidate: soundness of a finite maximum of checked archived-node
seeds.  The ambient vertex set is supplied explicitly; its only required
property is that it contains the Q-smooth vertices at or below n.  This says
nothing about correspondence between external archive bytes and Lean data.
-/
namespace GraphDemandSeedSoundCandidate
open Finset UpperBridge
open scoped Classical

noncomputable def prefix (S Q : Finset ℕ) (n : ℕ) : Finset ℕ :=
  (S.filter (UpperProjection.Smooth Q)).filter (fun x => x ≤ n)

noncomputable def outside (S Q : Finset ℕ) : Finset ℕ :=
  S.filter (fun x => ¬ UpperProjection.Smooth Q x ∧ x % 2 = 0)

noncomputable def nodeSeed (nodes : ℕ → ArchiveDag.Node) (Q : Finset ℕ)
    (n i : ℕ) : ℕ :=
  let S := (nodes i).support
  if n ∈ S ∧ UpperProjection.Smooth Q n then
    (nodes i).demand - (outside S Q).card -
      ((S.filter (UpperProjection.Smooth Q)) \ prefix S Q n).card
  else 0

noncomputable def seedMax (nodes : ℕ → ArchiveDag.Node) (count : ℕ)
    (Q : Finset ℕ) (n : ℕ) : ℕ :=
  (Finset.range count).sup (nodeSeed nodes Q n)

/-- Each component of the maximum is a graph-demand bound, not an assumed
numerical inequality.  Covers of W restrict to the filtered node support. -/
theorem checked_node_le_cover (nodes : ℕ → ArchiveDag.Node) (count i : ℕ)
    (valid : ∀ j < count, ArchiveDag.Check nodes j) (hi : i < count)
    (Q : Finset ℕ) (n : ℕ) (W C : Finset ℕ)
    (embed : ∀ x, UpperProjection.Smooth Q x → x ≤ n → x ∈ W)
    (cover : OrderedCover W C) : nodeSeed nodes Q n i ≤ C.card := by
  classical
  by_cases gate : n ∈ (nodes i).support ∧ UpperProjection.Smooth Q n
  · have hp : prefix (nodes i).support Q n ⊆ W := by
      intro x hx
      simp only [prefix, Finset.mem_filter] at hx
      exact embed x hx.1.2 hx.2
    have hb := BankProfile.checked_node_seed nodes count i valid hi Q n
    have hc : OrderedCover (prefix (nodes i).support Q n) C :=
      Extended.cover_mono hp cover
    have h := hb C hc
    simpa [nodeSeed, gate, prefix, outside] using h
  · simp [nodeSeed, gate]

/-- A finite max is sound for every cover of the ambient smooth prefix. -/
theorem seedMax_bound (nodes : ℕ → ArchiveDag.Node) (count : ℕ)
    (valid : ∀ i < count, ArchiveDag.Check nodes i)
    (Q : Finset ℕ) (n : ℕ) (W : Finset ℕ)
    (embed : ∀ x, UpperProjection.Smooth Q x → x ≤ n → x ∈ W) :
    Extended.Bound W (seedMax nodes count Q n) := by
  classical
  intro C cover
  apply Finset.sup_le
  intro i hi
  exact checked_node_le_cover nodes count i valid (Finset.mem_range.mp hi)
    Q n W C embed cover

/-- The literal pinned node zero supplies a positive maximum at the first
positive point.  The factor condition is explicit and independently proved. -/
theorem first_cell_positive :
    seedMax ArchiveSeedNode0.nodes 1 {2, 3} 6 = 1 := by
  classical
  have smooth_div {x : ℕ} (hx : x ∣ 6) :
      UpperProjection.Smooth ({2, 3} : Finset ℕ) x := by
    intro p hp hpx
    have hp6 : p ∣ 6 := dvd_trans hpx hx
    have hle : p ≤ 6 := Nat.le_of_dvd (by decide) hp6
    interval_cases p <;> norm_num at *
  have h2 : UpperProjection.Smooth ({2, 3} : Finset ℕ) 2 := smooth_div (by decide)
  have h3 : UpperProjection.Smooth ({2, 3} : Finset ℕ) 3 := smooth_div (by decide)
  have h6 : UpperProjection.Smooth ({2, 3} : Finset ℕ) 6 := smooth_div (by decide)
  have hs : ({2, 3, 6} : Finset ℕ).filter (UpperProjection.Smooth {2, 3}) = {2, 3, 6} := by
    ext x
    simp only [Finset.mem_filter, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · exact fun h => h.1
    · rintro (rfl | rfl | rfl) <;> simp [h2, h3, h6]
  have hu : outside ({2, 3, 6} : Finset ℕ) {2, 3} = ∅ := by
    ext x
    simp only [outside, Finset.mem_filter, Finset.mem_insert, Finset.mem_singleton, Finset.not_mem_empty, iff_false]
    rintro ⟨(rfl | rfl | rfl), hn, _⟩
    · exact hn h2
    · exact hn h3
    · exact hn h6
  have hp : ({2, 3, 6} : Finset ℕ).filter (fun x => x ≤ 6) = {2, 3, 6} := by decide
  simp [seedMax, nodeSeed, ArchiveSeedNode0.nodes, h6, hs, hu, prefix, hp]

/-- Concrete checked archived node, generic ambient set: no demand or cover
bound is assumed.  This is the nonzero graph-demand claim at n = 6. -/
theorem first_cell_bound (W : Finset ℕ)
    (embed : ∀ x, UpperProjection.Smooth ({2, 3} : Finset ℕ) x → x ≤ 6 → x ∈ W) :
    Extended.Bound W 1 := by
  have h := seedMax_bound ArchiveSeedNode0.nodes 1 BankProfileConcrete.valid {2, 3} 6 W embed
  rw [first_cell_positive] at h
  exact h

/-- At n=6 the 32-node table's computed maximum is exactly the positive
checked-node bound above.  This special-point bridge does not claim that the
boolean table implements semantic smoothness at every other point. -/
theorem archived_first_cell_bound (W : Finset ℕ)
    (embed : ∀ x, UpperProjection.Smooth ({2, 3} : Finset ℕ) x → x ≤ 6 → x ∈ W) :
    Extended.Bound W (SeedMaxFirstCellCandidate.seed 6) := by
  rw [SeedMaxFirstCellCandidate.first_seed.2]
  exact first_cell_bound W embed

#print axioms archived_first_cell_bound
#print axioms seedMax_bound
#print axioms first_cell_positive
#print axioms first_cell_bound
end GraphDemandSeedSoundCandidate
