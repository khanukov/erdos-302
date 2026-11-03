import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity024
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {323, 324, 325, 328, 329, 330, 333, 335, 336, 338}
theorem vertex323 : load 323 ≤ 1001 := by decide
#print axioms vertex323
theorem vertex324 : load 324 ≤ 1001 := by decide
#print axioms vertex324
theorem vertex325 : load 325 ≤ 1001 := by decide
#print axioms vertex325
theorem vertex328 : load 328 ≤ 1001 := by decide
#print axioms vertex328
theorem vertex329 : load 329 ≤ 1001 := by decide
#print axioms vertex329
theorem vertex330 : load 330 ≤ 1001 := by decide
#print axioms vertex330
theorem vertex333 : load 333 ≤ 1001 := by decide
#print axioms vertex333
theorem vertex335 : load 335 ≤ 1001 := by decide
#print axioms vertex335
theorem vertex336 : load 336 ≤ 1001 := by decide
#print axioms vertex336
theorem vertex338 : load 338 ≤ 1001 := by decide
#print axioms vertex338
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex323
  · exact vertex324
  · exact vertex325
  · exact vertex328
  · exact vertex329
  · exact vertex330
  · exact vertex333
  · exact vertex335
  · exact vertex336
  · exact vertex338
#print axioms capacity
end Node1209Capacity024
