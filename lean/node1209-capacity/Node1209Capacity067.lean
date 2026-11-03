import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity067
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1258, 1260, 1265, 1269, 1271, 1272, 1274, 1275, 1276, 1278}
theorem vertex1258 : load 1258 ≤ 1001 := by decide
#print axioms vertex1258
theorem vertex1260 : load 1260 ≤ 1001 := by decide
#print axioms vertex1260
theorem vertex1265 : load 1265 ≤ 1001 := by decide
#print axioms vertex1265
theorem vertex1269 : load 1269 ≤ 1001 := by decide
#print axioms vertex1269
theorem vertex1271 : load 1271 ≤ 1001 := by decide
#print axioms vertex1271
theorem vertex1272 : load 1272 ≤ 1001 := by decide
#print axioms vertex1272
theorem vertex1274 : load 1274 ≤ 1001 := by decide
#print axioms vertex1274
theorem vertex1275 : load 1275 ≤ 1001 := by decide
#print axioms vertex1275
theorem vertex1276 : load 1276 ≤ 1001 := by decide
#print axioms vertex1276
theorem vertex1278 : load 1278 ≤ 1001 := by decide
#print axioms vertex1278
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1258
  · exact vertex1260
  · exact vertex1265
  · exact vertex1269
  · exact vertex1271
  · exact vertex1272
  · exact vertex1274
  · exact vertex1275
  · exact vertex1276
  · exact vertex1278
#print axioms capacity
end Node1209Capacity067
