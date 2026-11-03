import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity011
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {129, 130, 132, 133, 134, 135, 136, 138, 140, 141}
theorem vertex129 : load 129 ≤ 1001 := by decide
#print axioms vertex129
theorem vertex130 : load 130 ≤ 1001 := by decide
#print axioms vertex130
theorem vertex132 : load 132 ≤ 1001 := by decide
#print axioms vertex132
theorem vertex133 : load 133 ≤ 1001 := by decide
#print axioms vertex133
theorem vertex134 : load 134 ≤ 1001 := by decide
#print axioms vertex134
theorem vertex135 : load 135 ≤ 1001 := by decide
#print axioms vertex135
theorem vertex136 : load 136 ≤ 1001 := by decide
#print axioms vertex136
theorem vertex138 : load 138 ≤ 1001 := by decide
#print axioms vertex138
theorem vertex140 : load 140 ≤ 1001 := by decide
#print axioms vertex140
theorem vertex141 : load 141 ≤ 1001 := by decide
#print axioms vertex141
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex129
  · exact vertex130
  · exact vertex132
  · exact vertex133
  · exact vertex134
  · exact vertex135
  · exact vertex136
  · exact vertex138
  · exact vertex140
  · exact vertex141
#print axioms capacity
end Node1209Capacity011
