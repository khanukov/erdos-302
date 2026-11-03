import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity076
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1496, 1500, 1504, 1505, 1508, 1512, 1517, 1518, 1519, 1520}
theorem vertex1496 : load 1496 ≤ 1001 := by decide
#print axioms vertex1496
theorem vertex1500 : load 1500 ≤ 1001 := by decide
#print axioms vertex1500
theorem vertex1504 : load 1504 ≤ 1001 := by decide
#print axioms vertex1504
theorem vertex1505 : load 1505 ≤ 1001 := by decide
#print axioms vertex1505
theorem vertex1508 : load 1508 ≤ 1001 := by decide
#print axioms vertex1508
theorem vertex1512 : load 1512 ≤ 1001 := by decide
#print axioms vertex1512
theorem vertex1517 : load 1517 ≤ 1001 := by decide
#print axioms vertex1517
theorem vertex1518 : load 1518 ≤ 1001 := by decide
#print axioms vertex1518
theorem vertex1519 : load 1519 ≤ 1001 := by decide
#print axioms vertex1519
theorem vertex1520 : load 1520 ≤ 1001 := by decide
#print axioms vertex1520
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1496
  · exact vertex1500
  · exact vertex1504
  · exact vertex1505
  · exact vertex1508
  · exact vertex1512
  · exact vertex1517
  · exact vertex1518
  · exact vertex1519
  · exact vertex1520
#print axioms capacity
end Node1209Capacity076
