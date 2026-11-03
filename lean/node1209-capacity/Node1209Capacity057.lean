import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity057
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1007, 1008, 1012, 1014, 1015, 1020, 1023, 1025, 1026, 1029}
theorem vertex1007 : load 1007 ≤ 1001 := by decide
#print axioms vertex1007
theorem vertex1008 : load 1008 ≤ 1001 := by decide
#print axioms vertex1008
theorem vertex1012 : load 1012 ≤ 1001 := by decide
#print axioms vertex1012
theorem vertex1014 : load 1014 ≤ 1001 := by decide
#print axioms vertex1014
theorem vertex1015 : load 1015 ≤ 1001 := by decide
#print axioms vertex1015
theorem vertex1020 : load 1020 ≤ 1001 := by decide
#print axioms vertex1020
theorem vertex1023 : load 1023 ≤ 1001 := by decide
#print axioms vertex1023
theorem vertex1025 : load 1025 ≤ 1001 := by decide
#print axioms vertex1025
theorem vertex1026 : load 1026 ≤ 1001 := by decide
#print axioms vertex1026
theorem vertex1029 : load 1029 ≤ 1001 := by decide
#print axioms vertex1029
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1007
  · exact vertex1008
  · exact vertex1012
  · exact vertex1014
  · exact vertex1015
  · exact vertex1020
  · exact vertex1023
  · exact vertex1025
  · exact vertex1026
  · exact vertex1029
#print axioms capacity
end Node1209Capacity057
