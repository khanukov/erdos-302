import SumBridge
import ArchiveLedger

/-! Conditional interface between the literal ledger and the analytic bound.
The two aggregate matching obligations below have NOT been proved.  In
particular they do not imply the separate block/renewal cover hypothesis.
The literal ledger is generated data; no archive-byte provenance is asserted.
-/
namespace ArchiveLedgerSumBridge
open Finset

/-- The rational gain computed by the literal ledger's actual fold. -/
def ledgerGain : ℚ := (ArchiveLedger.totals ArchiveLedger.ledger).2.1

/-- Arithmetic cast of the kernel-checked literal ledger coefficient. -/
theorem ledger_gain_complement : (1 : ℝ) - (ledgerGain : ℝ) =
    (ArchiveLedger.targetC : ℝ) := by
  have h : (1 : ℚ) - ledgerGain = ArchiveLedger.targetC := by
    simpa [ArchiveLedger.Arithmetic, ArchiveLedger.coefficient, ledgerGain] using
      ArchiveLedger.archive_arithmetic.1
  exact_mod_cast h

/-- Cast of the kernel-checked literal ledger error. -/
theorem ledger_error_real : ((ArchiveLedger.error ArchiveLedger.ledger : ℕ) : ℝ) =
    (55064831540 : ℝ) := by
  exact_mod_cast ArchiveLedger.archive_arithmetic.2

/-- The numeric endpoint follows from SumBridge only when the analytic sums
are explicitly matched to the ledger fold, AND the independent cover holds.
`hgain` and `herror` are open sum-reindexing/density obligations: they are not
claims that an arbitrary index type enumerates the ledger cells. -/
theorem conditional_literal_endpoint {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (N : ℕ) (f : ℝ) (h : ι → ℝ)
    (a b j : ι → ℕ) (S : ι → Finset ℕ)
    (hh : ∀ i ∈ s, 0 ≤ h i)
    (ha : ∀ i ∈ s, 0 < a i) (hb : ∀ i ∈ s, 0 < b i)
    (hLU : ∀ i ∈ s, N / b i ≤ N / a i)
    (hprime : ∀ i ∈ s, ∀ p ∈ S i, Nat.Prime p)
    (hrho : ∀ i ∈ s, 0 ≤ ArchiveSumBridge.density (S i) ∧
      ArchiveSumBridge.density (S i) ≤ 1)
    (hbudget : ∀ i ∈ s, (2 : ℝ) ^ (S i).card ≤ (2 : ℝ) ^ (j i))
    (hgain : ArchiveSummation.weightedIdeal s h
      (fun i => (N : ℝ) * ArchiveSumBridge.density (S i) *
        (1 / (a i : ℝ) - 1 / (b i : ℝ))) = (N : ℝ) * (ledgerGain : ℝ))
    (herror : ArchiveSummation.weightedError s h (fun i => (2 : ℝ) ^ (j i)) =
      ((ArchiveLedger.error ArchiveLedger.ledger : ℕ) : ℝ))
    (hcover : f + ArchiveSummation.weightedCount s h
      (fun i => (ArchiveSummation.cellCount N (a i) (b i)
        (fun q => Nat.Coprime q (∏ p ∈ S i, p)) : ℝ)) ≤ N) :
    f ≤ (ArchiveLedger.targetC : ℝ) * (N : ℝ) + 55064831540 := by
  have hbnd := ArchiveSumBridge.global_upper_archive s N f h a b j S
    hh ha hb hLU hprime hrho hbudget hcover
  rw [hgain, herror, ledger_error_real] at hbnd
  have hcoef := ledger_gain_complement
  nlinarith

/-- Preserve every cell occurrence and the actual level order.  `prior` is
exactly the prime list before the level, including the special 3,2 order. -/
structure Entry where
  prior : List ℕ
  cell : ArchiveLedger.Cell

def entriesFrom (prior : List ℕ) : List ArchiveLedger.Level → List Entry
  | [] => []
  | l :: ls => (l.cells.map (fun c => ⟨prior, c⟩)) ++
      entriesFrom (prior ++ [l.prime]) ls

def entries : List Entry := entriesFrom [] ArchiveLedger.ledger
abbrev Index := Fin entries.length

def entry (i : Index) : Entry := entries.get i
def cellA (i : Index) : ℕ := (entry i).cell.a
def cellB (i : Index) : ℕ := (entry i).cell.b
def cellHeight (i : Index) : ℝ := (entry i).cell.height
def cellPrimes (i : Index) : Finset ℕ := (entry i).prior.toFinset
def cellExponent (i : Index) : ℕ := (entry i).prior.length + 1

/-- Literal-index instantiation: these hypotheses expose all still-missing
matching, prime, interval, and cover proofs.  In particular `hcover` is not
replaced by a numerical endpoint assumption. -/
theorem conditional_indexed_endpoint (N : ℕ) (f : ℝ)
    (ha : ∀ i : Index, 0 < cellA i)
    (hb : ∀ i : Index, 0 < cellB i)
    (hLU : ∀ i : Index, N / cellB i ≤ N / cellA i)
    (hprime : ∀ i : Index, ∀ p ∈ cellPrimes i, Nat.Prime p)
    (hrho : ∀ i : Index, 0 ≤ ArchiveSumBridge.density (cellPrimes i) ∧
      ArchiveSumBridge.density (cellPrimes i) ≤ 1)
    (hbudget : ∀ i : Index, (2 : ℝ) ^ (cellPrimes i).card ≤
      (2 : ℝ) ^ cellExponent i)
    (hgain : ArchiveSummation.weightedIdeal Finset.univ cellHeight
      (fun i => (N : ℝ) * ArchiveSumBridge.density (cellPrimes i) *
        (1 / (cellA i : ℝ) - 1 / (cellB i : ℝ))) = (N : ℝ) * (ledgerGain : ℝ))
    (herror : ArchiveSummation.weightedError Finset.univ cellHeight
      (fun i => (2 : ℝ) ^ cellExponent i) =
      ((ArchiveLedger.error ArchiveLedger.ledger : ℕ) : ℝ))
    (hcover : f + ArchiveSummation.weightedCount Finset.univ cellHeight
      (fun i => (ArchiveSummation.cellCount N (cellA i) (cellB i)
        (fun q => Nat.Coprime q (∏ p ∈ cellPrimes i, p)) : ℝ)) ≤ N) :
    f ≤ (ArchiveLedger.targetC : ℝ) * (N : ℝ) + 55064831540 := by
  apply conditional_literal_endpoint Finset.univ N f cellHeight cellA cellB
    cellExponent cellPrimes
  · intro i _
    exact Nat.cast_nonneg _
  · simpa using ha
  · simpa using hb
  · simpa using hLU
  · simpa using hprime
  · simpa using hrho
  · simpa using hbudget
  · exact hgain
  · exact herror
  · exact hcover

#print axioms conditional_indexed_endpoint
#print axioms ledger_gain_complement
#print axioms ledger_error_real
#print axioms conditional_literal_endpoint
end ArchiveLedgerSumBridge
