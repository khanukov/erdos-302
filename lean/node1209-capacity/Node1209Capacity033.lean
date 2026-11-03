import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity033
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {484, 486, 488, 490, 492, 493, 494, 495, 496, 500}
theorem vertex484 : load 484 ≤ 1001 := by decide
#print axioms vertex484
theorem vertex486 : load 486 ≤ 1001 := by decide
#print axioms vertex486
theorem vertex488 : load 488 ≤ 1001 := by decide
#print axioms vertex488
theorem vertex490 : load 490 ≤ 1001 := by decide
#print axioms vertex490
theorem vertex492 : load 492 ≤ 1001 := by decide
#print axioms vertex492
theorem vertex493 : load 493 ≤ 1001 := by decide
#print axioms vertex493
theorem vertex494 : load 494 ≤ 1001 := by decide
#print axioms vertex494
theorem vertex495 : load 495 ≤ 1001 := by decide
#print axioms vertex495
theorem vertex496 : load 496 ≤ 1001 := by decide
#print axioms vertex496
theorem vertex500 : load 500 ≤ 1001 := by decide
#print axioms vertex500
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex484
  · exact vertex486
  · exact vertex488
  · exact vertex490
  · exact vertex492
  · exact vertex493
  · exact vertex494
  · exact vertex495
  · exact vertex496
  · exact vertex500
#print axioms capacity
end Node1209Capacity033
