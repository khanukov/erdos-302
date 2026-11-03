import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity032
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {468, 470, 472, 473, 475, 476, 477, 480, 481, 483}
theorem vertex468 : load 468 ≤ 1001 := by decide
#print axioms vertex468
theorem vertex470 : load 470 ≤ 1001 := by decide
#print axioms vertex470
theorem vertex472 : load 472 ≤ 1001 := by decide
#print axioms vertex472
theorem vertex473 : load 473 ≤ 1001 := by decide
#print axioms vertex473
theorem vertex475 : load 475 ≤ 1001 := by decide
#print axioms vertex475
theorem vertex476 : load 476 ≤ 1001 := by decide
#print axioms vertex476
theorem vertex477 : load 477 ≤ 1001 := by decide
#print axioms vertex477
theorem vertex480 : load 480 ≤ 1001 := by decide
#print axioms vertex480
theorem vertex481 : load 481 ≤ 1001 := by decide
#print axioms vertex481
theorem vertex483 : load 483 ≤ 1001 := by decide
#print axioms vertex483
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex468
  · exact vertex470
  · exact vertex472
  · exact vertex473
  · exact vertex475
  · exact vertex476
  · exact vertex477
  · exact vertex480
  · exact vertex481
  · exact vertex483
#print axioms capacity
end Node1209Capacity032
