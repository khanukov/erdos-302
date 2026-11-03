import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity082
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1672, 1674, 1677, 1680, 1683, 1690, 1692, 1694, 1696, 1700}
theorem vertex1672 : load 1672 ≤ 1001 := by decide
#print axioms vertex1672
theorem vertex1674 : load 1674 ≤ 1001 := by decide
#print axioms vertex1674
theorem vertex1677 : load 1677 ≤ 1001 := by decide
#print axioms vertex1677
theorem vertex1680 : load 1680 ≤ 1001 := by decide
#print axioms vertex1680
theorem vertex1683 : load 1683 ≤ 1001 := by decide
#print axioms vertex1683
theorem vertex1690 : load 1690 ≤ 1001 := by decide
#print axioms vertex1690
theorem vertex1692 : load 1692 ≤ 1001 := by decide
#print axioms vertex1692
theorem vertex1694 : load 1694 ≤ 1001 := by decide
#print axioms vertex1694
theorem vertex1696 : load 1696 ≤ 1001 := by decide
#print axioms vertex1696
theorem vertex1700 : load 1700 ≤ 1001 := by decide
#print axioms vertex1700
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1672
  · exact vertex1674
  · exact vertex1677
  · exact vertex1680
  · exact vertex1683
  · exact vertex1690
  · exact vertex1692
  · exact vertex1694
  · exact vertex1696
  · exact vertex1700
#print axioms capacity
end Node1209Capacity082
