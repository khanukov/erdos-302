import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity002
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {22, 23, 24, 25, 26, 27, 28, 29, 30, 31}
theorem vertex22 : load 22 ≤ 1001 := by decide
#print axioms vertex22
theorem vertex23 : load 23 ≤ 1001 := by decide
#print axioms vertex23
theorem vertex24 : load 24 ≤ 1001 := by decide
#print axioms vertex24
theorem vertex25 : load 25 ≤ 1001 := by decide
#print axioms vertex25
theorem vertex26 : load 26 ≤ 1001 := by decide
#print axioms vertex26
theorem vertex27 : load 27 ≤ 1001 := by decide
#print axioms vertex27
theorem vertex28 : load 28 ≤ 1001 := by decide
#print axioms vertex28
theorem vertex29 : load 29 ≤ 1001 := by decide
#print axioms vertex29
theorem vertex30 : load 30 ≤ 1001 := by decide
#print axioms vertex30
theorem vertex31 : load 31 ≤ 1001 := by decide
#print axioms vertex31
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex22
  · exact vertex23
  · exact vertex24
  · exact vertex25
  · exact vertex26
  · exact vertex27
  · exact vertex28
  · exact vertex29
  · exact vertex30
  · exact vertex31
#print axioms capacity
end Node1209Capacity002
