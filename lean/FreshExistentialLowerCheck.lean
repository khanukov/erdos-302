import Erdos302Lower

open Erdos302Lower

#check erdos302_lower_five_eighths_plus
#check erdos302_f302_lower_five_eighths_plus
#print Erdos302MaximumLowerConclusion
#print Erdos302LowerConclusion

example : ∃ δ : ℝ, 0 < δ ∧ ∃ N₀ : ℕ, ∀ N ≥ N₀,
    ((5 : ℝ) / 8 + δ) * N ≤ (f302 N : ℝ) :=
  erdos302_f302_lower_five_eighths_plus

#print axioms erdos302_lower_five_eighths_plus
#print axioms erdos302_f302_lower_five_eighths_plus
#print axioms exists_structured_roughThird_witness
#print axioms padding_preserves_noUnitFractionTriple
#print axioms not_noUnitFractionTriple_236
#print axioms full_interval_not_triple_free
#print axioms card_le_f302
