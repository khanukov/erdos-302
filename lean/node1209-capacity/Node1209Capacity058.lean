import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity058
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1032, 1034, 1035, 1036, 1040, 1044, 1045, 1050, 1053, 1054}
theorem vertex1032 : load 1032 ≤ 1001 := by decide
#print axioms vertex1032
theorem vertex1034 : load 1034 ≤ 1001 := by decide
#print axioms vertex1034
theorem vertex1035 : load 1035 ≤ 1001 := by decide
#print axioms vertex1035
theorem vertex1036 : load 1036 ≤ 1001 := by decide
#print axioms vertex1036
theorem vertex1040 : load 1040 ≤ 1001 := by decide
#print axioms vertex1040
theorem vertex1044 : load 1044 ≤ 1001 := by decide
#print axioms vertex1044
theorem vertex1045 : load 1045 ≤ 1001 := by decide
#print axioms vertex1045
theorem vertex1050 : load 1050 ≤ 1001 := by decide
#print axioms vertex1050
theorem vertex1053 : load 1053 ≤ 1001 := by decide
#print axioms vertex1053
theorem vertex1054 : load 1054 ≤ 1001 := by decide
#print axioms vertex1054
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1032
  · exact vertex1034
  · exact vertex1035
  · exact vertex1036
  · exact vertex1040
  · exact vertex1044
  · exact vertex1045
  · exact vertex1050
  · exact vertex1053
  · exact vertex1054
#print axioms capacity
end Node1209Capacity058
