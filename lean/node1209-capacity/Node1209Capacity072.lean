import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity072
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1392, 1394, 1395, 1400, 1404, 1406, 1407, 1408, 1410, 1416}
theorem vertex1392 : load 1392 ≤ 1001 := by decide
#print axioms vertex1392
theorem vertex1394 : load 1394 ≤ 1001 := by decide
#print axioms vertex1394
theorem vertex1395 : load 1395 ≤ 1001 := by decide
#print axioms vertex1395
theorem vertex1400 : load 1400 ≤ 1001 := by decide
#print axioms vertex1400
theorem vertex1404 : load 1404 ≤ 1001 := by decide
#print axioms vertex1404
theorem vertex1406 : load 1406 ≤ 1001 := by decide
#print axioms vertex1406
theorem vertex1407 : load 1407 ≤ 1001 := by decide
#print axioms vertex1407
theorem vertex1408 : load 1408 ≤ 1001 := by decide
#print axioms vertex1408
theorem vertex1410 : load 1410 ≤ 1001 := by decide
#print axioms vertex1410
theorem vertex1416 : load 1416 ≤ 1001 := by decide
#print axioms vertex1416
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1392
  · exact vertex1394
  · exact vertex1395
  · exact vertex1400
  · exact vertex1404
  · exact vertex1406
  · exact vertex1407
  · exact vertex1408
  · exact vertex1410
  · exact vertex1416
#print axioms capacity
end Node1209Capacity072
