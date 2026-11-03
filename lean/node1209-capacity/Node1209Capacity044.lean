import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity044
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {703, 704, 705, 708, 710, 713, 714, 715, 720, 725}
theorem vertex703 : load 703 ≤ 1001 := by decide
#print axioms vertex703
theorem vertex704 : load 704 ≤ 1001 := by decide
#print axioms vertex704
theorem vertex705 : load 705 ≤ 1001 := by decide
#print axioms vertex705
theorem vertex708 : load 708 ≤ 1001 := by decide
#print axioms vertex708
theorem vertex710 : load 710 ≤ 1001 := by decide
#print axioms vertex710
theorem vertex713 : load 713 ≤ 1001 := by decide
#print axioms vertex713
theorem vertex714 : load 714 ≤ 1001 := by decide
#print axioms vertex714
theorem vertex715 : load 715 ≤ 1001 := by decide
#print axioms vertex715
theorem vertex720 : load 720 ≤ 1001 := by decide
#print axioms vertex720
theorem vertex725 : load 725 ≤ 1001 := by decide
#print axioms vertex725
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex703
  · exact vertex704
  · exact vertex705
  · exact vertex708
  · exact vertex710
  · exact vertex713
  · exact vertex714
  · exact vertex715
  · exact vertex720
  · exact vertex725
#print axioms capacity
end Node1209Capacity044
