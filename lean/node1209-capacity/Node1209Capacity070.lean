import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity070
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1332, 1333, 1334, 1340, 1344, 1350, 1352, 1353, 1360, 1363}
theorem vertex1332 : load 1332 ≤ 1001 := by decide
#print axioms vertex1332
theorem vertex1333 : load 1333 ≤ 1001 := by decide
#print axioms vertex1333
theorem vertex1334 : load 1334 ≤ 1001 := by decide
#print axioms vertex1334
theorem vertex1340 : load 1340 ≤ 1001 := by decide
#print axioms vertex1340
theorem vertex1344 : load 1344 ≤ 1001 := by decide
#print axioms vertex1344
theorem vertex1350 : load 1350 ≤ 1001 := by decide
#print axioms vertex1350
theorem vertex1352 : load 1352 ≤ 1001 := by decide
#print axioms vertex1352
theorem vertex1353 : load 1353 ≤ 1001 := by decide
#print axioms vertex1353
theorem vertex1360 : load 1360 ≤ 1001 := by decide
#print axioms vertex1360
theorem vertex1363 : load 1363 ≤ 1001 := by decide
#print axioms vertex1363
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex1332
  · exact vertex1333
  · exact vertex1334
  · exact vertex1340
  · exact vertex1344
  · exact vertex1350
  · exact vertex1352
  · exact vertex1353
  · exact vertex1360
  · exact vertex1363
#print axioms capacity
end Node1209Capacity070
