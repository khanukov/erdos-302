import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity088
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1845, 1848, 1850, 1855, 1856, 1859, 1860, 1862, 1863, 1870}
theorem vertex1845 : load 1845 ≤ 1001 := by decide
#print axioms vertex1845
theorem vertex1848 : load 1848 ≤ 1001 := by decide
#print axioms vertex1848
theorem vertex1850 : load 1850 ≤ 1001 := by decide
#print axioms vertex1850
theorem vertex1855 : load 1855 ≤ 1001 := by decide
#print axioms vertex1855
theorem vertex1856 : load 1856 ≤ 1001 := by decide
#print axioms vertex1856
theorem vertex1859 : load 1859 ≤ 1001 := by decide
#print axioms vertex1859
theorem vertex1860 : load 1860 ≤ 1001 := by decide
#print axioms vertex1860
theorem vertex1862 : load 1862 ≤ 1001 := by decide
#print axioms vertex1862
theorem vertex1863 : load 1863 ≤ 1001 := by decide
#print axioms vertex1863
theorem vertex1870 : load 1870 ≤ 1001 := by decide
#print axioms vertex1870
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1845
  · exact vertex1848
  · exact vertex1850
  · exact vertex1855
  · exact vertex1856
  · exact vertex1859
  · exact vertex1860
  · exact vertex1862
  · exact vertex1863
  · exact vertex1870
#print axioms capacity
end Node1209Capacity088
