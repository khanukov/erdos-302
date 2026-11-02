import ArchiveLedgerSumBridge

/-! Candidate, not yet CI-checked. The index is a position in the literal list;
no deduplication or archive-byte provenance is assumed. -/
namespace ArchiveErrorMatchCandidate
open ArchiveLedgerSumBridge

def contribution (e : Entry) : ℕ := e.cell.height * 2 ^ (e.prior.length + 1)

private theorem height_fold (cs : List ArchiveLedger.Cell) (a : ℕ) :
    cs.foldl (fun s c => s + c.height) a =
      a + (cs.map (fun c => c.height)).sum := by
  induction cs generalizing a with
  | nil => simp
  | cons c cs ih => simp only [List.foldl_cons, ih, List.map_cons, List.sum_cons]; omega

/-- This identity is uniform in the level list and the initial prefix; it
preserves duplicate occurrences and accounts for empty levels. -/
theorem entries_error (prior : List ℕ) (ls : List ArchiveLedger.Level) :
    ((entriesFrom prior ls).map contribution).sum =
      (ls.foldl ArchiveLedger.step (1, 0, 0, 2 ^ (prior.length + 1))).2.2.1 := by
  have aux (prior : List ℕ) (ls : List ArchiveLedger.Level)
      (s : ℚ × ℚ × ℕ × ℕ)
      (hw : s.2.2.2 = 2 ^ (prior.length + 1)) :
      (ls.foldl ArchiveLedger.step s).2.2.1 =
        s.2.2.1 + ((entriesFrom prior ls).map contribution).sum := by
    induction ls generalizing prior s with
    | nil => simp [entriesFrom]
    | cons l ls ih =>
      have hw' : (ArchiveLedger.step s l).2.2.2 =
          2 ^ ((prior ++ [l.prime]).length + 1) := by
        simp only [ArchiveLedger.step, hw, List.length_append, List.length_cons,
          List.length_nil, Nat.add_zero, pow_succ]
        omega
      rw [List.foldl_cons, ih (prior ++ [l.prime]) (ArchiveLedger.step s l) hw']
      simp only [entriesFrom, List.map_append, List.sum_append, List.map_map,
        Function.comp_def, ArchiveLedger.step, ArchiveLedger.heightSum,
        height_fold, zero_add, contribution, List.sum_map_mul_right]
      rw [hw]
      have hm : (l.cells.map ArchiveLedger.Cell.height).sum =
          (l.cells.map (fun c => c.height)).sum := rfl
      rw [hm]
      simp only [Nat.mul_comm]
      omega
  simpa [ArchiveLedger.totals] using (aux prior ls (1, 0, 0, 2 ^ (prior.length + 1)) rfl).symm

/-- The literal natural sum matches the arithmetic already certified by the
ledger checker. -/
theorem occurrence_error : (entries.map contribution).sum = 55064831540 := by
  rw [entries, entries_error]
  simpa [ArchiveLedger.error, ArchiveLedger.totals] using ArchiveLedger.archive_arithmetic.2

/-- Every occurrence is indexed by a distinct `Fin`, even for equal entries. -/
theorem indexed_error :
    ArchiveSummation.weightedError Finset.univ cellHeight
      (fun i => (2 : ℝ) ^ cellExponent i) = (55064831540 : ℝ) := by
  have h : (∑ i : Index, (contribution (entry i) : ℝ)) =
      ((entries.map contribution).sum : ℝ) := by
    have cast_sum (xs : List ℕ) : ((xs.map (fun (n : ℕ) => (n : ℝ))).sum) = (xs.sum : ℝ) := by
      induction xs with
      | nil => simp
      | cons n xs ih => simp only [List.map_cons, List.sum_cons, Nat.cast_add, ih]
    rw [← List.sum_ofFn]
    change (List.ofFn ((fun e => (contribution e : ℝ)) ∘
      (fun i : Index => entry i))).sum = _
    rw [← List.map_ofFn (f := fun i : Index => entry i)
      (g := fun e => (contribution e : ℝ))]
    rw [show List.ofFn (fun i : Index => entry i) = entries from List.ofFn_getElem]
    simpa only [List.map_map, Function.comp_def] using cast_sum (entries.map contribution)
  simpa [ArchiveSummation.weightedError, cellHeight, cellExponent,
    contribution, Nat.cast_mul, Nat.cast_pow, occurrence_error] using h

#print axioms entries_error
#print axioms occurrence_error
#print axioms indexed_error
end ArchiveErrorMatchCandidate
