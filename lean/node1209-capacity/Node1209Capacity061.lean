import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity061
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1105, 1107, 1110, 1113, 1116, 1118, 1120, 1122, 1125, 1127}
theorem vertex1105 : load 1105 ≤ 1001 := by decide
#print axioms vertex1105
theorem vertex1107 : load 1107 ≤ 1001 := by decide
#print axioms vertex1107
theorem vertex1110 : load 1110 ≤ 1001 := by decide
#print axioms vertex1110
theorem vertex1113 : load 1113 ≤ 1001 := by decide
#print axioms vertex1113
theorem vertex1116 : load 1116 ≤ 1001 := by decide
#print axioms vertex1116
theorem vertex1118 : load 1118 ≤ 1001 := by decide
#print axioms vertex1118
theorem vertex1120 : load 1120 ≤ 1001 := by decide
#print axioms vertex1120
theorem vertex1122 : load 1122 ≤ 1001 := by decide
#print axioms vertex1122
theorem vertex1125 : load 1125 ≤ 1001 := by decide
#print axioms vertex1125
theorem vertex1127 : load 1127 ≤ 1001 := by decide
#print axioms vertex1127
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1105
  · exact vertex1107
  · exact vertex1110
  · exact vertex1113
  · exact vertex1116
  · exact vertex1118
  · exact vertex1120
  · exact vertex1122
  · exact vertex1125
  · exact vertex1127
#print axioms capacity
end Node1209Capacity061
