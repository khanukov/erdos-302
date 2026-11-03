import SparseBoundary

/-! Sound assembly of independently checked outside-vertex shards. The shard
    coverage premise must itself be proved for the literal data. -/
namespace SparseBoundaryShards

def shard (S U : List Nat) (v : Nat) : Bool :=
  (SparseTriple.candidates S [v]).all
    (fun e => decide (e.1 ∈ U ∨ e.2.1 ∈ U ∨ e.2.2 ∈ U))

theorem assemble (S T U V : List Nat)
    (ht : ∀ x, x ∈ T → x ∈ S)
    (hu : ∀ x, x ∈ U → x ∈ S ∧ x ∉ T)
    (cover : ∀ x, x ∈ SparseBoundary.outside S T → x ∈ V)
    (hs : ∀ v, v ∈ V → shard S U v = true) :
    SparseBoundary.check S T U = true := by
  apply (SparseBoundary.check_iff S T U).2
  apply (SparseBoundary.boundary_iff S T U).2
  refine ⟨ht, hu, ?_⟩
  intro a b c hc
  have h := (SparseTriple.candidates_iff S (SparseBoundary.outside S T) a b c).1 hc
  have hit (v : Nat) (hv : v ∈ SparseBoundary.outside S T)
      (hmem : a = v ∨ b = v ∨ c = v) : a ∈ U ∨ b ∈ U ∨ c ∈ U := by
    have one : (a,b,c) ∈ SparseTriple.candidates S [v] := by
      apply (SparseTriple.candidates_iff S [v] a b c).2
      refine ⟨h.1, h.2.1, h.2.2.1, h.2.2.2.1, ?_⟩
      simpa using hmem
    have hall := hs v (cover v hv)
    unfold shard at hall
    have all := List.all_eq_true.mp hall
    simpa using all (a,b,c) one
  rcases h.2.2.2.2 with ha | hb | hc
  · exact hit a ha (Or.inl rfl)
  · exact hit b hb (Or.inr (Or.inl rfl))
  · exact hit c hc (Or.inr (Or.inr rfl))

#print axioms assemble
end SparseBoundaryShards
