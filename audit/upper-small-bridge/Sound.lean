import Checker
namespace SmallStd

theorem checked_edge {v : List Nat} {es : List Edge} {r i j k : Nat}
    (h : Checked v es r) (he : (i,j,k) ∈ es) :
    i < j ∧ j < k ∧ k < v.length ∧ 0 < v[i]! ∧ v[i]! < v[j]! ∧
    v[j]! < v[k]! ∧ v[j]! * v[k]! = v[i]! * (v[j]! + v[k]!) := by
  have hv := (List.all_eq_true.mp h.1) (i,j,k) he
  exact of_decide_eq_true hv

theorem cover_of_hits {es : List Edge} {m : Nat}
    (h : ∀ i j k, (i,j,k) ∈ es →
      m.testBit i = true ∨ m.testBit j = true ∨ m.testBit k = true) : Cover es m := by
  apply List.all_eq_true.mpr
  intro e he
  rcases e with ⟨i,j,k⟩
  have hh := h i j k he
  simp only [hits, Bool.or_eq_true] 
  rcases hh with hi | hj | hk
  · exact Or.inl (Or.inl hi)
  · exact Or.inl (Or.inr hj)
  · exact Or.inr hk

theorem lower_bound {v : List Nat} {es : List Edge} {r : Nat}
    (h : Checked v es r) (m : Nat) (hm : m < 2 ^ v.length)
    (hc : ∀ i j k, (i,j,k) ∈ es →
      m.testBit i = true ∨ m.testBit j = true ∨ m.testBit k = true) :
    r ≤ weight v.length m := sound h ⟨m,hm⟩ (cover_of_hits hc)

#print axioms checked_edge
#print axioms cover_of_hits
#print axioms lower_bound
end SmallStd
