import ArchiveCase4
import Extended
import Scaling

/-! A semantic proof of the displayed case-4 data.  This proves the literal
Lean support, not a correspondence between it and external archive bytes. -/
namespace ArchiveCase4Semantic

-- These are unconditional bounds for the three source nodes in the display.
theorem source0 : Extended.Bound ({2, 3, 6} : Finset ℕ) 1 := Extended.edge_0
theorem source2 : Extended.Bound ({4, 5, 20} : Finset ℕ) 1 := Extended.edge_2
theorem source3 : Extended.Bound ({6, 10, 15} : Finset ℕ) 1 := Extended.edge_3

-- The third row is the exact 4/1 image of source 0, not an assumed row bound.
theorem scaled_source0_image :
    ArchiveScaling.image ({2, 3, 6} : Finset ℕ) 4 1 = {8, 12, 24} := by
  decide

theorem scaled_source0 : Extended.Bound ({8, 12, 24} : Finset ℕ) 1 := by
  have hsource : ArchiveScaling.Bound ({2, 3, 6} : Finset ℕ) 1 := source0
  have h := ArchiveScaling.bound_image (U := ({2, 3, 6} : Finset ℕ))
    (m := 4) (d := 1) (r := 1) (by decide) (by decide)
    (by intro x hx; exact one_dvd _) hsource
  rw [scaled_source0_image] at h
  exact h

-- The support is exactly the one displayed in the generated case, including
-- all vertices not used by this disjoint packing.
theorem target_bound : Extended.Bound ArchiveCase4.target ArchiveCase4.demand := by
  unfold ArchiveCase4.target ArchiveCase4.demand
  apply Extended.bound_mono
    (U := (({4, 5, 20} : Finset ℕ) ∪ {6, 10, 15}) ∪ {8, 12, 24})
  · decide
  · apply Extended.pack (r := 2) (s := 1)
    · decide
    · exact Extended.pack (by decide) source2 source3
    · exact scaled_source0

-- Exact-statement and literal-data checks, independent of the generated tree.
example : Extended.Bound
    ({2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 15, 16, 20, 21, 24} : Finset ℕ) 3 :=
  target_bound
example : ArchiveCase4.imageRefs = [(0, 2, 1, 1), (1, 3, 1, 1), (2, 0, 4, 1)] := rfl
example : ArchiveCase4.rows =
    [({4, 5, 20}, (1 : ℤ)), ({6, 10, 15}, (1 : ℤ)),
     ({8, 12, 24}, (1 : ℤ))] := rfl

#print axioms source0
#print axioms source2
#print axioms source3
#print axioms scaled_source0_image
#print axioms scaled_source0
#print axioms target_bound
end ArchiveCase4Semantic
