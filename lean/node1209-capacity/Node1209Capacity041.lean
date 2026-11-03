import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity041
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {639, 640, 644, 645, 646, 648, 650, 651, 656, 658}
theorem vertex639 : load 639 ≤ 1001 := by decide
#print axioms vertex639
theorem vertex640 : load 640 ≤ 1001 := by decide
#print axioms vertex640
theorem vertex644 : load 644 ≤ 1001 := by decide
#print axioms vertex644
theorem vertex645 : load 645 ≤ 1001 := by decide
#print axioms vertex645
theorem vertex646 : load 646 ≤ 1001 := by decide
#print axioms vertex646
theorem vertex648 : load 648 ≤ 1001 := by decide
#print axioms vertex648
theorem vertex650 : load 650 ≤ 1001 := by decide
#print axioms vertex650
theorem vertex651 : load 651 ≤ 1001 := by decide
#print axioms vertex651
theorem vertex656 : load 656 ≤ 1001 := by decide
#print axioms vertex656
theorem vertex658 : load 658 ≤ 1001 := by decide
#print axioms vertex658
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex639
  · exact vertex640
  · exact vertex644
  · exact vertex645
  · exact vertex646
  · exact vertex648
  · exact vertex650
  · exact vertex651
  · exact vertex656
  · exact vertex658
#print axioms capacity
end Node1209Capacity041
