import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity084
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1722, 1725, 1728, 1729, 1734, 1736, 1739, 1740, 1748, 1749}
theorem vertex1722 : load 1722 ≤ 1001 := by decide
#print axioms vertex1722
theorem vertex1725 : load 1725 ≤ 1001 := by decide
#print axioms vertex1725
theorem vertex1728 : load 1728 ≤ 1001 := by decide
#print axioms vertex1728
theorem vertex1729 : load 1729 ≤ 1001 := by decide
#print axioms vertex1729
theorem vertex1734 : load 1734 ≤ 1001 := by decide
#print axioms vertex1734
theorem vertex1736 : load 1736 ≤ 1001 := by decide
#print axioms vertex1736
theorem vertex1739 : load 1739 ≤ 1001 := by decide
#print axioms vertex1739
theorem vertex1740 : load 1740 ≤ 1001 := by decide
#print axioms vertex1740
theorem vertex1748 : load 1748 ≤ 1001 := by decide
#print axioms vertex1748
theorem vertex1749 : load 1749 ≤ 1001 := by decide
#print axioms vertex1749
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1722
  · exact vertex1725
  · exact vertex1728
  · exact vertex1729
  · exact vertex1734
  · exact vertex1736
  · exact vertex1739
  · exact vertex1740
  · exact vertex1748
  · exact vertex1749
#print axioms capacity
end Node1209Capacity084
