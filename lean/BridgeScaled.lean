import Std

set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

namespace Erdos302Bridge

def TripleFree (A : Nat → Prop) : Prop :=
  ∀ a b c : Nat, 0 < a → a < b → b < c → b * c = a * (b + c) →
    ¬ (A a ∧ A b ∧ A c)

def missing (A : Nat → Prop) [DecidablePred A] (n : Nat) : Bool :=
  decide (¬ A n)

def bit (b : Bool) : Nat := if b then 1 else 0

theorem edge_cover (A : Nat → Prop) [DecidablePred A] (h : TripleFree A) (a b c : Nat)
    (ha : 0 < a) (hab : a < b) (hbc : b < c)
    (heq : b * c = a * (b + c)) :
    1 ≤ bit (missing A a) + bit (missing A b) + bit (missing A c) := by
  classical
  by_cases h₁ : A a <;> by_cases h₂ : A b <;> by_cases h₃ : A c
  · exact False.elim (h a b c ha hab hbc heq ⟨h₁, h₂, h₃⟩)
  all_goals simp [missing, bit, h₁, h₂, h₃]

-- Certificate's finite weighted implication, checked by the kernel.
theorem weighted_boolean :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x0 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x0 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x2 + bit x5 + bit x6) ∧ (1 ≤ bit x3 + bit x5 + bit x7)) → (5 : Int) ≤ (2 : Int) * (bit x0 : Int) + (2 : Int) * (bit x1 : Int) + (2 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (2 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (2 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) := by
  decide +kernel

-- A concrete set consequence, in the same order and weights as certificate t4.
theorem eight_vertex_weighted (A : Nat → Prop) [DecidablePred A] (h : TripleFree A) :
    (5 : Int) ≤ 2 * (bit (missing A 12) : Int) +
      2 * (bit (missing A 15) : Int) + 2 * (bit (missing A 20) : Int) +
      1 * (bit (missing A 21) : Int) + 2 * (bit (missing A 28) : Int) +
      1 * (bit (missing A 30) : Int) + 2 * (bit (missing A 60) : Int) +
      1 * (bit (missing A 70) : Int) := by
  apply weighted_boolean
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;>
    apply edge_cover A h <;> decide

-- Positive dilation preserves every polynomial edge.
theorem tripleFree_dilation (A : Nat → Prop) (h : TripleFree A)
    (k : Nat) (hk : 0 < k) : TripleFree (fun n => A (k * n)) := by
  intro a b c ha hab hbc heq
  apply h (k*a) (k*b) (k*c)
  · exact Nat.mul_pos hk ha
  · exact Nat.mul_lt_mul_of_pos_left hab hk
  · exact Nat.mul_lt_mul_of_pos_left hbc hk
  · calc
      (k*b)*(k*c) = (k*k)*(b*c) := by simp only [Nat.mul_left_comm, Nat.mul_comm]
      _ = (k*k)*(a*(b+c)) := congrArg (fun x => (k*k)*x) heq
      _ = (k*a)*(k*b+k*c) := by
        simp only [Nat.mul_add]
        congr 1 <;> simp only [Nat.mul_left_comm, Nat.mul_comm]

theorem eight_vertex_weighted_scaled (A : Nat → Prop) [DecidablePred A]
    (h : TripleFree A) (k : Nat) (hk : 0 < k) :
    (5 : Int) ≤ 2 * (bit (missing A (k*12)) : Int) +
      2 * (bit (missing A (k*15)) : Int) + 2 * (bit (missing A (k*20)) : Int) +
      1 * (bit (missing A (k*21)) : Int) + 2 * (bit (missing A (k*28)) : Int) +
      1 * (bit (missing A (k*30)) : Int) + 2 * (bit (missing A (k*60)) : Int) +
      1 * (bit (missing A (k*70)) : Int) := by
  exact eight_vertex_weighted (fun n => A (k*n)) (tripleFree_dilation A h k hk)

#print axioms tripleFree_dilation
#print axioms eight_vertex_weighted_scaled
end Erdos302Bridge
