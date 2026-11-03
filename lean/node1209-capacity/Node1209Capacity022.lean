import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity022
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {288, 290, 294, 295, 296, 297, 299, 300, 301, 304}
theorem vertex288 : load 288 ≤ 1001 := by decide
#print axioms vertex288
theorem vertex290 : load 290 ≤ 1001 := by decide
#print axioms vertex290
theorem vertex294 : load 294 ≤ 1001 := by decide
#print axioms vertex294
theorem vertex295 : load 295 ≤ 1001 := by decide
#print axioms vertex295
theorem vertex296 : load 296 ≤ 1001 := by decide
#print axioms vertex296
theorem vertex297 : load 297 ≤ 1001 := by decide
#print axioms vertex297
theorem vertex299 : load 299 ≤ 1001 := by decide
#print axioms vertex299
theorem vertex300 : load 300 ≤ 1001 := by decide
#print axioms vertex300
theorem vertex301 : load 301 ≤ 1001 := by decide
#print axioms vertex301
theorem vertex304 : load 304 ≤ 1001 := by decide
#print axioms vertex304
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex288
  · exact vertex290
  · exact vertex294
  · exact vertex295
  · exact vertex296
  · exact vertex297
  · exact vertex299
  · exact vertex300
  · exact vertex301
  · exact vertex304
#print axioms capacity
end Node1209Capacity022
