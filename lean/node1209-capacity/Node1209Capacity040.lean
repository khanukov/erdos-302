import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity040
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {616, 620, 621, 624, 627, 629, 630, 636, 637, 638}
theorem vertex616 : load 616 ≤ 1001 := by decide
#print axioms vertex616
theorem vertex620 : load 620 ≤ 1001 := by decide
#print axioms vertex620
theorem vertex621 : load 621 ≤ 1001 := by decide
#print axioms vertex621
theorem vertex624 : load 624 ≤ 1001 := by decide
#print axioms vertex624
theorem vertex627 : load 627 ≤ 1001 := by decide
#print axioms vertex627
theorem vertex629 : load 629 ≤ 1001 := by decide
#print axioms vertex629
theorem vertex630 : load 630 ≤ 1001 := by decide
#print axioms vertex630
theorem vertex636 : load 636 ≤ 1001 := by decide
#print axioms vertex636
theorem vertex637 : load 637 ≤ 1001 := by decide
#print axioms vertex637
theorem vertex638 : load 638 ≤ 1001 := by decide
#print axioms vertex638
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex616
  · exact vertex620
  · exact vertex621
  · exact vertex624
  · exact vertex627
  · exact vertex629
  · exact vertex630
  · exact vertex636
  · exact vertex637
  · exact vertex638
#print axioms capacity
end Node1209Capacity040
