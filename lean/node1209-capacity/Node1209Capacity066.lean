import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity066
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1230, 1232, 1235, 1239, 1240, 1242, 1247, 1248, 1250, 1254}
theorem vertex1230 : load 1230 ≤ 1001 := by decide
#print axioms vertex1230
theorem vertex1232 : load 1232 ≤ 1001 := by decide
#print axioms vertex1232
theorem vertex1235 : load 1235 ≤ 1001 := by decide
#print axioms vertex1235
theorem vertex1239 : load 1239 ≤ 1001 := by decide
#print axioms vertex1239
theorem vertex1240 : load 1240 ≤ 1001 := by decide
#print axioms vertex1240
theorem vertex1242 : load 1242 ≤ 1001 := by decide
#print axioms vertex1242
theorem vertex1247 : load 1247 ≤ 1001 := by decide
#print axioms vertex1247
theorem vertex1248 : load 1248 ≤ 1001 := by decide
#print axioms vertex1248
theorem vertex1250 : load 1250 ≤ 1001 := by decide
#print axioms vertex1250
theorem vertex1254 : load 1254 ≤ 1001 := by decide
#print axioms vertex1254
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1230
  · exact vertex1232
  · exact vertex1235
  · exact vertex1239
  · exact vertex1240
  · exact vertex1242
  · exact vertex1247
  · exact vertex1248
  · exact vertex1250
  · exact vertex1254
#print axioms capacity
end Node1209Capacity066
