import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity038
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {578, 580, 585, 588, 589, 590, 592, 594, 595, 598}
theorem vertex578 : load 578 ≤ 1001 := by decide
#print axioms vertex578
theorem vertex580 : load 580 ≤ 1001 := by decide
#print axioms vertex580
theorem vertex585 : load 585 ≤ 1001 := by decide
#print axioms vertex585
theorem vertex588 : load 588 ≤ 1001 := by decide
#print axioms vertex588
theorem vertex589 : load 589 ≤ 1001 := by decide
#print axioms vertex589
theorem vertex590 : load 590 ≤ 1001 := by decide
#print axioms vertex590
theorem vertex592 : load 592 ≤ 1001 := by decide
#print axioms vertex592
theorem vertex594 : load 594 ≤ 1001 := by decide
#print axioms vertex594
theorem vertex595 : load 595 ≤ 1001 := by decide
#print axioms vertex595
theorem vertex598 : load 598 ≤ 1001 := by decide
#print axioms vertex598
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex578
  · exact vertex580
  · exact vertex585
  · exact vertex588
  · exact vertex589
  · exact vertex590
  · exact vertex592
  · exact vertex594
  · exact vertex595
  · exact vertex598
#print axioms capacity
end Node1209Capacity038
