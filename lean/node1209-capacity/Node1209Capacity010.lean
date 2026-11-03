import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity010
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {118, 119, 120, 121, 122, 123, 124, 125, 126, 128}
theorem vertex118 : load 118 ≤ 1001 := by decide
#print axioms vertex118
theorem vertex119 : load 119 ≤ 1001 := by decide
#print axioms vertex119
theorem vertex120 : load 120 ≤ 1001 := by decide
#print axioms vertex120
theorem vertex121 : load 121 ≤ 1001 := by decide
#print axioms vertex121
theorem vertex122 : load 122 ≤ 1001 := by decide
#print axioms vertex122
theorem vertex123 : load 123 ≤ 1001 := by decide
#print axioms vertex123
theorem vertex124 : load 124 ≤ 1001 := by decide
#print axioms vertex124
theorem vertex125 : load 125 ≤ 1001 := by decide
#print axioms vertex125
theorem vertex126 : load 126 ≤ 1001 := by decide
#print axioms vertex126
theorem vertex128 : load 128 ≤ 1001 := by decide
#print axioms vertex128
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex118
  · exact vertex119
  · exact vertex120
  · exact vertex121
  · exact vertex122
  · exact vertex123
  · exact vertex124
  · exact vertex125
  · exact vertex126
  · exact vertex128
#print axioms capacity
end Node1209Capacity010
