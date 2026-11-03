import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity017
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {213, 215, 216, 217, 220, 221, 222, 224, 225, 228}
theorem vertex213 : load 213 ≤ 1001 := by decide
#print axioms vertex213
theorem vertex215 : load 215 ≤ 1001 := by decide
#print axioms vertex215
theorem vertex216 : load 216 ≤ 1001 := by decide
#print axioms vertex216
theorem vertex217 : load 217 ≤ 1001 := by decide
#print axioms vertex217
theorem vertex220 : load 220 ≤ 1001 := by decide
#print axioms vertex220
theorem vertex221 : load 221 ≤ 1001 := by decide
#print axioms vertex221
theorem vertex222 : load 222 ≤ 1001 := by decide
#print axioms vertex222
theorem vertex224 : load 224 ≤ 1001 := by decide
#print axioms vertex224
theorem vertex225 : load 225 ≤ 1001 := by decide
#print axioms vertex225
theorem vertex228 : load 228 ≤ 1001 := by decide
#print axioms vertex228
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex213
  · exact vertex215
  · exact vertex216
  · exact vertex217
  · exact vertex220
  · exact vertex221
  · exact vertex222
  · exact vertex224
  · exact vertex225
  · exact vertex228
#print axioms capacity
end Node1209Capacity017
