import Summation

open Finset ArchiveSummation

-- A finite two-cell ledger, including a zero-height row and negative deviations.
example : weightedCount (Finset.range 3) (fun i => if i = 0 then 2 else if i = 1 then 1 else 0)
    (fun i => if i = 0 then 3 else if i = 1 then 4 else 100) = 10 := by
  norm_num [weightedCount, Finset.sum_range_succ]

-- This exercises the actual aggregation theorem without assuming the conclusion.
example : (8 : ℝ) ≤ weightedCount (Finset.range 2) (fun _ => 1)
    (fun i => if i = 0 then 3 else 5) := by
  have h := weightedCount_lower (Finset.range 2) (fun _ => 1)
    (fun i => if i = 0 then 3 else 5)
    (fun i => if i = 0 then (4 : ℝ) else 5) (fun _ => 1)
    (by intro i hi; positivity)
    (by intro i hi; simp only [Finset.mem_range] at hi; interval_cases i <;> norm_num)
  norm_num [weightedCount, weightedIdeal, weightedError, Finset.sum_range_succ] at h ⊢

-- Exact endpoint behavior, including an empty interval.
example (N : ℕ) : cellCount N 2 2 = 0 := by
  rw [count_cell_eq N 2 2 (fun _ => True) (by decide)]
  simp

#print axioms weightedCount_lower
#print axioms count_cell_eq
#print axioms global_upper
