import LowerNext
open LowerNext
noncomputable section
#check LowerNext.improvedLog
#check LowerNext.endpoint
#print axioms LowerNext.improvedLog
#print axioms LowerNext.delta2_lt_log
example : 0 < deltaLog := by
  have h : (1 : ℝ) < (L : ℝ) := by
    have hb : (17 : ℝ) ≤ (L : ℝ) := Nat.cast_le.2 Erdos302StrongerEndpoint.L_ge_seventeen
    linarith
  unfold deltaLog
  exact one_div_pos.mpr (mul_pos (by norm_num) (Real.log_pos h))
example : deltaLog > 2 * Erdos302StrongerEndpoint.delta := by
  rw [← delta2_twice]
  exact delta2_lt_log
-- The absorption is strict: equality d = rho/24 yields no positive gap.
example : Erdos301.Analytic.roughDensity L / 24 -
    Erdos301.Analytic.roughDensity L / 24 = 0 := by ring
-- Rounding boundary: at gap*N = 1, absorption is equality, not strict.
example (x : ℝ) (h : x = 1) : x - 1 = 0 := by linarith
-- Below that boundary, the -1 estimate alone cannot imply endpoint.
example : ((5 : ℝ) / 8 + 1 / 2) * 1 - 1 <
    ((5 : ℝ) / 8 + 0) * 1 := by norm_num
end
