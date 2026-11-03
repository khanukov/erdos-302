import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity020
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {258, 259, 260, 261, 264, 265, 266, 268, 270, 272}
theorem vertex258 : load 258 ≤ 1001 := by decide
#print axioms vertex258
theorem vertex259 : load 259 ≤ 1001 := by decide
#print axioms vertex259
theorem vertex260 : load 260 ≤ 1001 := by decide
#print axioms vertex260
theorem vertex261 : load 261 ≤ 1001 := by decide
#print axioms vertex261
theorem vertex264 : load 264 ≤ 1001 := by decide
#print axioms vertex264
theorem vertex265 : load 265 ≤ 1001 := by decide
#print axioms vertex265
theorem vertex266 : load 266 ≤ 1001 := by decide
#print axioms vertex266
theorem vertex268 : load 268 ≤ 1001 := by decide
#print axioms vertex268
theorem vertex270 : load 270 ≤ 1001 := by decide
#print axioms vertex270
theorem vertex272 : load 272 ≤ 1001 := by decide
#print axioms vertex272
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex258
  · exact vertex259
  · exact vertex260
  · exact vertex261
  · exact vertex264
  · exact vertex265
  · exact vertex266
  · exact vertex268
  · exact vertex270
  · exact vertex272
#print axioms capacity
end Node1209Capacity020
