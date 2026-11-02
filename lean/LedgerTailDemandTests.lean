import LedgerTailDemand

open RenewalNext SmoothRenewal LedgerTailDemand

-- The upper endpoint is exclusive, including at the cutoff boundary.
def cells : List ArchiveLedger.Cell := [⟨2, 5, 3⟩]
example : correction cells 4 = 3 := by decide
example : correction cells 5 = 0 := by decide
example : correction cells 6 = 0 := by decide
-- Overlaps are occurrences, not a set: both heights are counted.
example : correction [⟨2, 5, 3⟩, ⟨2, 5, 3⟩] 4 = 6 := by decide
example : correction ([] : List ArchiveLedger.Cell) 4 = 0 := by decide
example : correction [⟨2, 5, 3⟩, ⟨1, 3, 7⟩] 2 = 10 := by decide

-- Exact scope: finite certificates and recurrence, not global demand, are supplied.
example (X J : ℕ) (Q : ℕ → Finset ℕ) (p : ℕ → ℕ)
    (ls : ℕ → List ArchiveLedger.Cell) (u : ℕ → ℕ → ℕ)
    (hp : ∀ j, j < J → (p j).Prime) (hfresh : ∀ j, j < J → p j ∉ Q j)
    (hQ : ∀ j, j < J → Q (j+1) = insert (p j) (Q j))
    (hbase : ∀ n, Demand Edge (vertices (Q 0) n) (u 0 n))
    (hfinite : ∀ j, j < J → ∀ n, n ≤ X → Demand Edge (vertices (Q (j+1)) n) (u (j+1) n))
    (hsupport : ∀ j, j < J → ∀ c, c ∈ ls j → c.b ≤ X+1)
    (hrec : ∀ j, j < J → ∀ n, X < n → u (j+1) n =
      u j n + u (j+1) (n / p j) + correction (ls j) n) :
    ∀ j, j ≤ J → ∀ n, Demand Edge (vertices (Q j) n) (u j n) :=
  levels_ledger_demand X J Q p ls u hp hfresh hQ hbase hfinite hsupport hrec
