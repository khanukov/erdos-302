import Renewal
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic

/-! Candidate for hosted checking.  This is the one-prime-power unrolling
of the archive recurrence; it does not assert the separate rough-index
reindexing needed for the final global identity. -/
namespace ArchiveRenewalUnroll
open Finset

/-- The successive arguments n, n/p, (n/p)/p, ... . -/
def quotient (p n : ℕ) : ℕ → ℕ
  | 0 => n
  | k + 1 => quotient p n k / p

/-- Repeated natural division is division by a prime power. No primality is
needed for the identity, including at p = 0. -/
theorem quotient_eq_div_pow (p n k : ℕ) : quotient p n k = n / p ^ k := by
  induction k with
  | zero => simp [quotient]
  | succ k ih =>
      simp only [quotient, ih, pow_succ, Nat.div_div_eq_div_mul]

/-- The quotient sequence has reached zero after at most n steps when p > 1. -/
theorem quotient_le_sub (p n k : ℕ) (hp : 1 < p) :
    quotient p n k ≤ n - k := by
  induction k with
  | zero => simp [quotient]
  | succ k ih =>
      rw [quotient]
      by_cases h : quotient p n k = 0
      · simp [h]
      · have hlt : quotient p n k / p < quotient p n k :=
          Nat.div_lt_self (Nat.pos_of_ne_zero h) hp
        omega

theorem quotient_eq_zero (p n k : ℕ) (hp : 1 < p) (hk : n ≤ k) :
    quotient p n k = 0 := by
  have h := quotient_le_sub p n k hp
  omega

/-- One-level unrolling, retaining the exact residual after k terms. The
recurrence is needed only at positive arguments, as in the archive. -/
theorem unroll_with_residual (p : ℕ) (parent u d : ℕ → ℕ)
    (hu0 : u 0 = 0) (hparent0 : parent 0 = 0) (hd0 : d 0 = 0)
    (hrec : ∀ n, 0 < n → u n = parent n + u (n / p) + d n)
    (n k : ℕ) :
    u n = (∑ i ∈ range k, (parent (quotient p n i) + d (quotient p n i))) +
      u (quotient p n k) := by
  have hrec' : ∀ m, u m = parent m + u (m / p) + d m := by
    intro m
    by_cases hm : m = 0
    · subst m
      simp [hu0, hparent0, hd0]
    · exact hrec m (Nat.pos_of_ne_zero hm)
  induction k with
  | zero => simp [quotient]
  | succ k ih =>
      rw [Finset.sum_range_succ, quotient]
      have h := hrec' (quotient p n k)
      omega

/-- Explicit finite cutoff: the residual vanishes after n divisions. This
proves the sum from the recurrence, rather than assuming the identity. -/
theorem unroll (p : ℕ) (parent u d : ℕ → ℕ)
    (hp : 1 < p) (hu0 : u 0 = 0) (hparent0 : parent 0 = 0)
    (hd0 : d 0 = 0)
    (hrec : ∀ n, 0 < n → u n = parent n + u (n / p) + d n)
    (n k : ℕ) (hk : n ≤ k) :
    u n = (∑ i ∈ range k, parent (n / p ^ i)) +
      (∑ i ∈ range k, d (n / p ^ i)) := by
  have h := unroll_with_residual p parent u d hu0 hparent0 hd0 hrec n k
  rw [quotient_eq_zero p n k hp hk, hu0, add_zero] at h
  simpa only [quotient_eq_div_pow, Finset.sum_add_distrib] using h

/-- Direct connection to the archive's max-based finite-table update. -/
theorem update_unroll (p : ℕ) (parent old seed : ℕ → ℕ)
    (hp : 1 < p) (hparent0 : parent 0 = 0) (n k : ℕ) (hk : n ≤ k) :
    RenewalNext.update p parent old seed n =
      (∑ i ∈ range k, parent (n / p ^ i)) +
      (∑ i ∈ range k,
        (RenewalNext.update p parent old seed (n / p ^ i) -
          (parent (n / p ^ i) +
            RenewalNext.update p parent old seed ((n / p ^ i) / p)))) := by
  apply unroll p parent (RenewalNext.update p parent old seed)
    (fun m => RenewalNext.update p parent old seed m -
      (parent m + RenewalNext.update p parent old seed (m / p))) hp
  · exact RenewalNext.update_zero p parent old seed
  · exact hparent0
  · simp [RenewalNext.update_zero, hparent0]
  · intro m hm
    have h := RenewalNext.correction_identity p parent old seed hm hp
    dsimp only at h
    omega
  · exact hk

#print axioms quotient_eq_div_pow
#print axioms quotient_eq_zero
#print axioms unroll_with_residual
#print axioms unroll
#print axioms update_unroll
end ArchiveRenewalUnroll
