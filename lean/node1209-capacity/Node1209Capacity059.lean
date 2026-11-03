import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity059
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1056, 1060, 1062, 1064, 1065, 1066, 1071, 1073, 1075, 1078}
theorem vertex1056 : load 1056 ≤ 1001 := by decide
#print axioms vertex1056
theorem vertex1060 : load 1060 ≤ 1001 := by decide
#print axioms vertex1060
theorem vertex1062 : load 1062 ≤ 1001 := by decide
#print axioms vertex1062
theorem vertex1064 : load 1064 ≤ 1001 := by decide
#print axioms vertex1064
theorem vertex1065 : load 1065 ≤ 1001 := by decide
#print axioms vertex1065
theorem vertex1066 : load 1066 ≤ 1001 := by decide
#print axioms vertex1066
theorem vertex1071 : load 1071 ≤ 1001 := by decide
#print axioms vertex1071
theorem vertex1073 : load 1073 ≤ 1001 := by decide
#print axioms vertex1073
theorem vertex1075 : load 1075 ≤ 1001 := by decide
#print axioms vertex1075
theorem vertex1078 : load 1078 ≤ 1001 := by decide
#print axioms vertex1078
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1056
  · exact vertex1060
  · exact vertex1062
  · exact vertex1064
  · exact vertex1065
  · exact vertex1066
  · exact vertex1071
  · exact vertex1073
  · exact vertex1075
  · exact vertex1078
#print axioms capacity
end Node1209Capacity059
