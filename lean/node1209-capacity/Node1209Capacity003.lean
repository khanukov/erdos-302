import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity003
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {32, 33, 34, 35, 36, 37, 38, 39, 40, 41}
theorem vertex32 : load 32 ≤ 1001 := by decide
#print axioms vertex32
theorem vertex33 : load 33 ≤ 1001 := by decide
#print axioms vertex33
theorem vertex34 : load 34 ≤ 1001 := by decide
#print axioms vertex34
theorem vertex35 : load 35 ≤ 1001 := by decide
#print axioms vertex35
theorem vertex36 : load 36 ≤ 1001 := by decide
#print axioms vertex36
theorem vertex37 : load 37 ≤ 1001 := by decide
#print axioms vertex37
theorem vertex38 : load 38 ≤ 1001 := by decide
#print axioms vertex38
theorem vertex39 : load 39 ≤ 1001 := by decide
#print axioms vertex39
theorem vertex40 : load 40 ≤ 1001 := by decide
#print axioms vertex40
theorem vertex41 : load 41 ≤ 1001 := by decide
#print axioms vertex41
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex32
  · exact vertex33
  · exact vertex34
  · exact vertex35
  · exact vertex36
  · exact vertex37
  · exact vertex38
  · exact vertex39
  · exact vertex40
  · exact vertex41
#print axioms capacity
end Node1209Capacity003
