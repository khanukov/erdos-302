import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity083
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1701, 1702, 1704, 1705, 1708, 1710, 1711, 1715, 1716, 1720}
theorem vertex1701 : load 1701 ≤ 1001 := by decide
#print axioms vertex1701
theorem vertex1702 : load 1702 ≤ 1001 := by decide
#print axioms vertex1702
theorem vertex1704 : load 1704 ≤ 1001 := by decide
#print axioms vertex1704
theorem vertex1705 : load 1705 ≤ 1001 := by decide
#print axioms vertex1705
theorem vertex1708 : load 1708 ≤ 1001 := by decide
#print axioms vertex1708
theorem vertex1710 : load 1710 ≤ 1001 := by decide
#print axioms vertex1710
theorem vertex1711 : load 1711 ≤ 1001 := by decide
#print axioms vertex1711
theorem vertex1715 : load 1715 ≤ 1001 := by decide
#print axioms vertex1715
theorem vertex1716 : load 1716 ≤ 1001 := by decide
#print axioms vertex1716
theorem vertex1720 : load 1720 ≤ 1001 := by decide
#print axioms vertex1720
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1701
  · exact vertex1702
  · exact vertex1704
  · exact vertex1705
  · exact vertex1708
  · exact vertex1710
  · exact vertex1711
  · exact vertex1715
  · exact vertex1716
  · exact vertex1720
#print axioms capacity
end Node1209Capacity083
