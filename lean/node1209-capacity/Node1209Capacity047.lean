import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity047
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {768, 770, 774, 775, 777, 779, 780, 782, 783, 784}
theorem vertex768 : load 768 ≤ 1001 := by decide
#print axioms vertex768
theorem vertex770 : load 770 ≤ 1001 := by decide
#print axioms vertex770
theorem vertex774 : load 774 ≤ 1001 := by decide
#print axioms vertex774
theorem vertex775 : load 775 ≤ 1001 := by decide
#print axioms vertex775
theorem vertex777 : load 777 ≤ 1001 := by decide
#print axioms vertex777
theorem vertex779 : load 779 ≤ 1001 := by decide
#print axioms vertex779
theorem vertex780 : load 780 ≤ 1001 := by decide
#print axioms vertex780
theorem vertex782 : load 782 ≤ 1001 := by decide
#print axioms vertex782
theorem vertex783 : load 783 ≤ 1001 := by decide
#print axioms vertex783
theorem vertex784 : load 784 ≤ 1001 := by decide
#print axioms vertex784
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex768
  · exact vertex770
  · exact vertex774
  · exact vertex775
  · exact vertex777
  · exact vertex779
  · exact vertex780
  · exact vertex782
  · exact vertex783
  · exact vertex784
#print axioms capacity
end Node1209Capacity047
