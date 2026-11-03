import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity036
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {540, 544, 546, 549, 550, 551, 552, 555, 558, 559}
theorem vertex540 : load 540 ≤ 1001 := by decide
#print axioms vertex540
theorem vertex544 : load 544 ≤ 1001 := by decide
#print axioms vertex544
theorem vertex546 : load 546 ≤ 1001 := by decide
#print axioms vertex546
theorem vertex549 : load 549 ≤ 1001 := by decide
#print axioms vertex549
theorem vertex550 : load 550 ≤ 1001 := by decide
#print axioms vertex550
theorem vertex551 : load 551 ≤ 1001 := by decide
#print axioms vertex551
theorem vertex552 : load 552 ≤ 1001 := by decide
#print axioms vertex552
theorem vertex555 : load 555 ≤ 1001 := by decide
#print axioms vertex555
theorem vertex558 : load 558 ≤ 1001 := by decide
#print axioms vertex558
theorem vertex559 : load 559 ≤ 1001 := by decide
#print axioms vertex559
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex540
  · exact vertex544
  · exact vertex546
  · exact vertex549
  · exact vertex550
  · exact vertex551
  · exact vertex552
  · exact vertex555
  · exact vertex558
  · exact vertex559
#print axioms capacity
end Node1209Capacity036
