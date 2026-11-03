import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity081
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1640, 1643, 1645, 1650, 1652, 1653, 1656, 1664, 1665, 1666}
theorem vertex1640 : load 1640 ≤ 1001 := by decide
#print axioms vertex1640
theorem vertex1643 : load 1643 ≤ 1001 := by decide
#print axioms vertex1643
theorem vertex1645 : load 1645 ≤ 1001 := by decide
#print axioms vertex1645
theorem vertex1650 : load 1650 ≤ 1001 := by decide
#print axioms vertex1650
theorem vertex1652 : load 1652 ≤ 1001 := by decide
#print axioms vertex1652
theorem vertex1653 : load 1653 ≤ 1001 := by decide
#print axioms vertex1653
theorem vertex1656 : load 1656 ≤ 1001 := by decide
#print axioms vertex1656
theorem vertex1664 : load 1664 ≤ 1001 := by decide
#print axioms vertex1664
theorem vertex1665 : load 1665 ≤ 1001 := by decide
#print axioms vertex1665
theorem vertex1666 : load 1666 ≤ 1001 := by decide
#print axioms vertex1666
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1640
  · exact vertex1643
  · exact vertex1645
  · exact vertex1650
  · exact vertex1652
  · exact vertex1653
  · exact vertex1656
  · exact vertex1664
  · exact vertex1665
  · exact vertex1666
#print axioms capacity
end Node1209Capacity081
