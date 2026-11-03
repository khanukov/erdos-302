import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity029
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {408, 410, 414, 416, 418, 420, 423, 424, 425, 426}
theorem vertex408 : load 408 ≤ 1001 := by decide
#print axioms vertex408
theorem vertex410 : load 410 ≤ 1001 := by decide
#print axioms vertex410
theorem vertex414 : load 414 ≤ 1001 := by decide
#print axioms vertex414
theorem vertex416 : load 416 ≤ 1001 := by decide
#print axioms vertex416
theorem vertex418 : load 418 ≤ 1001 := by decide
#print axioms vertex418
theorem vertex420 : load 420 ≤ 1001 := by decide
#print axioms vertex420
theorem vertex423 : load 423 ≤ 1001 := by decide
#print axioms vertex423
theorem vertex424 : load 424 ≤ 1001 := by decide
#print axioms vertex424
theorem vertex425 : load 425 ≤ 1001 := by decide
#print axioms vertex425
theorem vertex426 : load 426 ≤ 1001 := by decide
#print axioms vertex426
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex408
  · exact vertex410
  · exact vertex414
  · exact vertex416
  · exact vertex418
  · exact vertex420
  · exact vertex423
  · exact vertex424
  · exact vertex425
  · exact vertex426
#print axioms capacity
end Node1209Capacity029
