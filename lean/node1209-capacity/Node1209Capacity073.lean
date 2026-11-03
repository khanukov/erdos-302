import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity073
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1419, 1420, 1421, 1425, 1426, 1428, 1430, 1431, 1435, 1440}
theorem vertex1419 : load 1419 ≤ 1001 := by decide
#print axioms vertex1419
theorem vertex1420 : load 1420 ≤ 1001 := by decide
#print axioms vertex1420
theorem vertex1421 : load 1421 ≤ 1001 := by decide
#print axioms vertex1421
theorem vertex1425 : load 1425 ≤ 1001 := by decide
#print axioms vertex1425
theorem vertex1426 : load 1426 ≤ 1001 := by decide
#print axioms vertex1426
theorem vertex1428 : load 1428 ≤ 1001 := by decide
#print axioms vertex1428
theorem vertex1430 : load 1430 ≤ 1001 := by decide
#print axioms vertex1430
theorem vertex1431 : load 1431 ≤ 1001 := by decide
#print axioms vertex1431
theorem vertex1435 : load 1435 ≤ 1001 := by decide
#print axioms vertex1435
theorem vertex1440 : load 1440 ≤ 1001 := by decide
#print axioms vertex1440
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1419
  · exact vertex1420
  · exact vertex1421
  · exact vertex1425
  · exact vertex1426
  · exact vertex1428
  · exact vertex1430
  · exact vertex1431
  · exact vertex1435
  · exact vertex1440
#print axioms capacity
end Node1209Capacity073
