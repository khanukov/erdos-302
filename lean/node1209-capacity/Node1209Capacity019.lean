import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity019
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {244, 245, 246, 247, 248, 250, 252, 253, 255, 256}
theorem vertex244 : load 244 ≤ 1001 := by decide
#print axioms vertex244
theorem vertex245 : load 245 ≤ 1001 := by decide
#print axioms vertex245
theorem vertex246 : load 246 ≤ 1001 := by decide
#print axioms vertex246
theorem vertex247 : load 247 ≤ 1001 := by decide
#print axioms vertex247
theorem vertex248 : load 248 ≤ 1001 := by decide
#print axioms vertex248
theorem vertex250 : load 250 ≤ 1001 := by decide
#print axioms vertex250
theorem vertex252 : load 252 ≤ 1001 := by decide
#print axioms vertex252
theorem vertex253 : load 253 ≤ 1001 := by decide
#print axioms vertex253
theorem vertex255 : load 255 ≤ 1001 := by decide
#print axioms vertex255
theorem vertex256 : load 256 ≤ 1001 := by decide
#print axioms vertex256
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex244
  · exact vertex245
  · exact vertex246
  · exact vertex247
  · exact vertex248
  · exact vertex250
  · exact vertex252
  · exact vertex253
  · exact vertex255
  · exact vertex256
#print axioms capacity
end Node1209Capacity019
