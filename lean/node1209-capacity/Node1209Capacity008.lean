import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity008
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {92, 93, 94, 95, 96, 98, 99, 100, 102, 104}
theorem vertex92 : load 92 ≤ 1001 := by decide
#print axioms vertex92
theorem vertex93 : load 93 ≤ 1001 := by decide
#print axioms vertex93
theorem vertex94 : load 94 ≤ 1001 := by decide
#print axioms vertex94
theorem vertex95 : load 95 ≤ 1001 := by decide
#print axioms vertex95
theorem vertex96 : load 96 ≤ 1001 := by decide
#print axioms vertex96
theorem vertex98 : load 98 ≤ 1001 := by decide
#print axioms vertex98
theorem vertex99 : load 99 ≤ 1001 := by decide
#print axioms vertex99
theorem vertex100 : load 100 ≤ 1001 := by decide
#print axioms vertex100
theorem vertex102 : load 102 ≤ 1001 := by decide
#print axioms vertex102
theorem vertex104 : load 104 ≤ 1001 := by decide
#print axioms vertex104
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex92
  · exact vertex93
  · exact vertex94
  · exact vertex95
  · exact vertex96
  · exact vertex98
  · exact vertex99
  · exact vertex100
  · exact vertex102
  · exact vertex104
#print axioms capacity
end Node1209Capacity008
