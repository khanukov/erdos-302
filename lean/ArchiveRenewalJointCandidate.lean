import DemandRenewalChain
import ArchiveLedger

/-! Candidate bridge: literal cell lookup, max-update soundness, and zero-tail
recurrence. The finite lookup check and old/seed graph bounds are inputs;
no global weighted cover or target recurrence is assumed. -/
namespace ArchiveRenewalJointCandidate
open Finset RenewalNext SmoothRenewal DemandRenewalChain

/-- A list sum preserves repeated literal cell occurrences. -/
def cellCorrection (l : ArchiveLedger.Level) (n : ℕ) : ℕ :=
  (l.cells.map fun c => if c.a ≤ n ∧ n < c.b then c.height else 0).sum

/-- The table is the actual four-way max update; its continuation is zero-gain. -/
noncomputable def profile (p X : ℕ) (parent old seed : ℕ → ℕ) : ℕ → ℕ :=
  tail p X parent (update p parent old seed)

/-- This is a finite, pointwise check against the *literal level cells*, not
an assumed graph demand, block allocation, or global cover inequality. -/
def FiniteCorrectionCheck (l : ArchiveLedger.Level) (X : ℕ)
    (parent old seed : ℕ → ℕ) : Prop :=
  ∀ n, 0 < n → n ≤ X →
    cellCorrection l n =
      update l.prime parent old seed n -
        (parent n + update l.prime parent old seed (n / l.prime))

/-- Under independent parent/old/seed certificates and the finite literal
lookup check, the same constructed profile simultaneously has graph demand and
the literal correction recurrence (with zero correction after cutoff). -/
theorem profile_demand_and_literal_recurrence
    (Q : Finset ℕ) (l : ArchiveLedger.Level) (X : ℕ)
    (parent old seed : ℕ → ℕ)
    (hp : l.prime.Prime) (hfresh : l.prime ∉ Q)
    (hparent : ∀ n, Demand Edge (vertices Q n) (parent n))
    (hold : ∀ n, Demand Edge (vertices (insert l.prime Q) n) (old n))
    (hseed : ∀ n, Demand Edge (vertices (insert l.prime Q) n) (seed n))
    (hcheck : FiniteCorrectionCheck l X parent old seed) :
    (∀ n, Demand Edge (vertices (insert l.prime Q) n)
      (profile l.prime X parent old seed n)) ∧
    (∀ n, 0 < n → profile l.prime X parent old seed n =
      parent n + profile l.prime X parent old seed (n / l.prime) +
        (if n ≤ X then cellCorrection l n else 0)) := by
  constructor
  · apply tail_graph_demand Q l.prime X parent (update l.prime parent old seed)
      hp hfresh hparent
    intro n _
    exact update_graph_demand Q l.prime parent old seed hp hfresh hparent hold hseed n
  · intro n hn
    change tail l.prime X parent (update l.prime parent old seed) n =
      parent n + tail l.prime X parent (update l.prime parent old seed) (n / l.prime) +
        (if n ≤ X then cellCorrection l n else 0)
    by_cases hs : n ≤ X
    · have hdiv : n / l.prime ≤ X := (Nat.div_le_self n l.prime).trans hs
      rw [tail_small _ _ _ _ hs, tail_small _ _ _ _ hdiv,
        if_pos hs, hcheck n hn hs]
      exact (correction_identity l.prime parent old seed hn hp.one_lt).symm
    · have hx : X < n := Nat.lt_of_not_ge hs
      rw [tail_large _ _ _ _ hx hp.one_lt, if_neg hs, Nat.add_zero]

/-- Within the cutoff this is the four-way archive maximum, not merely a
recurrence with arbitrary increments. No claim is made about the tail. -/
theorem profile_max_update (p X : ℕ) (parent old seed : ℕ → ℕ)
    {n : ℕ} (hn : 0 < n) (hp : 1 < p) (hX : n ≤ X) :
    profile p X parent old seed n =
      max (max (max (parent n + profile p X parent old seed (n / p))
        (profile p X parent old seed (n - 1))) (old n)) (seed n) := by
  have hd : n / p ≤ X := (Nat.div_le_self n p).trans hX
  have hm : n - 1 ≤ X := (Nat.sub_le n 1).trans hX
  simp only [profile, tail_small _ _ _ _ hX, tail_small _ _ _ _ hd,
    tail_small _ _ _ _ hm, update_pos p parent old seed hn hp]

#print axioms profile_demand_and_literal_recurrence
#print axioms profile_max_update
end ArchiveRenewalJointCandidate
