import Std

/-! Sparse candidates use one deleted vertex and one source vertex.  The
    product equality is the exact-division guard (not truncated division). -/
namespace SparseTriple

def edge (a b c : Nat) : Prop := 0 < a ∧ a < b ∧ b < c ∧ b*c = a*(b+c)
def enumerated (S D : List Nat) (a b c : Nat) : Prop :=
  a ∈ S ∧ b ∈ S ∧ c ∈ S ∧ edge a b c ∧
  ((a ∈ D ∧ c = a*b/(b-a) ∧ a*b = c*(b-a)) ∨
   (b ∈ D ∧ c = a*b/(b-a) ∧ a*b = c*(b-a)) ∨
   (c ∈ D ∧ b = a*c/(c-a) ∧ a*c = b*(c-a)))

instance (S D : List Nat) (a b c : Nat) : Decidable (enumerated S D a b c) := by
  unfold enumerated edge
  infer_instance

theorem quotient_c {a b c : Nat} (h : edge a b c) :
    a*b = c*(b-a) ∧ c = a*b/(b-a) := by
  rcases h with ⟨_, hab, _, he⟩
  have hh : c * (b-a) + c*a = c*b := by
    rw [← Nat.mul_add, Nat.sub_add_cancel (Nat.le_of_lt hab)]
  have hx : a*b + a*c = b*c := by simpa [Nat.mul_add] using he.symm
  have hy : a*b = c*(b-a) := by
    rw [Nat.mul_comm c a, Nat.mul_comm c b] at hh
    omega
  refine ⟨hy, ?_⟩
  rw [hy, Nat.mul_comm c (b-a), Nat.mul_div_cancel_left _ (by omega : 0 < b-a)]

theorem quotient_b {a b c : Nat} (h : edge a b c) :
    a*c = b*(c-a) ∧ b = a*c/(c-a) := by
  rcases h with ⟨_, hab, hbc, he⟩
  have hh : b * (c-a) + b*a = b*c := by
    rw [← Nat.mul_add, Nat.sub_add_cancel (by omega : a ≤ c)]
  have hx : a*b + a*c = b*c := by simpa [Nat.mul_add] using he.symm
  have hy : a*c = b*(c-a) := by
    rw [Nat.mul_comm b a] at hh
    omega
  refine ⟨hy, ?_⟩
  rw [hy, Nat.mul_comm b (c-a), Nat.mul_div_cancel_left _ (by omega : 0 < c-a)]

theorem enumerated_iff (S D : List Nat) (a b c : Nat) :
    enumerated S D a b c ↔
    a ∈ S ∧ b ∈ S ∧ c ∈ S ∧ edge a b c ∧ (a ∈ D ∨ b ∈ D ∨ c ∈ D) := by
  constructor
  · rintro ⟨ha,hb,hc,he,h⟩
    refine ⟨ha,hb,hc,he,?_⟩
    rcases h with h | h | h
    · exact Or.inl h.1
    · exact Or.inr (Or.inl h.1)
    · exact Or.inr (Or.inr h.1)
  · rintro ⟨ha,hb,hc,he,h⟩
    refine ⟨ha,hb,hc,he,?_⟩
    have hc := quotient_c he
    have hb := quotient_b he
    rcases h with h | h | h
    · exact Or.inl ⟨h,hc.2,hc.1⟩
    · exact Or.inr (Or.inl ⟨h,hc.2,hc.1⟩)
    · exact Or.inr (Or.inr ⟨h,hb.2,hb.1⟩)

def candidates (S D : List Nat) : List (Nat × Nat × Nat) :=
  (D.flatMap fun v => S.flatMap fun x =>
    [(v,x,v*x/(x-v)), (x,v,x*v/(v-x)), (x,x*v/(v-x),v)]).filter fun t =>
      decide (enumerated S D t.1 t.2.1 t.2.2)

theorem candidates_iff (S D : List Nat) (a b c : Nat) :
    (a,b,c) ∈ candidates S D ↔
    a ∈ S ∧ b ∈ S ∧ c ∈ S ∧ edge a b c ∧ (a ∈ D ∨ b ∈ D ∨ c ∈ D) := by
  constructor
  · intro h
    have he : enumerated S D a b c := by
      simpa [candidates] using (List.mem_filter.mp h).2
    exact (enumerated_iff S D a b c).mp he
  · intro h
    have he := (enumerated_iff S D a b c).mpr h
    apply List.mem_filter.mpr
    refine ⟨?_, by simpa using he⟩
    simp only [List.mem_flatMap, List.mem_cons, List.not_mem_nil, or_false, Prod.mk.injEq]
    rcases he.2.2.2.2 with ha | hb | hc
    · exact ⟨a, ha.1, b, h.2.1, Or.inl ⟨rfl, rfl, ha.2.1⟩⟩
    · exact ⟨b, hb.1, a, h.1, Or.inr (Or.inl ⟨rfl, rfl, hb.2.1⟩)⟩
    · exact ⟨c, hc.1, a, h.1, Or.inr (Or.inr ⟨rfl, hc.2.1, rfl⟩)⟩

#print axioms candidates_iff
#print axioms enumerated_iff
end SparseTriple
