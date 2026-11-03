import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity068
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1280, 1281, 1287, 1288, 1290, 1292, 1295, 1296, 1300, 1302}
theorem vertex1280 : load 1280 ≤ 1001 := by decide
#print axioms vertex1280
theorem vertex1281 : load 1281 ≤ 1001 := by decide
#print axioms vertex1281
theorem vertex1287 : load 1287 ≤ 1001 := by decide
#print axioms vertex1287
theorem vertex1288 : load 1288 ≤ 1001 := by decide
#print axioms vertex1288
theorem vertex1290 : load 1290 ≤ 1001 := by decide
#print axioms vertex1290
theorem vertex1292 : load 1292 ≤ 1001 := by decide
#print axioms vertex1292
theorem vertex1295 : load 1295 ≤ 1001 := by decide
#print axioms vertex1295
theorem vertex1296 : load 1296 ≤ 1001 := by decide
#print axioms vertex1296
theorem vertex1300 : load 1300 ≤ 1001 := by decide
#print axioms vertex1300
theorem vertex1302 : load 1302 ≤ 1001 := by decide
#print axioms vertex1302
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1280
  · exact vertex1281
  · exact vertex1287
  · exact vertex1288
  · exact vertex1290
  · exact vertex1292
  · exact vertex1295
  · exact vertex1296
  · exact vertex1300
  · exact vertex1302
#print axioms capacity
end Node1209Capacity068
