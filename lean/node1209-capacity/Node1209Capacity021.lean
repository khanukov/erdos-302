import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity021
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {273, 275, 276, 279, 280, 282, 284, 285, 286, 287}
theorem vertex273 : load 273 ≤ 1001 := by decide
#print axioms vertex273
theorem vertex275 : load 275 ≤ 1001 := by decide
#print axioms vertex275
theorem vertex276 : load 276 ≤ 1001 := by decide
#print axioms vertex276
theorem vertex279 : load 279 ≤ 1001 := by decide
#print axioms vertex279
theorem vertex280 : load 280 ≤ 1001 := by decide
#print axioms vertex280
theorem vertex282 : load 282 ≤ 1001 := by decide
#print axioms vertex282
theorem vertex284 : load 284 ≤ 1001 := by decide
#print axioms vertex284
theorem vertex285 : load 285 ≤ 1001 := by decide
#print axioms vertex285
theorem vertex286 : load 286 ≤ 1001 := by decide
#print axioms vertex286
theorem vertex287 : load 287 ≤ 1001 := by decide
#print axioms vertex287
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex273
  · exact vertex275
  · exact vertex276
  · exact vertex279
  · exact vertex280
  · exact vertex282
  · exact vertex284
  · exact vertex285
  · exact vertex286
  · exact vertex287
#print axioms capacity
end Node1209Capacity021
