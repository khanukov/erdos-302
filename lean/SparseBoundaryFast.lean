import SparseBoundaryShards

/-! Pairwise certificate: the lookup may have false positives, but must contain
all source vertices. No assumption about the list of edges is used. -/
namespace SparseBoundaryFast

def hit (U : List Nat) (a b c : Nat) : Bool :=
  decide (a ∈ U ∨ b ∈ U ∨ c ∈ U)

instance (a b c : Nat) : Decidable (SparseTriple.edge a b c) := by
  unfold SparseTriple.edge
  infer_instance

def test (p : Nat → Bool) (U : List Nat) (a b c : Nat) : Bool :=
  if SparseTriple.edge a b c ∧ p a ∧ p b ∧ p c then hit U a b c else true

def pairs (S : List Nat) (p : Nat → Bool) (U : List Nat) (v : Nat) : Bool :=
  S.all fun x =>
    test p U v x (v*x/(x-v)) &&
    test p U x v (x*v/(v-x)) &&
    test p U x (x*v/(v-x)) v

theorem test_sound (p : Nat → Bool) (U : List Nat) (a b c : Nat)
    (ha : p a = true) (hb : p b = true) (hc : p c = true)
    (he : SparseTriple.edge a b c) (ht : test p U a b c = true) :
    a ∈ U ∨ b ∈ U ∨ c ∈ U := by
  have h : hit U a b c = true := by
    simpa [test, he, ha, hb, hc] using ht
  simpa [hit] using h

theorem pairs_sound (S U : List Nat) (p : Nat → Bool) (v : Nat)
    (lookup : ∀ x, x ∈ S → p x = true) (hv : v ∈ S)
    (hp : pairs S p U v = true) :
    ∀ a b c, a ∈ S → b ∈ S → c ∈ S → SparseTriple.edge a b c →
      (a = v ∨ b = v ∨ c = v) → a ∈ U ∨ b ∈ U ∨ c ∈ U := by
  intro a b c ha hb hc he hv'
  rcases hv' with rfl | rfl | rfl
  · have h := (List.all_eq_true.mp hp) b hb
    have ht := (Bool.and_eq_true_iff.mp (Bool.and_eq_true_iff.mp h).1).1
    have q := (SparseTriple.quotient_c he).2
    rw [← q] at ht
    exact test_sound p U a b c (lookup a ha) (lookup b hb) (lookup c hc) he ht
  · have h := (List.all_eq_true.mp hp) a ha
    have ht := (Bool.and_eq_true_iff.mp (Bool.and_eq_true_iff.mp h).1).2
    have q := (SparseTriple.quotient_c he).2
    rw [← q] at ht
    exact test_sound p U a b c (lookup a ha) (lookup b hb) (lookup c hc) he ht
  · have h := (List.all_eq_true.mp hp) a ha
    have ht := (Bool.and_eq_true_iff.mp h).2
    have q := (SparseTriple.quotient_b he).2
    rw [← q] at ht
    exact test_sound p U a b c (lookup a ha) (lookup b hb) (lookup c hc) he ht

theorem pairs_to_shard (S U : List Nat) (p : Nat → Bool) (v : Nat)
    (lookup : ∀ x, x ∈ S → p x = true) (hv : v ∈ S)
    (hp : pairs S p U v = true) : SparseBoundaryShards.shard S U v = true := by
  unfold SparseBoundaryShards.shard
  apply List.all_eq_true.mpr
  intro ⟨a,b,c⟩ h
  have h := (SparseTriple.candidates_iff S [v] a b c).mp h
  have hm : a = v ∨ b = v ∨ c = v := by simpa using h.2.2.2.2
  have hit := pairs_sound S U p v lookup hv hp a b c h.1 h.2.1 h.2.2.1 h.2.2.2.1 hm
  simpa using hit

#print axioms pairs_sound
#print axioms pairs_to_shard
end SparseBoundaryFast
