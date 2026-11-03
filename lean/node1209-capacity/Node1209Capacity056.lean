import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity056
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {986, 987, 988, 989, 990, 992, 999, 1000, 1001, 1005}
theorem vertex986 : load 986 ≤ 1001 := by decide
#print axioms vertex986
theorem vertex987 : load 987 ≤ 1001 := by decide
#print axioms vertex987
theorem vertex988 : load 988 ≤ 1001 := by decide
#print axioms vertex988
theorem vertex989 : load 989 ≤ 1001 := by decide
#print axioms vertex989
theorem vertex990 : load 990 ≤ 1001 := by decide
#print axioms vertex990
theorem vertex992 : load 992 ≤ 1001 := by decide
#print axioms vertex992
theorem vertex999 : load 999 ≤ 1001 := by decide
#print axioms vertex999
theorem vertex1000 : load 1000 ≤ 1001 := by decide
#print axioms vertex1000
theorem vertex1001 : load 1001 ≤ 1001 := by decide
#print axioms vertex1001
theorem vertex1005 : load 1005 ≤ 1001 := by decide
#print axioms vertex1005
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex986
  · exact vertex987
  · exact vertex988
  · exact vertex989
  · exact vertex990
  · exact vertex992
  · exact vertex999
  · exact vertex1000
  · exact vertex1001
  · exact vertex1005
#print axioms capacity
end Node1209Capacity056
