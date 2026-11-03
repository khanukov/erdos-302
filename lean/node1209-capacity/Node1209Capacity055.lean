import Node1209CapacityData
open Finset Node1209CapacityData
namespace Node1209Capacity055
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def vertices : Finset ℕ := {957, 960, 962, 966, 968, 969, 972, 975, 980, 984}
theorem vertex957 : load 957 ≤ 1001 := by decide
#print axioms vertex957
theorem vertex960 : load 960 ≤ 1001 := by decide
#print axioms vertex960
theorem vertex962 : load 962 ≤ 1001 := by decide
#print axioms vertex962
theorem vertex966 : load 966 ≤ 1001 := by decide
#print axioms vertex966
theorem vertex968 : load 968 ≤ 1001 := by decide
#print axioms vertex968
theorem vertex969 : load 969 ≤ 1001 := by decide
#print axioms vertex969
theorem vertex972 : load 972 ≤ 1001 := by decide
#print axioms vertex972
theorem vertex975 : load 975 ≤ 1001 := by decide
#print axioms vertex975
theorem vertex980 : load 980 ≤ 1001 := by decide
#print axioms vertex980
theorem vertex984 : load 984 ≤ 1001 := by decide
#print axioms vertex984
theorem capacity : ∀ x ∈ vertices, load x ≤ 1001 := by
  intro x hx
  simp only [vertices, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact vertex957
  · exact vertex960
  · exact vertex962
  · exact vertex966
  · exact vertex968
  · exact vertex969
  · exact vertex972
  · exact vertex975
  · exact vertex980
  · exact vertex984
#print axioms capacity
end Node1209Capacity055
