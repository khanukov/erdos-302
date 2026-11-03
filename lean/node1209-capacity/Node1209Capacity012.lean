import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity012
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {142, 143, 144, 145, 147, 148, 150, 152, 153, 154}
theorem vertex142 : load 142 ≤ 1001 := by decide
#print axioms vertex142
theorem vertex143 : load 143 ≤ 1001 := by decide
#print axioms vertex143
theorem vertex144 : load 144 ≤ 1001 := by decide
#print axioms vertex144
theorem vertex145 : load 145 ≤ 1001 := by decide
#print axioms vertex145
theorem vertex147 : load 147 ≤ 1001 := by decide
#print axioms vertex147
theorem vertex148 : load 148 ≤ 1001 := by decide
#print axioms vertex148
theorem vertex150 : load 150 ≤ 1001 := by decide
#print axioms vertex150
theorem vertex152 : load 152 ≤ 1001 := by decide
#print axioms vertex152
theorem vertex153 : load 153 ≤ 1001 := by decide
#print axioms vertex153
theorem vertex154 : load 154 ≤ 1001 := by decide
#print axioms vertex154
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex142
  · exact vertex143
  · exact vertex144
  · exact vertex145
  · exact vertex147
  · exact vertex148
  · exact vertex150
  · exact vertex152
  · exact vertex153
  · exact vertex154
#print axioms capacity
end Node1209Capacity012
