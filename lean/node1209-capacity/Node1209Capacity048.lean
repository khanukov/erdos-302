import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity048
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {792, 795, 798, 799, 800, 804, 805, 806, 810, 812}
theorem vertex792 : load 792 ≤ 1001 := by decide
#print axioms vertex792
theorem vertex795 : load 795 ≤ 1001 := by decide
#print axioms vertex795
theorem vertex798 : load 798 ≤ 1001 := by decide
#print axioms vertex798
theorem vertex799 : load 799 ≤ 1001 := by decide
#print axioms vertex799
theorem vertex800 : load 800 ≤ 1001 := by decide
#print axioms vertex800
theorem vertex804 : load 804 ≤ 1001 := by decide
#print axioms vertex804
theorem vertex805 : load 805 ≤ 1001 := by decide
#print axioms vertex805
theorem vertex806 : load 806 ≤ 1001 := by decide
#print axioms vertex806
theorem vertex810 : load 810 ≤ 1001 := by decide
#print axioms vertex810
theorem vertex812 : load 812 ≤ 1001 := by decide
#print axioms vertex812
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex792
  · exact vertex795
  · exact vertex798
  · exact vertex799
  · exact vertex800
  · exact vertex804
  · exact vertex805
  · exact vertex806
  · exact vertex810
  · exact vertex812
#print axioms capacity
end Node1209Capacity048
