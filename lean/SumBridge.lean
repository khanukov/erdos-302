import Summation
import RoughDiscrepancy

/-! Candidate only: requires hosted Lean checking. The integer boundary premise
is the precise scaled floor-loss budget, not a bound on the rough count. -/
namespace ArchiveSumBridge
open Finset

noncomputable def density (S : Finset ℕ) : ℝ :=
  ∏ p ∈ S, (1 - (1 : ℝ) / p)

/-- Clearing positive denominators gives an entirely integer test for the
one-unit loss incurred by replacing quotient endpoints by real endpoints. -/
def boundaryOK (N a b : ℕ) : Prop :=
  (N : ℤ) * ((b : ℤ) - (a : ℤ)) -
    (a : ℤ) * (b : ℤ) * (((N / a : ℕ) : ℤ) - ((N / b : ℕ) : ℤ))
      ≤ (a : ℤ) * (b : ℤ)

theorem real_endpoint_loss_le_one (N a b : ℕ)
    (ha : 0 < a) (hb : 0 < b) (hboundary : boundaryOK N a b) :
    (N : ℝ) * (1 / (a : ℝ) - 1 / (b : ℝ)) -
      (((N / a : ℕ) : ℝ) - ((N / b : ℕ) : ℝ)) ≤ 1 := by
  have ha' : (0 : ℝ) < a := by exact_mod_cast ha
  have hb' : (0 : ℝ) < b := by exact_mod_cast hb
  have hz : (N : ℝ) * ((b : ℝ) - (a : ℝ)) -
      (a : ℝ) * (b : ℝ) * (((N / a : ℕ) : ℝ) - ((N / b : ℕ) : ℝ)) ≤
        (a : ℝ) * (b : ℝ) := by
    unfold boundaryOK at hboundary
    exact_mod_cast hboundary
  have hab : 0 < (a : ℝ) * (b : ℝ) := mul_pos ha' hb'
  apply le_of_mul_le_mul_right ?_ hab
  field_simp [ne_of_gt ha', ne_of_gt hb']
  nlinarith

/-- Per-cell rough count, with the exact archive ideal and the actual floor
correction retained. The prime-set size error is sharper than 2^j. -/
theorem cell_lower_exact (N a b : ℕ) (S : Finset ℕ)
    (ha : 0 < a) (hLU : N / b ≤ N / a)
    (hprime : ∀ p ∈ S, Nat.Prime p) :
    (N : ℝ) * density S * (1 / (a : ℝ) - 1 / (b : ℝ)) -
      ((2 : ℝ) ^ S.card + density S *
        ((N : ℝ) * (1 / (a : ℝ) - 1 / (b : ℝ)) -
          (((N / a : ℕ) : ℝ) - ((N / b : ℕ) : ℝ)))) ≤
      (ArchiveSummation.cellCount N a b
        (fun q => Nat.Coprime q (∏ p ∈ S, p)) : ℝ) := by
  classical
  have hd := RoughDiscrepancy.card_coprime_Ioc_discrepancy
    (N / b) (N / a) S hLU hprime
  have hl := (abs_le.mp hd).1
  rw [ArchiveSummation.count_cell_eq N a b _ ha]
  dsimp [density] at *
  nlinarith

/-- The integer boundary test, density bound and error budget derive the
per-cell hypothesis used by the global summation theorem. -/
theorem cell_lower_archive (N a b j : ℕ) (S : Finset ℕ)
    (ha : 0 < a) (hb : 0 < b) (hLU : N / b ≤ N / a)
    (hprime : ∀ p ∈ S, Nat.Prime p)
    (hrho : 0 ≤ density S ∧ density S ≤ 1)
    (hboundary : boundaryOK N a b)
    (hbudget : (2 : ℝ) ^ S.card + 1 ≤ (2 : ℝ) ^ j) :
    (N : ℝ) * density S * (1 / (a : ℝ) - 1 / (b : ℝ)) - (2 : ℝ) ^ j ≤
      (ArchiveSummation.cellCount N a b
        (fun q => Nat.Coprime q (∏ p ∈ S, p)) : ℝ) := by
  have he := real_endpoint_loss_le_one N a b ha hb hboundary
  have hm := mul_le_mul_of_nonneg_left he hrho.1
  have hc := cell_lower_exact N a b S ha hLU hprime
  nlinarith [hrho.2]

/-- Integration with the global ledger. The cover premise remains independent;
the per-cell inequalities are derived from discrepancy and endpoint inputs. -/
theorem global_upper_archive {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (N : ℕ) (f : ℝ) (h : ι → ℝ)
    (a b j : ι → ℕ) (S : ι → Finset ℕ)
    (hh : ∀ i ∈ s, 0 ≤ h i)
    (ha : ∀ i ∈ s, 0 < a i) (hb : ∀ i ∈ s, 0 < b i)
    (hLU : ∀ i ∈ s, N / b i ≤ N / a i)
    (hprime : ∀ i ∈ s, ∀ p ∈ S i, Nat.Prime p)
    (hrho : ∀ i ∈ s, 0 ≤ density (S i) ∧ density (S i) ≤ 1)
    (hboundary : ∀ i ∈ s, boundaryOK N (a i) (b i))
    (hbudget : ∀ i ∈ s, (2 : ℝ) ^ (S i).card + 1 ≤ (2 : ℝ) ^ (j i))
    (hcover : f + ArchiveSummation.weightedCount s h
      (fun i => (ArchiveSummation.cellCount N (a i) (b i)
        (fun q => Nat.Coprime q (∏ p ∈ S i, p)) : ℝ)) ≤ N) :
    f ≤ (N : ℝ) - ArchiveSummation.weightedIdeal s h
      (fun i => (N : ℝ) * density (S i) * (1 / (a i : ℝ) - 1 / (b i : ℝ))) +
      ArchiveSummation.weightedError s h (fun i => (2 : ℝ) ^ (j i)) := by
  apply ArchiveSummation.global_upper s h _ _ _ N f hh
  · intro i hi
    exact cell_lower_archive N (a i) (b i) (j i) (S i)
      (ha i hi) (hb i hi) (hLU i hi) (hprime i hi) (hrho i hi)
      (hboundary i hi) (hbudget i hi)
  · exact hcover

#print axioms real_endpoint_loss_le_one
#print axioms cell_lower_exact
#print axioms cell_lower_archive
#print axioms global_upper_archive
end ArchiveSumBridge
