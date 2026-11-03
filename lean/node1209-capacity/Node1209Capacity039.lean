import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity039
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {600, 602, 603, 605, 608, 609, 610, 611, 612, 615}
theorem vertex600 : load 600 ≤ 1001 := by decide
#print axioms vertex600
theorem vertex602 : load 602 ≤ 1001 := by decide
#print axioms vertex602
theorem vertex603 : load 603 ≤ 1001 := by decide
#print axioms vertex603
theorem vertex605 : load 605 ≤ 1001 := by decide
#print axioms vertex605
theorem vertex608 : load 608 ≤ 1001 := by decide
#print axioms vertex608
theorem vertex609 : load 609 ≤ 1001 := by decide
#print axioms vertex609
theorem vertex610 : load 610 ≤ 1001 := by decide
#print axioms vertex610
theorem vertex611 : load 611 ≤ 1001 := by decide
#print axioms vertex611
theorem vertex612 : load 612 ≤ 1001 := by decide
#print axioms vertex612
theorem vertex615 : load 615 ≤ 1001 := by decide
#print axioms vertex615
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex600
  · exact vertex602
  · exact vertex603
  · exact vertex605
  · exact vertex608
  · exact vertex609
  · exact vertex610
  · exact vertex611
  · exact vertex612
  · exact vertex615
#print axioms capacity
end Node1209Capacity039
