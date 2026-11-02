import ArchiveGainPrefix
import DensityPrefixCandidate
import Mathlib.Algebra.BigOperators.Fin

/-! Hosted-check candidate: no aggregate-matching hypothesis. The list and Fin
indices count occurrences, including equal entries at different positions. -/
namespace HGainCandidate
open ArchiveLedgerSumBridge

 theorem entries_match (prior : List ℕ) (ls : List ArchiveLedger.Level) :
    (GainPrefix.entriesFrom prior (ls.map ArchiveGainPrefix.convert)).map
      (fun e => (⟨e.1, e.2⟩ : Entry)) = entriesFrom prior ls := by
  induction ls generalizing prior with
  | nil => rfl
  | cons l ls ih =>
    simp only [List.map_cons, GainPrefix.entriesFrom, entriesFrom,
      List.map_append, List.map_map, ArchiveGainPrefix.convert, Function.comp_def, ih]

def contribution (e : Entry) : ℚ :=
  ArchiveGainPrefix.weight (e.prior.foldl ArchiveGainPrefix.update 1) e.cell

private theorem fold_sum (xs : List ℚ) (a : ℚ) :
    xs.foldl (· + ·) a = a + xs.sum := by
  induction xs generalizing a with
  | nil => simp
  | cons x xs ih => simp only [List.foldl_cons, List.sum_cons, ih]; ring

theorem gain_list : ledgerGain = (entries.map contribution).sum := by
  have h := ArchiveGainPrefix.gain_eq_prefix ArchiveLedger.ledger
  rw [fold_sum] at h
  simp only [zero_add] at h
  unfold ledgerGain entries
  rw [← entries_match]
  simpa only [List.map_map, Function.comp_def, contribution] using h

theorem gain_fin : ledgerGain = ∑ i : Index, contribution (entry i) := by
  rw [gain_list]
  simpa [entry] using (Fin.sum_univ_fun_getElem entries contribution).symm

theorem indexed_hgain (N : ℕ) :
    ArchiveSummation.weightedIdeal Finset.univ cellHeight
      (fun i => (N : ℝ) * ArchiveSumBridge.density (cellPrimes i) *
        (1 / (cellA i : ℝ) - 1 / (cellB i : ℝ))) =
      (N : ℝ) * (ledgerGain : ℝ) := by
  rw [gain_fin]
  simp only [Rat.cast_sum, Finset.mul_sum]
  unfold ArchiveSummation.weightedIdeal
  apply Finset.sum_congr rfl
  intro i _
  have hd := DensityPrefixCandidate.indexed_density_direct i
  simp only [contribution, ArchiveGainPrefix.weight, ArchiveLedger.cellMass,
    Rat.cast_mul, Rat.cast_sub, Rat.cast_div, Rat.cast_one, Rat.cast_natCast]
  change (cellHeight i) * ((N : ℝ) * ArchiveSumBridge.density (cellPrimes i) *
    (1 / (cellA i : ℝ) - 1 / (cellB i : ℝ))) =
    (N : ℝ) * ((((entry i).prior.foldl ArchiveGainPrefix.update 1 : ℚ) : ℝ) *
      ((cellHeight i) * (1 / (cellA i : ℝ) - 1 / (cellB i : ℝ))))
  rw [show (((entry i).prior.foldl ArchiveGainPrefix.update 1 : ℚ) : ℝ) =
    ArchiveSumBridge.density (cellPrimes i) by exact hd]
  ring

#print axioms entries_match
#print axioms gain_list
#print axioms gain_fin
#print axioms indexed_hgain
end HGainCandidate
