import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity016
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {200, 201, 203, 204, 205, 207, 208, 209, 210, 212}
theorem vertex200 : load 200 ≤ 1001 := by decide
#print axioms vertex200
theorem vertex201 : load 201 ≤ 1001 := by decide
#print axioms vertex201
theorem vertex203 : load 203 ≤ 1001 := by decide
#print axioms vertex203
theorem vertex204 : load 204 ≤ 1001 := by decide
#print axioms vertex204
theorem vertex205 : load 205 ≤ 1001 := by decide
#print axioms vertex205
theorem vertex207 : load 207 ≤ 1001 := by decide
#print axioms vertex207
theorem vertex208 : load 208 ≤ 1001 := by decide
#print axioms vertex208
theorem vertex209 : load 209 ≤ 1001 := by decide
#print axioms vertex209
theorem vertex210 : load 210 ≤ 1001 := by decide
#print axioms vertex210
theorem vertex212 : load 212 ≤ 1001 := by decide
#print axioms vertex212
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex200
  · exact vertex201
  · exact vertex203
  · exact vertex204
  · exact vertex205
  · exact vertex207
  · exact vertex208
  · exact vertex209
  · exact vertex210
  · exact vertex212
#print axioms capacity
end Node1209Capacity016
