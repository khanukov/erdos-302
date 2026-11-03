import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity051
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {860, 861, 864, 867, 868, 870, 874, 875, 880, 882}
theorem vertex860 : load 860 ≤ 1001 := by decide
#print axioms vertex860
theorem vertex861 : load 861 ≤ 1001 := by decide
#print axioms vertex861
theorem vertex864 : load 864 ≤ 1001 := by decide
#print axioms vertex864
theorem vertex867 : load 867 ≤ 1001 := by decide
#print axioms vertex867
theorem vertex868 : load 868 ≤ 1001 := by decide
#print axioms vertex868
theorem vertex870 : load 870 ≤ 1001 := by decide
#print axioms vertex870
theorem vertex874 : load 874 ≤ 1001 := by decide
#print axioms vertex874
theorem vertex875 : load 875 ≤ 1001 := by decide
#print axioms vertex875
theorem vertex880 : load 880 ≤ 1001 := by decide
#print axioms vertex880
theorem vertex882 : load 882 ≤ 1001 := by decide
#print axioms vertex882
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex860
  · exact vertex861
  · exact vertex864
  · exact vertex867
  · exact vertex868
  · exact vertex870
  · exact vertex874
  · exact vertex875
  · exact vertex880
  · exact vertex882
#print axioms capacity
end Node1209Capacity051
