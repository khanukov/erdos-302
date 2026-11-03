import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity034
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {504, 506, 507, 510, 512, 513, 516, 517, 518, 520}
theorem vertex504 : load 504 ≤ 1001 := by decide
#print axioms vertex504
theorem vertex506 : load 506 ≤ 1001 := by decide
#print axioms vertex506
theorem vertex507 : load 507 ≤ 1001 := by decide
#print axioms vertex507
theorem vertex510 : load 510 ≤ 1001 := by decide
#print axioms vertex510
theorem vertex512 : load 512 ≤ 1001 := by decide
#print axioms vertex512
theorem vertex513 : load 513 ≤ 1001 := by decide
#print axioms vertex513
theorem vertex516 : load 516 ≤ 1001 := by decide
#print axioms vertex516
theorem vertex517 : load 517 ≤ 1001 := by decide
#print axioms vertex517
theorem vertex518 : load 518 ≤ 1001 := by decide
#print axioms vertex518
theorem vertex520 : load 520 ≤ 1001 := by decide
#print axioms vertex520
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex504
  · exact vertex506
  · exact vertex507
  · exact vertex510
  · exact vertex512
  · exact vertex513
  · exact vertex516
  · exact vertex517
  · exact vertex518
  · exact vertex520
#print axioms capacity
end Node1209Capacity034
