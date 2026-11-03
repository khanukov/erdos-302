import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity014
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {171, 172, 174, 175, 176, 177, 180, 182, 183, 184}
theorem vertex171 : load 171 ≤ 1001 := by decide
#print axioms vertex171
theorem vertex172 : load 172 ≤ 1001 := by decide
#print axioms vertex172
theorem vertex174 : load 174 ≤ 1001 := by decide
#print axioms vertex174
theorem vertex175 : load 175 ≤ 1001 := by decide
#print axioms vertex175
theorem vertex176 : load 176 ≤ 1001 := by decide
#print axioms vertex176
theorem vertex177 : load 177 ≤ 1001 := by decide
#print axioms vertex177
theorem vertex180 : load 180 ≤ 1001 := by decide
#print axioms vertex180
theorem vertex182 : load 182 ≤ 1001 := by decide
#print axioms vertex182
theorem vertex183 : load 183 ≤ 1001 := by decide
#print axioms vertex183
theorem vertex184 : load 184 ≤ 1001 := by decide
#print axioms vertex184
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex171
  · exact vertex172
  · exact vertex174
  · exact vertex175
  · exact vertex176
  · exact vertex177
  · exact vertex180
  · exact vertex182
  · exact vertex183
  · exact vertex184
#print axioms capacity
end Node1209Capacity014
