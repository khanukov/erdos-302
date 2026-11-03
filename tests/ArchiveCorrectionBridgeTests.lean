import ArchiveCorrectionBridgeCandidate

open Finset RenewalOccurrenceIndex LiteralFactorMatchingCandidate
open ArchiveCorrectionBridgeCandidate
open scoped Classical

-- This checks the exact univ-indexed statement, not a deduplicated set of cells.
example (o : Occurrence) :
    correction o.level o.arg =
      ∑ i ∈ (Finset.univ : Finset (Fin 4705)), height i * hit o i :=
  correction_at_occurrence o

example (j : ℕ) : correction j 0 = 0 := correction_zero j

-- Keep every original recurrence and matching premise in the public interface.
example (N q levels : ℕ) (p : ℕ → ℕ) (u : ℕ → ℕ → ℕ) (r : ℕ)
    (hp : ∀ j, 1 < p j) (hbase : ∀ x, u 0 x = 0)
    (hu0 : ∀ j, u j 0 = 0)
    (hrec : ∀ j x, 0 < x → u (j + 1) x =
      u j x + u (j + 1) (x / p j) + correction j x)
    (hmatch : ∀ i : Fin 4705, mult N i q =
      RenewalConcreteOccurrence.multiplicity (occurrences p levels (N / q)) hit i)
    (hbound : u levels (N / q) ≤ r) :
    (∑ i : Fin 4705, height i * mult N i q) ≤ r :=
  literal_allocation N q levels p u r hp hbase hu0 hrec hmatch hbound
