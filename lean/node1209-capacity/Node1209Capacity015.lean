import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity015
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {185, 186, 187, 188, 189, 190, 192, 195, 196, 198}
theorem vertex185 : load 185 ≤ 1001 := by decide
#print axioms vertex185
theorem vertex186 : load 186 ≤ 1001 := by decide
#print axioms vertex186
theorem vertex187 : load 187 ≤ 1001 := by decide
#print axioms vertex187
theorem vertex188 : load 188 ≤ 1001 := by decide
#print axioms vertex188
theorem vertex189 : load 189 ≤ 1001 := by decide
#print axioms vertex189
theorem vertex190 : load 190 ≤ 1001 := by decide
#print axioms vertex190
theorem vertex192 : load 192 ≤ 1001 := by decide
#print axioms vertex192
theorem vertex195 : load 195 ≤ 1001 := by decide
#print axioms vertex195
theorem vertex196 : load 196 ≤ 1001 := by decide
#print axioms vertex196
theorem vertex198 : load 198 ≤ 1001 := by decide
#print axioms vertex198
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex185
  · exact vertex186
  · exact vertex187
  · exact vertex188
  · exact vertex189
  · exact vertex190
  · exact vertex192
  · exact vertex195
  · exact vertex196
  · exact vertex198
#print axioms capacity
end Node1209Capacity015
