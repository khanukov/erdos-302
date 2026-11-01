import LowerNext
import StrongerLiminf

namespace LowerNextLiminf
open Filter
noncomputable section

private theorem f302_le_N (N : ℕ) : Erdos302Lower.f302 N ≤ N := by
  classical
  unfold Erdos302Lower.f302
  apply Finset.sup_le
  intro A hA
  have hsub : A ⊆ Finset.Icc 1 N :=
    Finset.mem_powerset.mp (Finset.mem_filter.mp hA).1
  exact (Finset.card_le_card hsub).trans (by simp)

theorem lower :
    (5 : ℝ) / 8 + Erdos301.Analytic.roughDensity LowerNext.L / 24 ≤
      liminf Erdos302StrongerEndpoint.normalizedF302 atTop := by
  have hcob : IsCoboundedUnder (fun x₁ x₂ : ℝ => x₁ ≥ x₂) atTop
      Erdos302StrongerEndpoint.normalizedF302 :=
    isCoboundedUnder_ge_of_eventually_le atTop (by
      filter_upwards [eventually_ge_atTop 1] with N hN
      have hposNat : 0 < N := hN
      have hpos : (0 : ℝ) < N := by exact_mod_cast hposNat
      unfold Erdos302StrongerEndpoint.normalizedF302
      apply (div_le_one hpos).2
      exact_mod_cast f302_le_N N)
  apply le_of_forall_lt
  intro x hx
  obtain ⟨y, hxy, hy⟩ := exists_between hx
  have hd : y - (5 : ℝ) / 8 < Erdos301.Analytic.roughDensity LowerNext.L / 24 := by linarith
  obtain ⟨N₀, hN₀⟩ := LowerNext.endpoint (y - (5 : ℝ) / 8) hd
  have hybound : y ≤ liminf Erdos302StrongerEndpoint.normalizedF302 atTop := by
    apply le_liminf_of_le hcob
    filter_upwards [eventually_ge_atTop (max N₀ 1)] with N hN
    have hlarge : N₀ ≤ N := (le_max_left _ _).trans hN
    have hposNat : 0 < N := (le_max_right N₀ 1).trans hN
    have hpos : (0 : ℝ) < N := by exact_mod_cast hposNat
    unfold Erdos302StrongerEndpoint.normalizedF302
    apply (le_div_iff₀ hpos).2
    have h := hN₀ N hlarge
    have heq : (5 : ℝ) / 8 + (y - 5 / 8) = y := by ring
    rw [heq] at h
    exact h
  exact lt_of_lt_of_le hxy hybound

theorem log_lower :
    (5 : ℝ) / 8 + LowerNext.deltaLog ≤
      liminf Erdos302StrongerEndpoint.normalizedF302 atTop := by
  linarith [LowerNext.deltaLog_lt, lower]

#print axioms lower
#print axioms log_lower
end
end LowerNextLiminf
