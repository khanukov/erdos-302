import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity063
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1160, 1161, 1166, 1170, 1173, 1175, 1176, 1178, 1180, 1183}
theorem vertex1160 : load 1160 ≤ 1001 := by decide
#print axioms vertex1160
theorem vertex1161 : load 1161 ≤ 1001 := by decide
#print axioms vertex1161
theorem vertex1166 : load 1166 ≤ 1001 := by decide
#print axioms vertex1166
theorem vertex1170 : load 1170 ≤ 1001 := by decide
#print axioms vertex1170
theorem vertex1173 : load 1173 ≤ 1001 := by decide
#print axioms vertex1173
theorem vertex1175 : load 1175 ≤ 1001 := by decide
#print axioms vertex1175
theorem vertex1176 : load 1176 ≤ 1001 := by decide
#print axioms vertex1176
theorem vertex1178 : load 1178 ≤ 1001 := by decide
#print axioms vertex1178
theorem vertex1180 : load 1180 ≤ 1001 := by decide
#print axioms vertex1180
theorem vertex1183 : load 1183 ≤ 1001 := by decide
#print axioms vertex1183
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1160
  · exact vertex1161
  · exact vertex1166
  · exact vertex1170
  · exact vertex1173
  · exact vertex1175
  · exact vertex1176
  · exact vertex1178
  · exact vertex1180
  · exact vertex1183
#print axioms capacity
end Node1209Capacity063
