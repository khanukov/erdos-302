import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity045
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {726, 728, 729, 731, 732, 735, 736, 738, 740, 741}
theorem vertex726 : load 726 ≤ 1001 := by decide
#print axioms vertex726
theorem vertex728 : load 728 ≤ 1001 := by decide
#print axioms vertex728
theorem vertex729 : load 729 ≤ 1001 := by decide
#print axioms vertex729
theorem vertex731 : load 731 ≤ 1001 := by decide
#print axioms vertex731
theorem vertex732 : load 732 ≤ 1001 := by decide
#print axioms vertex732
theorem vertex735 : load 735 ≤ 1001 := by decide
#print axioms vertex735
theorem vertex736 : load 736 ≤ 1001 := by decide
#print axioms vertex736
theorem vertex738 : load 738 ≤ 1001 := by decide
#print axioms vertex738
theorem vertex740 : load 740 ≤ 1001 := by decide
#print axioms vertex740
theorem vertex741 : load 741 ≤ 1001 := by decide
#print axioms vertex741
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex726
  · exact vertex728
  · exact vertex729
  · exact vertex731
  · exact vertex732
  · exact vertex735
  · exact vertex736
  · exact vertex738
  · exact vertex740
  · exact vertex741
#print axioms capacity
end Node1209Capacity045
