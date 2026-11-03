import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity062
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1128, 1131, 1134, 1140, 1144, 1147, 1148, 1150, 1152, 1155}
theorem vertex1128 : load 1128 ≤ 1001 := by decide
#print axioms vertex1128
theorem vertex1131 : load 1131 ≤ 1001 := by decide
#print axioms vertex1131
theorem vertex1134 : load 1134 ≤ 1001 := by decide
#print axioms vertex1134
theorem vertex1140 : load 1140 ≤ 1001 := by decide
#print axioms vertex1140
theorem vertex1144 : load 1144 ≤ 1001 := by decide
#print axioms vertex1144
theorem vertex1147 : load 1147 ≤ 1001 := by decide
#print axioms vertex1147
theorem vertex1148 : load 1148 ≤ 1001 := by decide
#print axioms vertex1148
theorem vertex1150 : load 1150 ≤ 1001 := by decide
#print axioms vertex1150
theorem vertex1152 : load 1152 ≤ 1001 := by decide
#print axioms vertex1152
theorem vertex1155 : load 1155 ≤ 1001 := by decide
#print axioms vertex1155
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1128
  · exact vertex1131
  · exact vertex1134
  · exact vertex1140
  · exact vertex1144
  · exact vertex1147
  · exact vertex1148
  · exact vertex1150
  · exact vertex1152
  · exact vertex1155
#print axioms capacity
end Node1209Capacity062
