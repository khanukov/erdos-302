import StrongerEndpoint
namespace LowerNext
open Erdos301 Erdos302FixedComposition Erdos302FinalMixedIntegration
noncomputable section
abbrev L := commonL
 theorem core : ∃ N₀ : ℕ, ∀ N ≥ N₀,
    ((5 : ℝ) / 8 + Erdos301.Analytic.roughDensity L / 24) * N - 1 ≤
      (Erdos302Lower.f302 N : ℝ) := by
  rcases eventualRoughThirdBudgets_unconditional with ⟨Nbud, hbud⟩
  let N0 : ℕ := Nbud
  refine ⟨N0, ?_⟩
  intro N hN
  have hNbud : Nbud ≤ N := hN
  let Kt : ℝ := Erdos327.Analytic.oddBudget L
  let C : Finset ℕ :=
    Erdos301.Analytic.roughThirdSet N L (128000000 : ℝ) Kt
      Erdos301.Analytic.headSlope Erdos301.Analytic.topSlope
  have hbudget := hbud N hNbud
  have hCsub : C ⊆ Erdos301.upto N := by
    simpa [C, Kt] using
      Erdos301.Analytic.roughThirdSet_subset_upto N L (128000000 : ℝ) Kt
        Erdos301.Analytic.headSlope Erdos301.Analytic.topSlope
  have hCadm : Erdos301.Admissible C := by
    simpa [C, Kt] using
      Erdos301.Analytic.roughThirdSet_admissible N L (128000000 : ℝ) Kt
        Erdos301.Analytic.headSlope Erdos301.Analytic.topSlope
  have hCdecomp : Erdos301.UpperThirdDecomposition N C := by
    unfold C
    exact Erdos301.repairedCarrier_decomposition
      Erdos301.Analytic.headSource_lowBand
      Erdos301.Analytic.topSource_topBand
  have hCcard :
      ((1 : ℝ) / 2 + Erdos301.Analytic.roughDensity L / 24) * N ≤
        (C.card : ℝ) := by
    have h := Erdos301.Analytic.roughThirdSet_card_lower_bound hbudget
    change
      ((1 : ℝ) / 2 + Erdos301.Analytic.roughDensity L / 24) * N ≤
        (C.card : ℝ)
    convert h using 1 <;> (try simp only [C, Kt]) <;> ring
  let A : Finset ℕ := C ∪ Erdos302Lower.oddQuarter N
  have hsub : A ⊆ Finset.Icc 1 N := by
    simpa [A, Erdos301.upto] using
      (Finset.union_subset hCsub
        (Erdos302Lower.oddQuarter_subset_upto N))
  have hfree : Erdos302Lower.NoUnitFractionTriple A := by
    simpa [A] using
      Erdos302Lower.padding_preserves_noUnitFractionTriple
        hCsub hCadm hCdecomp
  have hdisjoint : Disjoint C (Erdos302Lower.oddQuarter N) :=
    Erdos302Lower.oddQuarter_disjoint_structured hCdecomp
  have hcardA : A.card = C.card + (Erdos302Lower.oddQuarter N).card := by
    simpa [A] using Finset.card_union_of_disjoint hdisjoint
  have hOcard := Erdos302Lower.oddQuarter_card_real_lower N
  have hMax : A.card ≤ Erdos302Lower.f302 N :=
    Erdos302Lower.card_le_f302 hsub hfree
  have hreal : (A.card : ℝ) ≤ (Erdos302Lower.f302 N : ℝ) := by exact_mod_cast hMax
  rw [hcardA] at hreal
  push_cast at hreal
  nlinarith

 theorem endpoint (d : ℝ) (hd : d < Erdos301.Analytic.roughDensity L / 24) :
    ∃ N₀ : ℕ, ∀ N ≥ N₀,
    ((5 : ℝ) / 8 + d) * N ≤ (Erdos302Lower.f302 N : ℝ) := by
  obtain ⟨M, hM⟩ := core
  have hp : 0 < Erdos301.Analytic.roughDensity L / 24 - d := by linarith
  obtain ⟨K, hK⟩ := exists_nat_gt (1 / (Erdos301.Analytic.roughDensity L / 24 - d))
  refine ⟨max M K, ?_⟩
  intro N hN
  have hNm : M ≤ N := (le_max_left _ _).trans hN
  have hNk : K ≤ N := (le_max_right _ _).trans hN
  have hkreal : (K : ℝ) ≤ N := by exact_mod_cast hNk
  have hlarge : 1 / (Erdos301.Analytic.roughDensity L / 24 - d) < (N : ℝ) := lt_of_lt_of_le hK hkreal
  have hone : 1 < (N : ℝ) * (Erdos301.Analytic.roughDensity L / 24 - d) := by
    have := (div_lt_iff₀ hp).mp hlarge
    nlinarith
  have hc := hM N hNm
  nlinarith

 def delta2 : ℝ := 1 / (43200 * ((L : ℝ) - 1))
 theorem delta2_lt : delta2 < Erdos301.Analytic.roughDensity L / 24 := by
  have h := Erdos302StrongerEndpoint.roughDensity_stronger_lower
  have hp := Erdos302StrongerEndpoint.L_real_sub_one_pos
  unfold delta2
  have heq : (1 : ℝ) / (43200 * ((L : ℝ) - 1)) =
    ((1 : ℝ) / (1800 * ((L : ℝ) - 1))) / 24 := by
      field_simp [ne_of_gt hp] <;> norm_num
  rw [heq]
  exact div_lt_div_of_pos_right h (by norm_num)
 theorem improved : ∃ N₀ : ℕ, ∀ N ≥ N₀,
    ((5 : ℝ) / 8 + delta2) * N ≤ (Erdos302Lower.f302 N : ℝ) := endpoint delta2 delta2_lt

 def deltaLog : ℝ := 1 / (43200 * Real.log L)
 theorem deltaLog_lt : deltaLog < Erdos301.Analytic.roughDensity L / 24 := by
  have hbound : (17 : ℝ) ≤ (L : ℝ) := Nat.cast_le.2 Erdos302StrongerEndpoint.L_ge_seventeen
  have hp : 0 < Real.log (L : ℝ) := Real.log_pos (by linarith)
  have hconst := Erdos327.Analytic.one_div_1800_lt_mertensLowerConstant
  have hrough := Erdos327.Analytic.mertensLowerConstant_div_log_le_roughDensity
    (le_trans (by norm_num : 3 ≤ 17) Erdos302StrongerEndpoint.L_ge_seventeen)
  have hfirst : (1 / 1800 : ℝ) / Real.log L < Erdos327.Analytic.mertensLowerConstant / Real.log L :=
    div_lt_div_of_pos_right hconst hp
  unfold deltaLog
  have heq : (1 : ℝ) / (43200 * Real.log L) = ((1 / 1800 : ℝ) / Real.log L) / 24 := by
    field_simp [ne_of_gt hp] <;> norm_num
  rw [heq]
  exact div_lt_div_of_pos_right (hfirst.trans_le hrough) (by norm_num)
 theorem improvedLog : ∃ N₀ : ℕ, ∀ N ≥ N₀,
    ((5 : ℝ) / 8 + deltaLog) * N ≤ (Erdos302Lower.f302 N : ℝ) := endpoint deltaLog deltaLog_lt
 theorem delta2_twice : delta2 = 2 * Erdos302StrongerEndpoint.delta := by
  unfold delta2 Erdos302StrongerEndpoint.delta
  have hp := Erdos302StrongerEndpoint.L_real_sub_one_pos
  field_simp [ne_of_gt hp] <;> ring
 theorem delta2_lt_log : delta2 < deltaLog := by
  have hbound : (17 : ℝ) ≤ (L : ℝ) := Nat.cast_le.2 Erdos302StrongerEndpoint.L_ge_seventeen
  have hp : 0 < Real.log (L : ℝ) := Real.log_pos (by linarith)
  have hs := Erdos302StrongerEndpoint.L_real_sub_one_pos
  have hl := Real.log_lt_sub_one_of_pos (show (0 : ℝ) < L by linarith)
    (show (L : ℝ) ≠ 1 by linarith)
  unfold delta2 deltaLog
  apply one_div_lt_one_div_of_lt
  · positivity
  · nlinarith
#print axioms improvedLog
#print axioms delta2_lt_log

#print axioms core
#print axioms endpoint
#print axioms improved
end
end LowerNext
