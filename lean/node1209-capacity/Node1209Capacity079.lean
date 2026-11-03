import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity079
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1590, 1591, 1593, 1595, 1596, 1598, 1599, 1600, 1608, 1610}
theorem vertex1590 : load 1590 ≤ 1001 := by decide
#print axioms vertex1590
theorem vertex1591 : load 1591 ≤ 1001 := by decide
#print axioms vertex1591
theorem vertex1593 : load 1593 ≤ 1001 := by decide
#print axioms vertex1593
theorem vertex1595 : load 1595 ≤ 1001 := by decide
#print axioms vertex1595
theorem vertex1596 : load 1596 ≤ 1001 := by decide
#print axioms vertex1596
theorem vertex1598 : load 1598 ≤ 1001 := by decide
#print axioms vertex1598
theorem vertex1599 : load 1599 ≤ 1001 := by decide
#print axioms vertex1599
theorem vertex1600 : load 1600 ≤ 1001 := by decide
#print axioms vertex1600
theorem vertex1608 : load 1608 ≤ 1001 := by decide
#print axioms vertex1608
theorem vertex1610 : load 1610 ≤ 1001 := by decide
#print axioms vertex1610
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1590
  · exact vertex1591
  · exact vertex1593
  · exact vertex1595
  · exact vertex1596
  · exact vertex1598
  · exact vertex1599
  · exact vertex1600
  · exact vertex1608
  · exact vertex1610
#print axioms capacity
end Node1209Capacity079
