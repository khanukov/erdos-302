import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity087
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1813, 1815, 1820, 1824, 1827, 1829, 1830, 1833, 1836, 1840}
theorem vertex1813 : load 1813 ≤ 1001 := by decide
#print axioms vertex1813
theorem vertex1815 : load 1815 ≤ 1001 := by decide
#print axioms vertex1815
theorem vertex1820 : load 1820 ≤ 1001 := by decide
#print axioms vertex1820
theorem vertex1824 : load 1824 ≤ 1001 := by decide
#print axioms vertex1824
theorem vertex1827 : load 1827 ≤ 1001 := by decide
#print axioms vertex1827
theorem vertex1829 : load 1829 ≤ 1001 := by decide
#print axioms vertex1829
theorem vertex1830 : load 1830 ≤ 1001 := by decide
#print axioms vertex1830
theorem vertex1833 : load 1833 ≤ 1001 := by decide
#print axioms vertex1833
theorem vertex1836 : load 1836 ≤ 1001 := by decide
#print axioms vertex1836
theorem vertex1840 : load 1840 ≤ 1001 := by decide
#print axioms vertex1840
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1813
  · exact vertex1815
  · exact vertex1820
  · exact vertex1824
  · exact vertex1827
  · exact vertex1829
  · exact vertex1830
  · exact vertex1833
  · exact vertex1836
  · exact vertex1840
#print axioms capacity
end Node1209Capacity087
