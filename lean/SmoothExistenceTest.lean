import SmoothExistence

open Finset SmoothPartition

-- General interface: no decomposition, primality of Q, or factorization assumed.
example (Q : Finset ℕ) (n : ℕ) (hn : 0 < n) :
    ∃ a x : ℕ, Rough Q a ∧ 0 < x ∧ SmoothRenewal.Smooth Q x ∧ n = a * x :=
  decomposition_exists Q n hn

-- Boundary: n = 1 and empty Q.
example : ∃ a x : ℕ, Rough (∅ : Finset ℕ) a ∧ 0 < x ∧
    SmoothRenewal.Smooth ∅ x ∧ 1 = a * x :=
  decomposition_exists ∅ 1 (by decide)

-- Repeated prime powers and a nonprime member in Q are allowed.
example : ∃ a x : ℕ, Rough ({2, 4} : Finset ℕ) a ∧ 0 < x ∧
    SmoothRenewal.Smooth {2, 4} x ∧ 72 = a * x :=
  decomposition_exists {2, 4} 72 (by decide)

-- Existence combines with the established uniqueness theorem.
example (Q : Finset ℕ) (n : ℕ) (hn : 0 < n) :
    ∃ a x : ℕ, Rough Q a ∧ 0 < x ∧ SmoothRenewal.Smooth Q x ∧
      n = a * x ∧
      ∀ b y, Rough Q b → 0 < y → SmoothRenewal.Smooth Q y →
        n = b * y → a = b ∧ x = y := by
  obtain ⟨a, x, ha, hx, hs, h⟩ := decomposition_exists Q n hn
  refine ⟨a, x, ha, hx, hs, h, ?_⟩
  intro b y hb hy hsy hyprod
  exact decomposition_unique ha hb hx hy hs hsy (h.symm.trans hyprod)

#print axioms SmoothPartition.decomposition_exists
