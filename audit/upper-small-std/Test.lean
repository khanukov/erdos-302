import Checker
open SmallStd
example : Checked [6, 10, 15] [(0, 1, 2)] 1 := by decide
example : ¬ Checked [6, 10, 15] [(0, 1, 2)] 2 := by decide
example : ¬ Checked [6, 10, 16] [(0, 1, 2)] 1 := by decide
#print axioms SmallStd.sound
