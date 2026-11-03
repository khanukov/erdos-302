import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity071
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1364, 1365, 1368, 1372, 1375, 1376, 1377, 1378, 1380, 1386}
theorem vertex1364 : load 1364 ≤ 1001 := by decide
#print axioms vertex1364
theorem vertex1365 : load 1365 ≤ 1001 := by decide
#print axioms vertex1365
theorem vertex1368 : load 1368 ≤ 1001 := by decide
#print axioms vertex1368
theorem vertex1372 : load 1372 ≤ 1001 := by decide
#print axioms vertex1372
theorem vertex1375 : load 1375 ≤ 1001 := by decide
#print axioms vertex1375
theorem vertex1376 : load 1376 ≤ 1001 := by decide
#print axioms vertex1376
theorem vertex1377 : load 1377 ≤ 1001 := by decide
#print axioms vertex1377
theorem vertex1378 : load 1378 ≤ 1001 := by decide
#print axioms vertex1378
theorem vertex1380 : load 1380 ≤ 1001 := by decide
#print axioms vertex1380
theorem vertex1386 : load 1386 ≤ 1001 := by decide
#print axioms vertex1386
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1364
  · exact vertex1365
  · exact vertex1368
  · exact vertex1372
  · exact vertex1375
  · exact vertex1376
  · exact vertex1377
  · exact vertex1378
  · exact vertex1380
  · exact vertex1386
#print axioms capacity
end Node1209Capacity071
