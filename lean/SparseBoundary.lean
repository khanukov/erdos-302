import SparseTriple

/-! A complete boundary check must enumerate vertices outside the target, not
    vertices in the deletion. This file makes no archive provenance claim. -/
namespace SparseBoundary

def Boundary (S T U : List Nat) : Prop :=
  (∀ x, x ∈ T → x ∈ S) ∧
  (∀ x, x ∈ U → x ∈ S ∧ x ∉ T) ∧
  ∀ a b c, a ∈ S → b ∈ S → c ∈ S → SparseTriple.edge a b c →
    (a ∈ T ∧ b ∈ T ∧ c ∈ T) ∨ (a ∈ U ∨ b ∈ U ∨ c ∈ U)

def outside (S T : List Nat) : List Nat := S.filter (fun x => ! (x ∈ T))

theorem mem_outside (S T : List Nat) (x : Nat) :
    x ∈ outside S T ↔ x ∈ S ∧ x ∉ T := by
  simp [outside]

theorem candidates_iff_outside (S T : List Nat) (a b c : Nat) :
    (a,b,c) ∈ SparseTriple.candidates S (outside S T) ↔
    a ∈ S ∧ b ∈ S ∧ c ∈ S ∧ SparseTriple.edge a b c ∧
    ¬ (a ∈ T ∧ b ∈ T ∧ c ∈ T) := by
  rw [SparseTriple.candidates_iff]
  simp only [mem_outside]
  constructor
  · rintro ⟨ha,hb,hc,he,h⟩
    refine ⟨ha,hb,hc,he,?_⟩
    rcases h with h | h | h <;> intro ht
    · exact h.2 ht.1
    · exact h.2 ht.2.1
    · exact h.2 ht.2.2
  · rintro ⟨ha,hb,hc,he,h⟩
    refine ⟨ha,hb,hc,he,?_⟩
    by_cases hta : a ∈ T
    · by_cases htb : b ∈ T
      · right; right; exact ⟨hc, fun htc => h ⟨hta,htb,htc⟩⟩
      · right; left; exact ⟨hb,htb⟩
    · left; exact ⟨ha,hta⟩

theorem boundary_iff (S T U : List Nat) :
    Boundary S T U ↔
      (∀ x, x ∈ T → x ∈ S) ∧
      (∀ x, x ∈ U → x ∈ S ∧ x ∉ T) ∧
      ∀ a b c, (a,b,c) ∈ SparseTriple.candidates S (outside S T) →
        a ∈ U ∨ b ∈ U ∨ c ∈ U := by
  constructor
  · intro h
    refine ⟨h.1,h.2.1,?_⟩
    intro a b c hc
    obtain ⟨ha,hb,hc,he,hn⟩ := (candidates_iff_outside S T a b c).mp hc
    rcases h.2.2 a b c ha hb hc he with ht | hu
    · exact False.elim (hn ht)
    · exact hu
  · intro h
    refine ⟨h.1,h.2.1,?_⟩
    intro a b c ha hb hc he
    by_cases ht : a ∈ T ∧ b ∈ T ∧ c ∈ T
    · exact Or.inl ht
    · right
      exact h.2.2 a b c ((candidates_iff_outside S T a b c).mpr ⟨ha,hb,hc,he,ht⟩)

/-- Executable decision, independent of any supplied edge list. -/
def check (S T U : List Nat) : Bool :=
  T.all (fun x => decide (x ∈ S)) &&
  U.all (fun x => decide (x ∈ S ∧ x ∉ T)) &&
  (SparseTriple.candidates S (outside S T)).all
    (fun e => decide (e.1 ∈ U ∨ e.2.1 ∈ U ∨ e.2.2 ∈ U))

theorem check_iff (S T U : List Nat) : check S T U = true ↔ Boundary S T U := by
  rw [boundary_iff]
  simp only [check, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq]
  constructor
  · rintro ⟨⟨ht, hu⟩, he⟩
    refine ⟨ht, hu, ?_⟩
    intro a b c h
    exact he (a,b,c) h
  · rintro ⟨ht, hu, he⟩
    refine ⟨⟨ht, hu⟩, ?_⟩
    intro ⟨a,b,c⟩ h
    exact he a b c h

#print axioms check_iff
#print axioms candidates_iff_outside
#print axioms boundary_iff
end SparseBoundary
