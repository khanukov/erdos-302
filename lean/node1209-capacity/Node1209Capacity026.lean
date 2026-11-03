import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity026
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {355, 357, 360, 363, 364, 366, 368, 369, 370, 372}
theorem vertex355 : load 355 ≤ 1001 := by decide
#print axioms vertex355
theorem vertex357 : load 357 ≤ 1001 := by decide
#print axioms vertex357
theorem vertex360 : load 360 ≤ 1001 := by decide
#print axioms vertex360
theorem vertex363 : load 363 ≤ 1001 := by decide
#print axioms vertex363
theorem vertex364 : load 364 ≤ 1001 := by decide
#print axioms vertex364
theorem vertex366 : load 366 ≤ 1001 := by decide
#print axioms vertex366
theorem vertex368 : load 368 ≤ 1001 := by decide
#print axioms vertex368
theorem vertex369 : load 369 ≤ 1001 := by decide
#print axioms vertex369
theorem vertex370 : load 370 ≤ 1001 := by decide
#print axioms vertex370
theorem vertex372 : load 372 ≤ 1001 := by decide
#print axioms vertex372
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex355
  · exact vertex357
  · exact vertex360
  · exact vertex363
  · exact vertex364
  · exact vertex366
  · exact vertex368
  · exact vertex369
  · exact vertex370
  · exact vertex372
#print axioms capacity
end Node1209Capacity026
