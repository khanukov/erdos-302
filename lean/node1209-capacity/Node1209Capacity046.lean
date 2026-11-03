import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity046
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {742, 744, 748, 750, 752, 754, 756, 759, 760, 765}
theorem vertex742 : load 742 ≤ 1001 := by decide
#print axioms vertex742
theorem vertex744 : load 744 ≤ 1001 := by decide
#print axioms vertex744
theorem vertex748 : load 748 ≤ 1001 := by decide
#print axioms vertex748
theorem vertex750 : load 750 ≤ 1001 := by decide
#print axioms vertex750
theorem vertex752 : load 752 ≤ 1001 := by decide
#print axioms vertex752
theorem vertex754 : load 754 ≤ 1001 := by decide
#print axioms vertex754
theorem vertex756 : load 756 ≤ 1001 := by decide
#print axioms vertex756
theorem vertex759 : load 759 ≤ 1001 := by decide
#print axioms vertex759
theorem vertex760 : load 760 ≤ 1001 := by decide
#print axioms vertex760
theorem vertex765 : load 765 ≤ 1001 := by decide
#print axioms vertex765
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex742
  · exact vertex744
  · exact vertex748
  · exact vertex750
  · exact vertex752
  · exact vertex754
  · exact vertex756
  · exact vertex759
  · exact vertex760
  · exact vertex765
#print axioms capacity
end Node1209Capacity046
