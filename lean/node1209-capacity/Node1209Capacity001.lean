import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity001
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {12, 13, 14, 15, 16, 17, 18, 19, 20, 21}
theorem vertex12 : load 12 ≤ 1001 := by decide
#print axioms vertex12
theorem vertex13 : load 13 ≤ 1001 := by decide
#print axioms vertex13
theorem vertex14 : load 14 ≤ 1001 := by decide
#print axioms vertex14
theorem vertex15 : load 15 ≤ 1001 := by decide
#print axioms vertex15
theorem vertex16 : load 16 ≤ 1001 := by decide
#print axioms vertex16
theorem vertex17 : load 17 ≤ 1001 := by decide
#print axioms vertex17
theorem vertex18 : load 18 ≤ 1001 := by decide
#print axioms vertex18
theorem vertex19 : load 19 ≤ 1001 := by decide
#print axioms vertex19
theorem vertex20 : load 20 ≤ 1001 := by decide
#print axioms vertex20
theorem vertex21 : load 21 ≤ 1001 := by decide
#print axioms vertex21
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex12
  · exact vertex13
  · exact vertex14
  · exact vertex15
  · exact vertex16
  · exact vertex17
  · exact vertex18
  · exact vertex19
  · exact vertex20
  · exact vertex21
#print axioms capacity
end Node1209Capacity001
