import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity080
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1612, 1615, 1617, 1620, 1624, 1625, 1628, 1632, 1634, 1638}
theorem vertex1612 : load 1612 ≤ 1001 := by decide
#print axioms vertex1612
theorem vertex1615 : load 1615 ≤ 1001 := by decide
#print axioms vertex1615
theorem vertex1617 : load 1617 ≤ 1001 := by decide
#print axioms vertex1617
theorem vertex1620 : load 1620 ≤ 1001 := by decide
#print axioms vertex1620
theorem vertex1624 : load 1624 ≤ 1001 := by decide
#print axioms vertex1624
theorem vertex1625 : load 1625 ≤ 1001 := by decide
#print axioms vertex1625
theorem vertex1628 : load 1628 ≤ 1001 := by decide
#print axioms vertex1628
theorem vertex1632 : load 1632 ≤ 1001 := by decide
#print axioms vertex1632
theorem vertex1634 : load 1634 ≤ 1001 := by decide
#print axioms vertex1634
theorem vertex1638 : load 1638 ≤ 1001 := by decide
#print axioms vertex1638
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1612
  · exact vertex1615
  · exact vertex1617
  · exact vertex1620
  · exact vertex1624
  · exact vertex1625
  · exact vertex1628
  · exact vertex1632
  · exact vertex1634
  · exact vertex1638
#print axioms capacity
end Node1209Capacity080
