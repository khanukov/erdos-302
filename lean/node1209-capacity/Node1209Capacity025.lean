import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity025
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {340, 341, 342, 344, 345, 348, 350, 351, 352, 354}
theorem vertex340 : load 340 ≤ 1001 := by decide
#print axioms vertex340
theorem vertex341 : load 341 ≤ 1001 := by decide
#print axioms vertex341
theorem vertex342 : load 342 ≤ 1001 := by decide
#print axioms vertex342
theorem vertex344 : load 344 ≤ 1001 := by decide
#print axioms vertex344
theorem vertex345 : load 345 ≤ 1001 := by decide
#print axioms vertex345
theorem vertex348 : load 348 ≤ 1001 := by decide
#print axioms vertex348
theorem vertex350 : load 350 ≤ 1001 := by decide
#print axioms vertex350
theorem vertex351 : load 351 ≤ 1001 := by decide
#print axioms vertex351
theorem vertex352 : load 352 ≤ 1001 := by decide
#print axioms vertex352
theorem vertex354 : load 354 ≤ 1001 := by decide
#print axioms vertex354
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex340
  · exact vertex341
  · exact vertex342
  · exact vertex344
  · exact vertex345
  · exact vertex348
  · exact vertex350
  · exact vertex351
  · exact vertex352
  · exact vertex354
#print axioms capacity
end Node1209Capacity025
