import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity006
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {66, 68, 69, 70, 72, 74, 75, 76, 77, 78}
theorem vertex66 : load 66 ≤ 1001 := by decide
#print axioms vertex66
theorem vertex68 : load 68 ≤ 1001 := by decide
#print axioms vertex68
theorem vertex69 : load 69 ≤ 1001 := by decide
#print axioms vertex69
theorem vertex70 : load 70 ≤ 1001 := by decide
#print axioms vertex70
theorem vertex72 : load 72 ≤ 1001 := by decide
#print axioms vertex72
theorem vertex74 : load 74 ≤ 1001 := by decide
#print axioms vertex74
theorem vertex75 : load 75 ≤ 1001 := by decide
#print axioms vertex75
theorem vertex76 : load 76 ≤ 1001 := by decide
#print axioms vertex76
theorem vertex77 : load 77 ≤ 1001 := by decide
#print axioms vertex77
theorem vertex78 : load 78 ≤ 1001 := by decide
#print axioms vertex78
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex66
  · exact vertex68
  · exact vertex69
  · exact vertex70
  · exact vertex72
  · exact vertex74
  · exact vertex75
  · exact vertex76
  · exact vertex77
  · exact vertex78
#print axioms capacity
end Node1209Capacity006
