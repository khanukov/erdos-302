import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity000
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {2, 3, 4, 5, 6, 7, 8, 9, 10, 11}
theorem vertex2 : load 2 ≤ 1001 := by decide
#print axioms vertex2
theorem vertex3 : load 3 ≤ 1001 := by decide
#print axioms vertex3
theorem vertex4 : load 4 ≤ 1001 := by decide
#print axioms vertex4
theorem vertex5 : load 5 ≤ 1001 := by decide
#print axioms vertex5
theorem vertex6 : load 6 ≤ 1001 := by decide
#print axioms vertex6
theorem vertex7 : load 7 ≤ 1001 := by decide
#print axioms vertex7
theorem vertex8 : load 8 ≤ 1001 := by decide
#print axioms vertex8
theorem vertex9 : load 9 ≤ 1001 := by decide
#print axioms vertex9
theorem vertex10 : load 10 ≤ 1001 := by decide
#print axioms vertex10
theorem vertex11 : load 11 ≤ 1001 := by decide
#print axioms vertex11
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex2
  · exact vertex3
  · exact vertex4
  · exact vertex5
  · exact vertex6
  · exact vertex7
  · exact vertex8
  · exact vertex9
  · exact vertex10
  · exact vertex11
#print axioms capacity
end Node1209Capacity000
