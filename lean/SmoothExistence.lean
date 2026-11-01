import SmoothPartition
import Mathlib.Data.Nat.Factorization.Induction

/-! Candidate existence proof by induction over prime factors. No hypothesis
that members of Q are prime is needed. This file requires Lean verification. -/
namespace SmoothPartition

/-- Every positive natural has a positive rough factor and a positive smooth
factor. The induction assigns each prime to the appropriate factor. -/
theorem decomposition_exists (Q : Finset ℕ) (n : ℕ) (hn : 0 < n) :
    ∃ a x : ℕ, Rough Q a ∧ 0 < x ∧ SmoothRenewal.Smooth Q x ∧ n = a * x := by
  classical
  revert hn
  induction n using induction_on_primes with
  | zero =>
      intro hn
      omega
  | one =>
      intro _
      refine ⟨1, 1, ⟨by decide, ?_⟩, by decide, ?_, by simp⟩
      · intro p hp _ hd
        exact hp.ne_one (Nat.dvd_one.mp hd)
      · intro p hp hd
        exact False.elim (hp.ne_one (Nat.dvd_one.mp hd))
  | prime_mul p m hp ih =>
      intro hn
      have hm : 0 < m := by
        by_contra h
        have : m = 0 := by omega
        simp [this] at hn
      obtain ⟨a, x, ha, hx, hs, heq⟩ := ih hm
      by_cases hpQ : p ∈ Q
      · refine ⟨a, p * x, ha, Nat.mul_pos hp.pos hx, ?_, ?_⟩
        · intro q hq hd
          rcases hq.dvd_mul.mp hd with hqp | hqx
          · have hqp' : q = p := (Nat.dvd_prime hp).mp hqp |>.resolve_left hq.ne_one
            simpa [hqp'] using hpQ
          · exact hs q hq hqx
        · rw [heq]
          ring
      · refine ⟨p * a, x, ?_, hx, hs, ?_⟩
        · refine ⟨Nat.mul_pos hp.pos ha.1, ?_⟩
          intro q hq hqQ hd
          rcases hq.dvd_mul.mp hd with hqp | hqa
          · have hqp' : q = p := (Nat.dvd_prime hp).mp hqp |>.resolve_left hq.ne_one
            exact hpQ (hqp' ▸ hqQ)
          · exact ha.2 q hq hqQ hqa
        · rw [heq]
          ring

#print axioms decomposition_exists
end SmoothPartition
