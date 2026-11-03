import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity004
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {42, 43, 44, 45, 46, 48, 49, 50, 51, 52}
theorem vertex42 : load 42 ≤ 1001 := by decide
#print axioms vertex42
theorem vertex43 : load 43 ≤ 1001 := by decide
#print axioms vertex43
theorem vertex44 : load 44 ≤ 1001 := by decide
#print axioms vertex44
theorem vertex45 : load 45 ≤ 1001 := by decide
#print axioms vertex45
theorem vertex46 : load 46 ≤ 1001 := by decide
#print axioms vertex46
theorem vertex48 : load 48 ≤ 1001 := by decide
#print axioms vertex48
theorem vertex49 : load 49 ≤ 1001 := by decide
#print axioms vertex49
theorem vertex50 : load 50 ≤ 1001 := by decide
#print axioms vertex50
theorem vertex51 : load 51 ≤ 1001 := by decide
#print axioms vertex51
theorem vertex52 : load 52 ≤ 1001 := by decide
#print axioms vertex52
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex42
  · exact vertex43
  · exact vertex44
  · exact vertex45
  · exact vertex46
  · exact vertex48
  · exact vertex49
  · exact vertex50
  · exact vertex51
  · exact vertex52
#print axioms capacity
end Node1209Capacity004
