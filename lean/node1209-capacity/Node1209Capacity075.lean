import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity075
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1470, 1472, 1476, 1479, 1480, 1482, 1484, 1485, 1488, 1495}
theorem vertex1470 : load 1470 ≤ 1001 := by decide
#print axioms vertex1470
theorem vertex1472 : load 1472 ≤ 1001 := by decide
#print axioms vertex1472
theorem vertex1476 : load 1476 ≤ 1001 := by decide
#print axioms vertex1476
theorem vertex1479 : load 1479 ≤ 1001 := by decide
#print axioms vertex1479
theorem vertex1480 : load 1480 ≤ 1001 := by decide
#print axioms vertex1480
theorem vertex1482 : load 1482 ≤ 1001 := by decide
#print axioms vertex1482
theorem vertex1484 : load 1484 ≤ 1001 := by decide
#print axioms vertex1484
theorem vertex1485 : load 1485 ≤ 1001 := by decide
#print axioms vertex1485
theorem vertex1488 : load 1488 ≤ 1001 := by decide
#print axioms vertex1488
theorem vertex1495 : load 1495 ≤ 1001 := by decide
#print axioms vertex1495
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1470
  · exact vertex1472
  · exact vertex1476
  · exact vertex1479
  · exact vertex1480
  · exact vertex1482
  · exact vertex1484
  · exact vertex1485
  · exact vertex1488
  · exact vertex1495
#print axioms capacity
end Node1209Capacity075
