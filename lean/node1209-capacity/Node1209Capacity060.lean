import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity060
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1080, 1081, 1085, 1088, 1089, 1092, 1098, 1100, 1102, 1104}
theorem vertex1080 : load 1080 ≤ 1001 := by decide
#print axioms vertex1080
theorem vertex1081 : load 1081 ≤ 1001 := by decide
#print axioms vertex1081
theorem vertex1085 : load 1085 ≤ 1001 := by decide
#print axioms vertex1085
theorem vertex1088 : load 1088 ≤ 1001 := by decide
#print axioms vertex1088
theorem vertex1089 : load 1089 ≤ 1001 := by decide
#print axioms vertex1089
theorem vertex1092 : load 1092 ≤ 1001 := by decide
#print axioms vertex1092
theorem vertex1098 : load 1098 ≤ 1001 := by decide
#print axioms vertex1098
theorem vertex1100 : load 1100 ≤ 1001 := by decide
#print axioms vertex1100
theorem vertex1102 : load 1102 ≤ 1001 := by decide
#print axioms vertex1102
theorem vertex1104 : load 1104 ≤ 1001 := by decide
#print axioms vertex1104
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1080
  · exact vertex1081
  · exact vertex1085
  · exact vertex1088
  · exact vertex1089
  · exact vertex1092
  · exact vertex1098
  · exact vertex1100
  · exact vertex1102
  · exact vertex1104
#print axioms capacity
end Node1209Capacity060
