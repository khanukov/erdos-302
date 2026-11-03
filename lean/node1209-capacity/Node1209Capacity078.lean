import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity078
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1554, 1558, 1560, 1564, 1566, 1568, 1573, 1575, 1581, 1584}
theorem vertex1554 : load 1554 ≤ 1001 := by decide
#print axioms vertex1554
theorem vertex1558 : load 1558 ≤ 1001 := by decide
#print axioms vertex1558
theorem vertex1560 : load 1560 ≤ 1001 := by decide
#print axioms vertex1560
theorem vertex1564 : load 1564 ≤ 1001 := by decide
#print axioms vertex1564
theorem vertex1566 : load 1566 ≤ 1001 := by decide
#print axioms vertex1566
theorem vertex1568 : load 1568 ≤ 1001 := by decide
#print axioms vertex1568
theorem vertex1573 : load 1573 ≤ 1001 := by decide
#print axioms vertex1573
theorem vertex1575 : load 1575 ≤ 1001 := by decide
#print axioms vertex1575
theorem vertex1581 : load 1581 ≤ 1001 := by decide
#print axioms vertex1581
theorem vertex1584 : load 1584 ≤ 1001 := by decide
#print axioms vertex1584
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1554
  · exact vertex1558
  · exact vertex1560
  · exact vertex1564
  · exact vertex1566
  · exact vertex1568
  · exact vertex1573
  · exact vertex1575
  · exact vertex1581
  · exact vertex1584
#print axioms capacity
end Node1209Capacity078
