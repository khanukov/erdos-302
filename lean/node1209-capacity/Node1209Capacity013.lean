import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity013
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {155, 156, 159, 160, 161, 162, 164, 165, 168, 170}
theorem vertex155 : load 155 ≤ 1001 := by decide
#print axioms vertex155
theorem vertex156 : load 156 ≤ 1001 := by decide
#print axioms vertex156
theorem vertex159 : load 159 ≤ 1001 := by decide
#print axioms vertex159
theorem vertex160 : load 160 ≤ 1001 := by decide
#print axioms vertex160
theorem vertex161 : load 161 ≤ 1001 := by decide
#print axioms vertex161
theorem vertex162 : load 162 ≤ 1001 := by decide
#print axioms vertex162
theorem vertex164 : load 164 ≤ 1001 := by decide
#print axioms vertex164
theorem vertex165 : load 165 ≤ 1001 := by decide
#print axioms vertex165
theorem vertex168 : load 168 ≤ 1001 := by decide
#print axioms vertex168
theorem vertex170 : load 170 ≤ 1001 := by decide
#print axioms vertex170
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex155
  · exact vertex156
  · exact vertex159
  · exact vertex160
  · exact vertex161
  · exact vertex162
  · exact vertex164
  · exact vertex165
  · exact vertex168
  · exact vertex170
#print axioms capacity
end Node1209Capacity013
