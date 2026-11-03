import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity030
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {429, 430, 432, 434, 435, 437, 440, 441, 442, 444}
theorem vertex429 : load 429 ≤ 1001 := by decide
#print axioms vertex429
theorem vertex430 : load 430 ≤ 1001 := by decide
#print axioms vertex430
theorem vertex432 : load 432 ≤ 1001 := by decide
#print axioms vertex432
theorem vertex434 : load 434 ≤ 1001 := by decide
#print axioms vertex434
theorem vertex435 : load 435 ≤ 1001 := by decide
#print axioms vertex435
theorem vertex437 : load 437 ≤ 1001 := by decide
#print axioms vertex437
theorem vertex440 : load 440 ≤ 1001 := by decide
#print axioms vertex440
theorem vertex441 : load 441 ≤ 1001 := by decide
#print axioms vertex441
theorem vertex442 : load 442 ≤ 1001 := by decide
#print axioms vertex442
theorem vertex444 : load 444 ≤ 1001 := by decide
#print axioms vertex444
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex429
  · exact vertex430
  · exact vertex432
  · exact vertex434
  · exact vertex435
  · exact vertex437
  · exact vertex440
  · exact vertex441
  · exact vertex442
  · exact vertex444
#print axioms capacity
end Node1209Capacity030
