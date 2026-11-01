import ReciprocalBridge

open UpperBridge

-- Both input orders of the same rational triple are accepted.
example : 6 < 10 ∧ 6 < 15 := by
  apply reciprocal_lt_denominators (a := 6) (b := 10) (c := 15) <;> norm_num

example : OrderedEdge ({6, 10, 15} : Finset ℕ) 6 15 10 ∨
    OrderedEdge ({6, 10, 15} : Finset ℕ) 6 10 15 := by
  apply reciprocal_ordered_edge <;> norm_num

-- Regression: distinct right denominators are necessary for an ordered edge.
example : (1 : ℚ) / 1 = 1 / 2 + 1 / 2 := by norm_num
example : ¬ (OrderedEdge ({1, 2} : Finset ℕ) 1 2 2) := by
  norm_num [OrderedEdge]

-- Regression: without positivity, rational division by zero admits a false edge.
example : (1 : ℚ) / 0 = 1 / 0 + 1 / 0 := by norm_num

-- The upstream predicate is the actual upstream declaration, not a copy.
example {S : Finset ℕ} (h : OrderedCover ({6, 10, 15} : Finset ℕ) S) :
    Erdos302CoverRowsFC.NoUnitFractionCover ({6, 10, 15} : Finset ℕ) S := by
  apply orderedCover_to_upstream _ h
  intro x hx
  simp only [Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl <;> norm_num
