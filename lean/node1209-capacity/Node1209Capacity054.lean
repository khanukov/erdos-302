import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity054
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {931, 935, 936, 940, 943, 945, 946, 950, 952, 954}
theorem vertex931 : load 931 ≤ 1001 := by decide
#print axioms vertex931
theorem vertex935 : load 935 ≤ 1001 := by decide
#print axioms vertex935
theorem vertex936 : load 936 ≤ 1001 := by decide
#print axioms vertex936
theorem vertex940 : load 940 ≤ 1001 := by decide
#print axioms vertex940
theorem vertex943 : load 943 ≤ 1001 := by decide
#print axioms vertex943
theorem vertex945 : load 945 ≤ 1001 := by decide
#print axioms vertex945
theorem vertex946 : load 946 ≤ 1001 := by decide
#print axioms vertex946
theorem vertex950 : load 950 ≤ 1001 := by decide
#print axioms vertex950
theorem vertex952 : load 952 ≤ 1001 := by decide
#print axioms vertex952
theorem vertex954 : load 954 ≤ 1001 := by decide
#print axioms vertex954
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex931
  · exact vertex935
  · exact vertex936
  · exact vertex940
  · exact vertex943
  · exact vertex945
  · exact vertex946
  · exact vertex950
  · exact vertex952
  · exact vertex954
#print axioms capacity
end Node1209Capacity054
