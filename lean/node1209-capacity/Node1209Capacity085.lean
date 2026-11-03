import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity085
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1750, 1755, 1760, 1763, 1764, 1767, 1768, 1770, 1771, 1776}
theorem vertex1750 : load 1750 ≤ 1001 := by decide
#print axioms vertex1750
theorem vertex1755 : load 1755 ≤ 1001 := by decide
#print axioms vertex1755
theorem vertex1760 : load 1760 ≤ 1001 := by decide
#print axioms vertex1760
theorem vertex1763 : load 1763 ≤ 1001 := by decide
#print axioms vertex1763
theorem vertex1764 : load 1764 ≤ 1001 := by decide
#print axioms vertex1764
theorem vertex1767 : load 1767 ≤ 1001 := by decide
#print axioms vertex1767
theorem vertex1768 : load 1768 ≤ 1001 := by decide
#print axioms vertex1768
theorem vertex1770 : load 1770 ≤ 1001 := by decide
#print axioms vertex1770
theorem vertex1771 : load 1771 ≤ 1001 := by decide
#print axioms vertex1771
theorem vertex1776 : load 1776 ≤ 1001 := by decide
#print axioms vertex1776
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1750
  · exact vertex1755
  · exact vertex1760
  · exact vertex1763
  · exact vertex1764
  · exact vertex1767
  · exact vertex1768
  · exact vertex1770
  · exact vertex1771
  · exact vertex1776
#print axioms capacity
end Node1209Capacity085
