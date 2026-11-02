import LedgerChecker
import GainPrefix

/-! Candidate bridge from the literal ledger fold to occurrence-preserving
prefix entries. This file has not yet been checked by Lean CI. -/
namespace ArchiveGainPrefix

def update (d : ℚ) (p : ℕ) : ℚ := d * ((p - 1 : ℕ) : ℚ) / (p : ℚ)
def weight (d : ℚ) (c : ArchiveLedger.Cell) : ℚ := d * ArchiveLedger.cellMass c

def convert (l : ArchiveLedger.Level) : GainPrefix.Level ℕ ArchiveLedger.Cell :=
  ⟨l.prime, l.cells⟩

def project (s : ℚ × ℚ × ℕ × ℕ) : ℚ × ℚ := (s.1, s.2.1)

private theorem fold_add_shift (xs : List ℚ) (a : ℚ) :
    xs.foldl (· + ·) a = a + xs.foldl (· + ·) 0 := by
  induction xs generalizing a with
  | nil => simp
  | cons x xs ih =>
    simp only [List.foldl_cons, zero_add]
    rw [ih (a + x), ih x]
    ring

/-- Distribute the level density over its ordered cell occurrences. -/
theorem distribute (d a : ℚ) (cs : List ArchiveLedger.Cell) :
    (cs.map (weight d)).foldl (· + ·) a =
      a + d * (cs.map ArchiveLedger.cellMass).foldl (· + ·) 0 := by
  rw [fold_add_shift]
  congr 1
  induction cs with
  | nil => simp
  | cons c cs ih =>
    simp only [List.map_cons, List.foldl_cons, zero_add]
    rw [fold_add_shift (cs.map (weight d)) (weight d c),
      fold_add_shift (cs.map ArchiveLedger.cellMass) (ArchiveLedger.cellMass c), ih]
    simp only [weight]
    ring

theorem levelMass_map (cs : List ArchiveLedger.Cell) :
    cs.foldl (fun s c => s + ArchiveLedger.cellMass c) 0 =
      (cs.map ArchiveLedger.cellMass).foldl (· + ·) 0 := by
  simp only [List.foldl_map]

theorem step_project (s : ℚ × ℚ × ℕ × ℕ) (l : ArchiveLedger.Level) :
    project (ArchiveLedger.step s l) =
      GainFold.step (GainPrefix.next update) (GainPrefix.emit weight) (· + ·)
        (project s) (convert l) := by
  apply Prod.ext
  · rfl
  · simp only [project, ArchiveLedger.step, GainFold.step, GainPrefix.emit,
      convert, ArchiveLedger.levelMass]
    rw [distribute, ← levelMass_map]

/-- Projection commutes with the actual ledger fold, including its extra error
and error-weight components. -/
theorem project_fold (ls : List ArchiveLedger.Level) (s : ℚ × ℚ × ℕ × ℕ) :
    project (ls.foldl ArchiveLedger.step s) =
      (ls.map convert).foldl
        (GainFold.step (GainPrefix.next update) (GainPrefix.emit weight) (· + ·))
        (project s) := by
  induction ls generalizing s with
  | nil => rfl
  | cons l ls ih =>
    simp only [List.foldl_cons, List.map_cons]
    rw [← step_project, ← ih]

/-- The actual gain equals a fold over all cells annotated with the full
ordered preceding prime list. Repeated cells remain separate occurrences. -/
theorem gain_eq_prefix (ls : List ArchiveLedger.Level) :
    (ArchiveLedger.totals ls).2.1 =
      ((GainPrefix.entriesFrom [] (ls.map convert)).map
        (fun e => weight (e.1.foldl update 1) e.2)).foldl (· + ·) 0 := by
  have hp := congrArg Prod.snd (project_fold ls (1, 0, 0, 2))
  change (ArchiveLedger.totals ls).2.1 =
    ((ls.map convert).foldl
      (GainFold.step (GainPrefix.next update) (GainPrefix.emit weight) (· + ·))
      (1, 0)).2 at hp
  rw [hp]
  exact GainPrefix.fold_eq_prefix_entries update weight (· + ·) 1 [] (ls.map convert) 0

#print axioms distribute
#print axioms step_project
#print axioms project_fold
#print axioms gain_eq_prefix
end ArchiveGainPrefix
