import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity090
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {1900}
theorem vertex1900 : load 1900 ≤ 1001 := by decide
#print axioms vertex1900
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl
  · exact vertex1900
#print axioms capacity
end Node1209Capacity090
