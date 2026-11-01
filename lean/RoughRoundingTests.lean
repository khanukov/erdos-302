import RoughRounding

-- Equal endpoints, a nontrivial interval, and a reversed interval.
example : |(((7 / 3 : ℕ) : ℝ) - ((7 / 3 : ℕ) : ℝ)) -
    ((7 : ℝ) - 7) / 3| < 1 := by
  exact RoughRounding.interval_quotient_error 7 7 3 (by decide)

example : |(((12 / 5 : ℕ) : ℝ) - ((2 / 5 : ℕ) : ℝ)) -
    ((12 : ℝ) - 2) / 5| < 1 := by
  exact RoughRounding.interval_quotient_error 2 12 5 (by decide)

example : |(((1 / 2 : ℕ) : ℝ) - ((10 / 2 : ℕ) : ℝ)) -
    ((1 : ℝ) - 10) / 2| < 1 := by
  exact RoughRounding.interval_quotient_error 10 1 2 (by decide)

#print axioms RoughRounding.interval_quotient_error
