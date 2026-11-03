import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity077
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1521, 1530, 1536, 1537, 1539, 1540, 1547, 1548, 1550, 1551}
theorem vertex1521 : load 1521 ≤ 1001 := by decide
#print axioms vertex1521
theorem vertex1530 : load 1530 ≤ 1001 := by decide
#print axioms vertex1530
theorem vertex1536 : load 1536 ≤ 1001 := by decide
#print axioms vertex1536
theorem vertex1537 : load 1537 ≤ 1001 := by decide
#print axioms vertex1537
theorem vertex1539 : load 1539 ≤ 1001 := by decide
#print axioms vertex1539
theorem vertex1540 : load 1540 ≤ 1001 := by decide
#print axioms vertex1540
theorem vertex1547 : load 1547 ≤ 1001 := by decide
#print axioms vertex1547
theorem vertex1548 : load 1548 ≤ 1001 := by decide
#print axioms vertex1548
theorem vertex1550 : load 1550 ≤ 1001 := by decide
#print axioms vertex1550
theorem vertex1551 : load 1551 ≤ 1001 := by decide
#print axioms vertex1551
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1521
  · exact vertex1530
  · exact vertex1536
  · exact vertex1537
  · exact vertex1539
  · exact vertex1540
  · exact vertex1547
  · exact vertex1548
  · exact vertex1550
  · exact vertex1551
#print axioms capacity
end Node1209Capacity077
