import DemandRenewalChain
import LedgerChecker

/-! Conditional propagation for ledger cell corrections. The cells and the
profile recurrence remain external inputs; no archive correspondence, exact
cover number, or profile monotonicity is asserted. -/
namespace LedgerTailDemand
open RenewalNext SmoothRenewal DemandRenewalChain

def correction (cells : List ArchiveLedger.Cell) (n : ℕ) : ℕ :=
  (cells.map (fun c => if c.a ≤ n ∧ n < c.b then c.height else 0)).sum

theorem correction_zero_above (cells : List ArchiveLedger.Cell) (X n : ℕ)
    (hs : ∀ c ∈ cells, c.b ≤ X+1) (hn : X < n) :
    correction cells n = 0 := by
  revert hs
  induction cells with
  | nil => intro hs; simp [correction]
  | cons c cs ih =>
    intro hs
    have hc : c.b ≤ X+1 := hs c (by simp)
    have hcs : ∀ c ∈ cs, c.b ≤ X+1 := by
      intro d hd; exact hs d (by simp [hd])
    have hnot : ¬ n < c.b := by omega
    simp [correction, hnot, ih hcs]

/-- All demanded assumptions: prime/fresh schedule and its prefix equation;
base demand at every argument; finite demand certificates through X at every
successor level; cell support through X; and the displayed profile recurrence
above X. The conclusion is only a graph-cover lower bound. -/
theorem levels_ledger_demand (X J : ℕ) (Q : ℕ → Finset ℕ) (p : ℕ → ℕ)
    (ls : ℕ → List ArchiveLedger.Cell) (u : ℕ → ℕ → ℕ)
    (hp : ∀ j, j < J → (p j).Prime) (hfresh : ∀ j, j < J → p j ∉ Q j)
    (hQ : ∀ j, j < J → Q (j+1) = insert (p j) (Q j))
    (hbase : ∀ n, Demand Edge (vertices (Q 0) n) (u 0 n))
    (hfinite : ∀ j, j < J → ∀ n, n ≤ X → Demand Edge (vertices (Q (j+1)) n) (u (j+1) n))
    (hsupport : ∀ j, j < J → ∀ c, c ∈ ls j → c.b ≤ X+1)
    (hrec : ∀ j, j < J → ∀ n, X < n → u (j+1) n =
      u j n + u (j+1) (n / p j) + correction (ls j) n) :
    ∀ j, j ≤ J → ∀ n, Demand Edge (vertices (Q j) n) (u j n) := by
  intro j
  induction j with
  | zero => intro _; exact hbase
  | succ j ih =>
    intro hj
    have hjlt : j < J := by omega
    have heq : ∀ n, u (j+1) n = tail (p j) X (u j) (u (j+1)) n := by
      intro n
      induction n using Nat.strong_induction_on with
      | h n ihn =>
        by_cases hn : n ≤ X
        · rw [tail_small _ _ _ _ hn]
        · have hx : X < n := by omega
          have hd : n / p j < n := Nat.div_lt_self (by omega) (hp j hjlt).one_lt
          rw [hrec j hjlt n hx, correction_zero_above (ls j) X n (hsupport j hjlt) hx,
            Nat.add_zero, tail_large _ _ _ _ hx (hp j hjlt).one_lt, ← ihn _ hd]
    have hsmall : ∀ n, n ≤ X → Demand Edge
        (vertices (insert (p j) (Q j)) n) (u (j+1) n) := by
      intro n hn
      simpa only [← hQ j hjlt] using hfinite j hjlt n hn
    have ht := tail_graph_demand (Q j) (p j) X (u j) (u (j+1))
      (hp j hjlt) (hfresh j hjlt) (ih (by omega)) hsmall
    intro n
    rw [heq n, hQ j hjlt]
    exact ht n

#print axioms correction_zero_above
#print axioms levels_ledger_demand
end LedgerTailDemand
