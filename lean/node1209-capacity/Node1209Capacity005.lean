import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity005
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {54, 55, 56, 57, 58, 60, 62, 63, 64, 65}
theorem vertex54 : load 54 ≤ 1001 := by decide
#print axioms vertex54
theorem vertex55 : load 55 ≤ 1001 := by decide
#print axioms vertex55
theorem vertex56 : load 56 ≤ 1001 := by decide
#print axioms vertex56
theorem vertex57 : load 57 ≤ 1001 := by decide
#print axioms vertex57
theorem vertex58 : load 58 ≤ 1001 := by decide
#print axioms vertex58
theorem vertex60 : load 60 ≤ 1001 := by decide
#print axioms vertex60
theorem vertex62 : load 62 ≤ 1001 := by decide
#print axioms vertex62
theorem vertex63 : load 63 ≤ 1001 := by decide
#print axioms vertex63
theorem vertex64 : load 64 ≤ 1001 := by decide
#print axioms vertex64
theorem vertex65 : load 65 ≤ 1001 := by decide
#print axioms vertex65
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex54
  · exact vertex55
  · exact vertex56
  · exact vertex57
  · exact vertex58
  · exact vertex60
  · exact vertex62
  · exact vertex63
  · exact vertex64
  · exact vertex65
#print axioms capacity
end Node1209Capacity005
