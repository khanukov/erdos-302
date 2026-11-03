import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity037
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {560, 561, 564, 567, 568, 570, 572, 574, 575, 576}
theorem vertex560 : load 560 ≤ 1001 := by decide
#print axioms vertex560
theorem vertex561 : load 561 ≤ 1001 := by decide
#print axioms vertex561
theorem vertex564 : load 564 ≤ 1001 := by decide
#print axioms vertex564
theorem vertex567 : load 567 ≤ 1001 := by decide
#print axioms vertex567
theorem vertex568 : load 568 ≤ 1001 := by decide
#print axioms vertex568
theorem vertex570 : load 570 ≤ 1001 := by decide
#print axioms vertex570
theorem vertex572 : load 572 ≤ 1001 := by decide
#print axioms vertex572
theorem vertex574 : load 574 ≤ 1001 := by decide
#print axioms vertex574
theorem vertex575 : load 575 ≤ 1001 := by decide
#print axioms vertex575
theorem vertex576 : load 576 ≤ 1001 := by decide
#print axioms vertex576
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex560
  · exact vertex561
  · exact vertex564
  · exact vertex567
  · exact vertex568
  · exact vertex570
  · exact vertex572
  · exact vertex574
  · exact vertex575
  · exact vertex576
#print axioms capacity
end Node1209Capacity037
