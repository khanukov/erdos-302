import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity065
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1210, 1215, 1216, 1218, 1219, 1220, 1221, 1222, 1224, 1225}
theorem vertex1210 : load 1210 ≤ 1001 := by decide
#print axioms vertex1210
theorem vertex1215 : load 1215 ≤ 1001 := by decide
#print axioms vertex1215
theorem vertex1216 : load 1216 ≤ 1001 := by decide
#print axioms vertex1216
theorem vertex1218 : load 1218 ≤ 1001 := by decide
#print axioms vertex1218
theorem vertex1219 : load 1219 ≤ 1001 := by decide
#print axioms vertex1219
theorem vertex1220 : load 1220 ≤ 1001 := by decide
#print axioms vertex1220
theorem vertex1221 : load 1221 ≤ 1001 := by decide
#print axioms vertex1221
theorem vertex1222 : load 1222 ≤ 1001 := by decide
#print axioms vertex1222
theorem vertex1224 : load 1224 ≤ 1001 := by decide
#print axioms vertex1224
theorem vertex1225 : load 1225 ≤ 1001 := by decide
#print axioms vertex1225
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1210
  · exact vertex1215
  · exact vertex1216
  · exact vertex1218
  · exact vertex1219
  · exact vertex1220
  · exact vertex1221
  · exact vertex1222
  · exact vertex1224
  · exact vertex1225
#print axioms capacity
end Node1209Capacity065
