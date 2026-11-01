import Std
namespace SmallStd
abbrev Edge := Nat × Nat × Nat

def validEdge (v : List Nat) (e : Edge) : Bool :=
  let (i,j,k) := e
  let a := v[i]!
  let b := v[j]!
  let c := v[k]!
  decide (i < j ∧ j < k ∧ k < v.length ∧ 0 < a ∧ a < b ∧ b < c ∧ b*c = a*(b+c))

def hits (m : Nat) (e : Edge) : Bool :=
  let (i,j,k) := e
  m.testBit i || m.testBit j || m.testBit k

def weight (n m : Nat) : Nat := ((List.range n).filter (fun i => m.testBit i)).length

def Cover (es : List Edge) (m : Nat) : Prop := es.all (hits m) = true
instance (es : List Edge) (m : Nat) : Decidable (Cover es m) := inferInstanceAs (Decidable (_ = _))

def Checked (v : List Nat) (es : List Edge) (r : Nat) : Prop :=
  es.all (validEdge v) = true ∧ ∀ m : Fin (2 ^ v.length), Cover es m.val → r ≤ weight v.length m.val
instance (v : List Nat) (es : List Edge) (r : Nat) : Decidable (Checked v es r) := by
  unfold Checked
  infer_instance

theorem sound {v : List Nat} {es : List Edge} {r : Nat} (h : Checked v es r)
    (m : Fin (2 ^ v.length)) (hc : Cover es m.val) : r ≤ weight v.length m.val := h.2 m hc

theorem edges_sound {v : List Nat} {es : List Edge} {r : Nat} (h : Checked v es r) :
    es.all (validEdge v) = true := h.1
#print axioms sound
#print axioms edges_sound
end SmallStd
