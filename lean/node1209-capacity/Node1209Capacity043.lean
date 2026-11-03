import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity043
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {682, 684, 686, 688, 690, 693, 696, 697, 700, 702}
theorem vertex682 : load 682 ≤ 1001 := by decide
#print axioms vertex682
theorem vertex684 : load 684 ≤ 1001 := by decide
#print axioms vertex684
theorem vertex686 : load 686 ≤ 1001 := by decide
#print axioms vertex686
theorem vertex688 : load 688 ≤ 1001 := by decide
#print axioms vertex688
theorem vertex690 : load 690 ≤ 1001 := by decide
#print axioms vertex690
theorem vertex693 : load 693 ≤ 1001 := by decide
#print axioms vertex693
theorem vertex696 : load 696 ≤ 1001 := by decide
#print axioms vertex696
theorem vertex697 : load 697 ≤ 1001 := by decide
#print axioms vertex697
theorem vertex700 : load 700 ≤ 1001 := by decide
#print axioms vertex700
theorem vertex702 : load 702 ≤ 1001 := by decide
#print axioms vertex702
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex682
  · exact vertex684
  · exact vertex686
  · exact vertex688
  · exact vertex690
  · exact vertex693
  · exact vertex696
  · exact vertex697
  · exact vertex700
  · exact vertex702
#print axioms capacity
end Node1209Capacity043
