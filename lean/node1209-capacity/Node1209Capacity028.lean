import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity028
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {391, 392, 396, 399, 400, 402, 403, 405, 406, 407}
theorem vertex391 : load 391 ≤ 1001 := by decide
#print axioms vertex391
theorem vertex392 : load 392 ≤ 1001 := by decide
#print axioms vertex392
theorem vertex396 : load 396 ≤ 1001 := by decide
#print axioms vertex396
theorem vertex399 : load 399 ≤ 1001 := by decide
#print axioms vertex399
theorem vertex400 : load 400 ≤ 1001 := by decide
#print axioms vertex400
theorem vertex402 : load 402 ≤ 1001 := by decide
#print axioms vertex402
theorem vertex403 : load 403 ≤ 1001 := by decide
#print axioms vertex403
theorem vertex405 : load 405 ≤ 1001 := by decide
#print axioms vertex405
theorem vertex406 : load 406 ≤ 1001 := by decide
#print axioms vertex406
theorem vertex407 : load 407 ≤ 1001 := by decide
#print axioms vertex407
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex391
  · exact vertex392
  · exact vertex396
  · exact vertex399
  · exact vertex400
  · exact vertex402
  · exact vertex403
  · exact vertex405
  · exact vertex406
  · exact vertex407
#print axioms capacity
end Node1209Capacity028
