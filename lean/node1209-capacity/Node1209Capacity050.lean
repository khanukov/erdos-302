import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity050
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {837, 840, 845, 846, 847, 850, 851, 852, 855, 858}
theorem vertex837 : load 837 ≤ 1001 := by decide
#print axioms vertex837
theorem vertex840 : load 840 ≤ 1001 := by decide
#print axioms vertex840
theorem vertex845 : load 845 ≤ 1001 := by decide
#print axioms vertex845
theorem vertex846 : load 846 ≤ 1001 := by decide
#print axioms vertex846
theorem vertex847 : load 847 ≤ 1001 := by decide
#print axioms vertex847
theorem vertex850 : load 850 ≤ 1001 := by decide
#print axioms vertex850
theorem vertex851 : load 851 ≤ 1001 := by decide
#print axioms vertex851
theorem vertex852 : load 852 ≤ 1001 := by decide
#print axioms vertex852
theorem vertex855 : load 855 ≤ 1001 := by decide
#print axioms vertex855
theorem vertex858 : load 858 ≤ 1001 := by decide
#print axioms vertex858
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex837
  · exact vertex840
  · exact vertex845
  · exact vertex846
  · exact vertex847
  · exact vertex850
  · exact vertex851
  · exact vertex852
  · exact vertex855
  · exact vertex858
#print axioms capacity
end Node1209Capacity050
