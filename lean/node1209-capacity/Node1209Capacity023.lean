import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity023
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {305, 306, 308, 310, 312, 315, 318, 319, 320, 322}
theorem vertex305 : load 305 ≤ 1001 := by decide
#print axioms vertex305
theorem vertex306 : load 306 ≤ 1001 := by decide
#print axioms vertex306
theorem vertex308 : load 308 ≤ 1001 := by decide
#print axioms vertex308
theorem vertex310 : load 310 ≤ 1001 := by decide
#print axioms vertex310
theorem vertex312 : load 312 ≤ 1001 := by decide
#print axioms vertex312
theorem vertex315 : load 315 ≤ 1001 := by decide
#print axioms vertex315
theorem vertex318 : load 318 ≤ 1001 := by decide
#print axioms vertex318
theorem vertex319 : load 319 ≤ 1001 := by decide
#print axioms vertex319
theorem vertex320 : load 320 ≤ 1001 := by decide
#print axioms vertex320
theorem vertex322 : load 322 ≤ 1001 := by decide
#print axioms vertex322
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex305
  · exact vertex306
  · exact vertex308
  · exact vertex310
  · exact vertex312
  · exact vertex315
  · exact vertex318
  · exact vertex319
  · exact vertex320
  · exact vertex322
#print axioms capacity
end Node1209Capacity023
