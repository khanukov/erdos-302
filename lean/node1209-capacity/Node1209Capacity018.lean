import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity018
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {230, 231, 232, 234, 235, 236, 238, 240, 242, 243}
theorem vertex230 : load 230 ≤ 1001 := by decide
#print axioms vertex230
theorem vertex231 : load 231 ≤ 1001 := by decide
#print axioms vertex231
theorem vertex232 : load 232 ≤ 1001 := by decide
#print axioms vertex232
theorem vertex234 : load 234 ≤ 1001 := by decide
#print axioms vertex234
theorem vertex235 : load 235 ≤ 1001 := by decide
#print axioms vertex235
theorem vertex236 : load 236 ≤ 1001 := by decide
#print axioms vertex236
theorem vertex238 : load 238 ≤ 1001 := by decide
#print axioms vertex238
theorem vertex240 : load 240 ≤ 1001 := by decide
#print axioms vertex240
theorem vertex242 : load 242 ≤ 1001 := by decide
#print axioms vertex242
theorem vertex243 : load 243 ≤ 1001 := by decide
#print axioms vertex243
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex230
  · exact vertex231
  · exact vertex232
  · exact vertex234
  · exact vertex235
  · exact vertex236
  · exact vertex238
  · exact vertex240
  · exact vertex242
  · exact vertex243
#print axioms capacity
end Node1209Capacity018
