import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity064
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1184, 1188, 1189, 1190, 1196, 1197, 1200, 1204, 1206, 1209}
theorem vertex1184 : load 1184 ≤ 1001 := by decide
#print axioms vertex1184
theorem vertex1188 : load 1188 ≤ 1001 := by decide
#print axioms vertex1188
theorem vertex1189 : load 1189 ≤ 1001 := by decide
#print axioms vertex1189
theorem vertex1190 : load 1190 ≤ 1001 := by decide
#print axioms vertex1190
theorem vertex1196 : load 1196 ≤ 1001 := by decide
#print axioms vertex1196
theorem vertex1197 : load 1197 ≤ 1001 := by decide
#print axioms vertex1197
theorem vertex1200 : load 1200 ≤ 1001 := by decide
#print axioms vertex1200
theorem vertex1204 : load 1204 ≤ 1001 := by decide
#print axioms vertex1204
theorem vertex1206 : load 1206 ≤ 1001 := by decide
#print axioms vertex1206
theorem vertex1209 : load 1209 ≤ 1001 := by decide
#print axioms vertex1209
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1184
  · exact vertex1188
  · exact vertex1189
  · exact vertex1190
  · exact vertex1196
  · exact vertex1197
  · exact vertex1200
  · exact vertex1204
  · exact vertex1206
  · exact vertex1209
#print axioms capacity
end Node1209Capacity064
