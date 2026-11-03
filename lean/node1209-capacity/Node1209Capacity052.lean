import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity052
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {884, 885, 888, 891, 893, 896, 897, 899, 900, 902}
theorem vertex884 : load 884 ≤ 1001 := by decide
#print axioms vertex884
theorem vertex885 : load 885 ≤ 1001 := by decide
#print axioms vertex885
theorem vertex888 : load 888 ≤ 1001 := by decide
#print axioms vertex888
theorem vertex891 : load 891 ≤ 1001 := by decide
#print axioms vertex891
theorem vertex893 : load 893 ≤ 1001 := by decide
#print axioms vertex893
theorem vertex896 : load 896 ≤ 1001 := by decide
#print axioms vertex896
theorem vertex897 : load 897 ≤ 1001 := by decide
#print axioms vertex897
theorem vertex899 : load 899 ≤ 1001 := by decide
#print axioms vertex899
theorem vertex900 : load 900 ≤ 1001 := by decide
#print axioms vertex900
theorem vertex902 : load 902 ≤ 1001 := by decide
#print axioms vertex902
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex884
  · exact vertex885
  · exact vertex888
  · exact vertex891
  · exact vertex893
  · exact vertex896
  · exact vertex897
  · exact vertex899
  · exact vertex900
  · exact vertex902
#print axioms capacity
end Node1209Capacity052
