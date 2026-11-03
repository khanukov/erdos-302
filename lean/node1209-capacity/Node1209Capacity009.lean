import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity009
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {105, 106, 108, 110, 111, 112, 114, 115, 116, 117}
theorem vertex105 : load 105 ≤ 1001 := by decide
#print axioms vertex105
theorem vertex106 : load 106 ≤ 1001 := by decide
#print axioms vertex106
theorem vertex108 : load 108 ≤ 1001 := by decide
#print axioms vertex108
theorem vertex110 : load 110 ≤ 1001 := by decide
#print axioms vertex110
theorem vertex111 : load 111 ≤ 1001 := by decide
#print axioms vertex111
theorem vertex112 : load 112 ≤ 1001 := by decide
#print axioms vertex112
theorem vertex114 : load 114 ≤ 1001 := by decide
#print axioms vertex114
theorem vertex115 : load 115 ≤ 1001 := by decide
#print axioms vertex115
theorem vertex116 : load 116 ≤ 1001 := by decide
#print axioms vertex116
theorem vertex117 : load 117 ≤ 1001 := by decide
#print axioms vertex117
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex105
  · exact vertex106
  · exact vertex108
  · exact vertex110
  · exact vertex111
  · exact vertex112
  · exact vertex114
  · exact vertex115
  · exact vertex116
  · exact vertex117
#print axioms capacity
end Node1209Capacity009
