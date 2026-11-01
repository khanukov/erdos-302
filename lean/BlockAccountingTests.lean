import BlockAccounting

open Finset BlockAccounting

-- Two genuinely distinct blocks and nonzero demands, leaving a one-point remainder.
example : 2 + ∑ i ∈ ({0, 1} : Finset ℕ), (if i = 0 then 2 else 1) * 1 ≤ 6 := by
  apply global_block_accounting (N := 6) (A := {1, 2})
    (blocks := fun i => if i = 0 then {3, 4} else {5})
  · decide
  · intro i hi
    simp only [mem_insert, mem_singleton] at hi
    rcases hi with rfl | rfl <;> decide
  · intro i hi j hj hij
    simp only [mem_insert, mem_singleton] at hi hj
    rcases hi with rfl | rfl <;> rcases hj with rfl | rfl <;> simp_all <;> decide
  · intro i hi
    simp only [mem_insert, mem_singleton] at hi
    rcases hi with rfl | rfl <;> decide

-- Empty family and zero endpoint.
example : 0 + ∑ i ∈ (∅ : Finset ℕ), (7 : ℕ) * 3 ≤ 0 := by
  apply global_block_accounting (N := 0) (A := ∅) (blocks := fun _ => ∅)
  · decide
  · simp
  · simp
  · simp
