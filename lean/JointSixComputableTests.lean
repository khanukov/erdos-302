import JointSixCandidate

open JointSixCandidate

example : boundedSmooth ({2, 3} : Finset ℕ) 6 := by decide +kernel
example : ¬ boundedSmooth ({2} : Finset ℕ) 6 := by decide +kernel
example : boundedSmooth (∅ : Finset ℕ) 1 := by decide +kernel
-- The bounded test at zero is intentionally not equivalent to Smooth.
example : boundedSmooth (∅ : Finset ℕ) 0 := by decide +kernel
example : fastMultiplicity ({2, 3} : Finset ℕ) 7 8 = 0 := by decide +kernel
example : fastMultiplicity ({2, 3} : Finset ℕ) 6 24 = 1 := by decide +kernel
example : SmoothRenewal.Smooth ({2, 3} : Finset ℕ) 6 :=
  (boundedSmooth_iff _ (by decide)).mp (by decide +kernel)
