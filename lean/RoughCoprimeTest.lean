import RoughCoprime

open Finset SmoothPartition
open scoped BigOperators

-- Empty Q still requires the rough number to be positive.
example : Rough (∅ : Finset ℕ) 1 := by
  apply (rough_iff_coprime_product (Q := ∅) (n := 1) (by simp)).mpr
  simp

example : ¬ Rough (∅ : Finset ℕ) 0 := by
  intro h
  exact (Nat.lt_irrefl 0) h.1

-- A multiple of a member of Q is excluded, while 5 is included.
example : ¬ Rough ({2, 3} : Finset ℕ) 6 := by
  intro h
  have hc := (rough_iff_coprime_product (Q := {2, 3}) (n := 6) (by
    intro p hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
    rcases hp with rfl | rfl <;> norm_num)).mp h
  norm_num at hc

example : Rough ({2, 3} : Finset ℕ) 5 := by
  apply (rough_iff_coprime_product (Q := {2, 3}) (n := 5) (by
    intro p hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
    rcases hp with rfl | rfl <;> norm_num)).mpr
  norm_num

-- Composite entries demonstrate why the prime assumption is needed.
example : Rough ({4} : Finset ℕ) 2 := by
  refine ⟨by norm_num, ?_⟩
  intro p hp hmem
  simp only [Finset.mem_singleton] at hmem
  subst p
  norm_num at hp

example : ¬ Nat.Coprime 2 (∏ p ∈ ({4} : Finset ℕ), p) := by norm_num

example (Q : Finset ℕ) (N : ℕ) (hp : ∀ p ∈ Q, p.Prime) :
    ((Icc 1 N).filter (fun a => Nat.Coprime a (∏ p ∈ Q, p))).biUnion
      (block Q N) = Icc 1 N :=
  coprime_blocks_cover Q N hp

#print axioms SmoothPartition.rough_iff_coprime_product
#print axioms SmoothPartition.coprime_blocks_cover
