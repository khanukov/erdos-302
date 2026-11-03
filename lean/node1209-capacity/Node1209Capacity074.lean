import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity074
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1443, 1449, 1450, 1452, 1456, 1457, 1458, 1462, 1463, 1464}
theorem vertex1443 : load 1443 ≤ 1001 := by decide
#print axioms vertex1443
theorem vertex1449 : load 1449 ≤ 1001 := by decide
#print axioms vertex1449
theorem vertex1450 : load 1450 ≤ 1001 := by decide
#print axioms vertex1450
theorem vertex1452 : load 1452 ≤ 1001 := by decide
#print axioms vertex1452
theorem vertex1456 : load 1456 ≤ 1001 := by decide
#print axioms vertex1456
theorem vertex1457 : load 1457 ≤ 1001 := by decide
#print axioms vertex1457
theorem vertex1458 : load 1458 ≤ 1001 := by decide
#print axioms vertex1458
theorem vertex1462 : load 1462 ≤ 1001 := by decide
#print axioms vertex1462
theorem vertex1463 : load 1463 ≤ 1001 := by decide
#print axioms vertex1463
theorem vertex1464 : load 1464 ≤ 1001 := by decide
#print axioms vertex1464
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1443
  · exact vertex1449
  · exact vertex1450
  · exact vertex1452
  · exact vertex1456
  · exact vertex1457
  · exact vertex1458
  · exact vertex1462
  · exact vertex1463
  · exact vertex1464
#print axioms capacity
end Node1209Capacity074
