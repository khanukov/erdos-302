import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity027
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {374, 375, 376, 377, 378, 380, 384, 385, 387, 390}
theorem vertex374 : load 374 ≤ 1001 := by decide
#print axioms vertex374
theorem vertex375 : load 375 ≤ 1001 := by decide
#print axioms vertex375
theorem vertex376 : load 376 ≤ 1001 := by decide
#print axioms vertex376
theorem vertex377 : load 377 ≤ 1001 := by decide
#print axioms vertex377
theorem vertex378 : load 378 ≤ 1001 := by decide
#print axioms vertex378
theorem vertex380 : load 380 ≤ 1001 := by decide
#print axioms vertex380
theorem vertex384 : load 384 ≤ 1001 := by decide
#print axioms vertex384
theorem vertex385 : load 385 ≤ 1001 := by decide
#print axioms vertex385
theorem vertex387 : load 387 ≤ 1001 := by decide
#print axioms vertex387
theorem vertex390 : load 390 ≤ 1001 := by decide
#print axioms vertex390
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex374
  · exact vertex375
  · exact vertex376
  · exact vertex377
  · exact vertex378
  · exact vertex380
  · exact vertex384
  · exact vertex385
  · exact vertex387
  · exact vertex390
#print axioms capacity
end Node1209Capacity027
