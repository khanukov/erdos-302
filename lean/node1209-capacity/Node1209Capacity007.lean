import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity007
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {80, 81, 82, 84, 85, 86, 87, 88, 90, 91}
theorem vertex80 : load 80 ≤ 1001 := by decide
#print axioms vertex80
theorem vertex81 : load 81 ≤ 1001 := by decide
#print axioms vertex81
theorem vertex82 : load 82 ≤ 1001 := by decide
#print axioms vertex82
theorem vertex84 : load 84 ≤ 1001 := by decide
#print axioms vertex84
theorem vertex85 : load 85 ≤ 1001 := by decide
#print axioms vertex85
theorem vertex86 : load 86 ≤ 1001 := by decide
#print axioms vertex86
theorem vertex87 : load 87 ≤ 1001 := by decide
#print axioms vertex87
theorem vertex88 : load 88 ≤ 1001 := by decide
#print axioms vertex88
theorem vertex90 : load 90 ≤ 1001 := by decide
#print axioms vertex90
theorem vertex91 : load 91 ≤ 1001 := by decide
#print axioms vertex91
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex80
  · exact vertex81
  · exact vertex82
  · exact vertex84
  · exact vertex85
  · exact vertex86
  · exact vertex87
  · exact vertex88
  · exact vertex90
  · exact vertex91
#print axioms capacity
end Node1209Capacity007
