import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity031
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {448, 450, 451, 455, 456, 459, 460, 462, 464, 465}
theorem vertex448 : load 448 ≤ 1001 := by decide
#print axioms vertex448
theorem vertex450 : load 450 ≤ 1001 := by decide
#print axioms vertex450
theorem vertex451 : load 451 ≤ 1001 := by decide
#print axioms vertex451
theorem vertex455 : load 455 ≤ 1001 := by decide
#print axioms vertex455
theorem vertex456 : load 456 ≤ 1001 := by decide
#print axioms vertex456
theorem vertex459 : load 459 ≤ 1001 := by decide
#print axioms vertex459
theorem vertex460 : load 460 ≤ 1001 := by decide
#print axioms vertex460
theorem vertex462 : load 462 ≤ 1001 := by decide
#print axioms vertex462
theorem vertex464 : load 464 ≤ 1001 := by decide
#print axioms vertex464
theorem vertex465 : load 465 ≤ 1001 := by decide
#print axioms vertex465
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex448
  · exact vertex450
  · exact vertex451
  · exact vertex455
  · exact vertex456
  · exact vertex459
  · exact vertex460
  · exact vertex462
  · exact vertex464
  · exact vertex465
#print axioms capacity
end Node1209Capacity031
