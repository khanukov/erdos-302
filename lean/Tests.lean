import UpperBank
open UpperBank
example : check ({2, 3, 6} : Finset ℕ) {{2, 3, 6}} 1 = true := by decide
example : check ({2, 3, 6} : Finset ℕ) {{2, 3, 6}} 2 = false := by decide
example : check (∅ : Finset ℕ) ∅ 0 = true := by decide
example : check (∅ : Finset ℕ) ∅ 1 = false := by decide
