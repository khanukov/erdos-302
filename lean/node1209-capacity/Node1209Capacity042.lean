import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity042
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {660, 663, 665, 666, 667, 670, 672, 675, 676, 680}
theorem vertex660 : load 660 ≤ 1001 := by decide
#print axioms vertex660
theorem vertex663 : load 663 ≤ 1001 := by decide
#print axioms vertex663
theorem vertex665 : load 665 ≤ 1001 := by decide
#print axioms vertex665
theorem vertex666 : load 666 ≤ 1001 := by decide
#print axioms vertex666
theorem vertex667 : load 667 ≤ 1001 := by decide
#print axioms vertex667
theorem vertex670 : load 670 ≤ 1001 := by decide
#print axioms vertex670
theorem vertex672 : load 672 ≤ 1001 := by decide
#print axioms vertex672
theorem vertex675 : load 675 ≤ 1001 := by decide
#print axioms vertex675
theorem vertex676 : load 676 ≤ 1001 := by decide
#print axioms vertex676
theorem vertex680 : load 680 ≤ 1001 := by decide
#print axioms vertex680
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex660
  · exact vertex663
  · exact vertex665
  · exact vertex666
  · exact vertex667
  · exact vertex670
  · exact vertex672
  · exact vertex675
  · exact vertex676
  · exact vertex680
#print axioms capacity
end Node1209Capacity042
