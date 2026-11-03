import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity035
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {522, 525, 527, 528, 530, 531, 532, 533, 536, 539}
theorem vertex522 : load 522 ≤ 1001 := by decide
#print axioms vertex522
theorem vertex525 : load 525 ≤ 1001 := by decide
#print axioms vertex525
theorem vertex527 : load 527 ≤ 1001 := by decide
#print axioms vertex527
theorem vertex528 : load 528 ≤ 1001 := by decide
#print axioms vertex528
theorem vertex530 : load 530 ≤ 1001 := by decide
#print axioms vertex530
theorem vertex531 : load 531 ≤ 1001 := by decide
#print axioms vertex531
theorem vertex532 : load 532 ≤ 1001 := by decide
#print axioms vertex532
theorem vertex533 : load 533 ≤ 1001 := by decide
#print axioms vertex533
theorem vertex536 : load 536 ≤ 1001 := by decide
#print axioms vertex536
theorem vertex539 : load 539 ≤ 1001 := by decide
#print axioms vertex539
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex522
  · exact vertex525
  · exact vertex527
  · exact vertex528
  · exact vertex530
  · exact vertex531
  · exact vertex532
  · exact vertex533
  · exact vertex536
  · exact vertex539
#print axioms capacity
end Node1209Capacity035
