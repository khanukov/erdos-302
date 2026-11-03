import Node1209CapacityBridge

open Finset
open scoped BigOperators
namespace Node1209BridgeTests

def duplicate : List (Finset ℕ × ℕ) := [({7}, 3), ({7}, 3)]

example : Node1209CapacityBridge.load duplicate 7 = 6 := by decide
example : (∑ i ∈ Finset.univ.filter (fun i : Fin duplicate.length =>
    7 ∈ (duplicate.get i).1), (duplicate.get i).2) = 6 := by decide
example : Node1209CapacityBridge.load duplicate 8 = 0 := by decide
example : Node1209CapacityBridge.load [] 7 = 0 := by decide
example : ¬ ArchivePack.Valid (Finset.univ : Finset (Fin duplicate.length))
    (fun i => (duplicate.get i).1) (fun i => (duplicate.get i).2)
    (fun _ => 1) 5 1 {7} := by
  unfold ArchivePack.Valid
  decide
example : ArchivePack.Valid (Finset.univ : Finset (Fin duplicate.length))
    (fun i => (duplicate.get i).1) (fun i => (duplicate.get i).2)
    (fun _ => 1) 6 1 {7} := by
  apply Node1209CapacityBridge.valid_of_load duplicate _ _ _ _
  · decide
  · decide
  · decide
  · decide
end Node1209BridgeTests
