import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity053
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {903, 910, 912, 915, 918, 920, 924, 925, 928, 930}
theorem vertex903 : load 903 ≤ 1001 := by decide
#print axioms vertex903
theorem vertex910 : load 910 ≤ 1001 := by decide
#print axioms vertex910
theorem vertex912 : load 912 ≤ 1001 := by decide
#print axioms vertex912
theorem vertex915 : load 915 ≤ 1001 := by decide
#print axioms vertex915
theorem vertex918 : load 918 ≤ 1001 := by decide
#print axioms vertex918
theorem vertex920 : load 920 ≤ 1001 := by decide
#print axioms vertex920
theorem vertex924 : load 924 ≤ 1001 := by decide
#print axioms vertex924
theorem vertex925 : load 925 ≤ 1001 := by decide
#print axioms vertex925
theorem vertex928 : load 928 ≤ 1001 := by decide
#print axioms vertex928
theorem vertex930 : load 930 ≤ 1001 := by decide
#print axioms vertex930
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex903
  · exact vertex910
  · exact vertex912
  · exact vertex915
  · exact vertex918
  · exact vertex920
  · exact vertex924
  · exact vertex925
  · exact vertex928
  · exact vertex930
#print axioms capacity
end Node1209Capacity053
