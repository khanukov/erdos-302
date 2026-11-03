import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity069
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1305, 1309, 1311, 1312, 1316, 1320, 1323, 1325, 1326, 1330}
theorem vertex1305 : load 1305 ≤ 1001 := by decide
#print axioms vertex1305
theorem vertex1309 : load 1309 ≤ 1001 := by decide
#print axioms vertex1309
theorem vertex1311 : load 1311 ≤ 1001 := by decide
#print axioms vertex1311
theorem vertex1312 : load 1312 ≤ 1001 := by decide
#print axioms vertex1312
theorem vertex1316 : load 1316 ≤ 1001 := by decide
#print axioms vertex1316
theorem vertex1320 : load 1320 ≤ 1001 := by decide
#print axioms vertex1320
theorem vertex1323 : load 1323 ≤ 1001 := by decide
#print axioms vertex1323
theorem vertex1325 : load 1325 ≤ 1001 := by decide
#print axioms vertex1325
theorem vertex1326 : load 1326 ≤ 1001 := by decide
#print axioms vertex1326
theorem vertex1330 : load 1330 ≤ 1001 := by decide
#print axioms vertex1330
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1305
  · exact vertex1309
  · exact vertex1311
  · exact vertex1312
  · exact vertex1316
  · exact vertex1320
  · exact vertex1323
  · exact vertex1325
  · exact vertex1326
  · exact vertex1330
#print axioms capacity
end Node1209Capacity069
