import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity049
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {814, 816, 817, 819, 820, 825, 828, 832, 833, 836}
theorem vertex814 : load 814 ≤ 1001 := by decide
#print axioms vertex814
theorem vertex816 : load 816 ≤ 1001 := by decide
#print axioms vertex816
theorem vertex817 : load 817 ≤ 1001 := by decide
#print axioms vertex817
theorem vertex819 : load 819 ≤ 1001 := by decide
#print axioms vertex819
theorem vertex820 : load 820 ≤ 1001 := by decide
#print axioms vertex820
theorem vertex825 : load 825 ≤ 1001 := by decide
#print axioms vertex825
theorem vertex828 : load 828 ≤ 1001 := by decide
#print axioms vertex828
theorem vertex832 : load 832 ≤ 1001 := by decide
#print axioms vertex832
theorem vertex833 : load 833 ≤ 1001 := by decide
#print axioms vertex833
theorem vertex836 : load 836 ≤ 1001 := by decide
#print axioms vertex836
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex814
  · exact vertex816
  · exact vertex817
  · exact vertex819
  · exact vertex820
  · exact vertex825
  · exact vertex828
  · exact vertex832
  · exact vertex833
  · exact vertex836
#print axioms capacity
end Node1209Capacity049
