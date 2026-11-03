import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity086
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1782, 1785, 1786, 1792, 1794, 1798, 1800, 1802, 1804, 1806}
theorem vertex1782 : load 1782 ≤ 1001 := by decide
#print axioms vertex1782
theorem vertex1785 : load 1785 ≤ 1001 := by decide
#print axioms vertex1785
theorem vertex1786 : load 1786 ≤ 1001 := by decide
#print axioms vertex1786
theorem vertex1792 : load 1792 ≤ 1001 := by decide
#print axioms vertex1792
theorem vertex1794 : load 1794 ≤ 1001 := by decide
#print axioms vertex1794
theorem vertex1798 : load 1798 ≤ 1001 := by decide
#print axioms vertex1798
theorem vertex1800 : load 1800 ≤ 1001 := by decide
#print axioms vertex1800
theorem vertex1802 : load 1802 ≤ 1001 := by decide
#print axioms vertex1802
theorem vertex1804 : load 1804 ≤ 1001 := by decide
#print axioms vertex1804
theorem vertex1806 : load 1806 ≤ 1001 := by decide
#print axioms vertex1806
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1782
  · exact vertex1785
  · exact vertex1786
  · exact vertex1792
  · exact vertex1794
  · exact vertex1798
  · exact vertex1800
  · exact vertex1802
  · exact vertex1804
  · exact vertex1806
#print axioms capacity
end Node1209Capacity086
