import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity089
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1872, 1875, 1876, 1880, 1881, 1886, 1887, 1888, 1890, 1892}
theorem vertex1872 : load 1872 ≤ 1001 := by decide
#print axioms vertex1872
theorem vertex1875 : load 1875 ≤ 1001 := by decide
#print axioms vertex1875
theorem vertex1876 : load 1876 ≤ 1001 := by decide
#print axioms vertex1876
theorem vertex1880 : load 1880 ≤ 1001 := by decide
#print axioms vertex1880
theorem vertex1881 : load 1881 ≤ 1001 := by decide
#print axioms vertex1881
theorem vertex1886 : load 1886 ≤ 1001 := by decide
#print axioms vertex1886
theorem vertex1887 : load 1887 ≤ 1001 := by decide
#print axioms vertex1887
theorem vertex1888 : load 1888 ≤ 1001 := by decide
#print axioms vertex1888
theorem vertex1890 : load 1890 ≤ 1001 := by decide
#print axioms vertex1890
theorem vertex1892 : load 1892 ≤ 1001 := by decide
#print axioms vertex1892
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1872
  · exact vertex1875
  · exact vertex1876
  · exact vertex1880
  · exact vertex1881
  · exact vertex1886
  · exact vertex1887
  · exact vertex1888
  · exact vertex1890
  · exact vertex1892
#print axioms capacity
end Node1209Capacity089
