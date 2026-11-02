import RenewalUnroll

namespace ArchiveRenewalUnrollTest
open Finset ArchiveRenewalUnroll

example : quotient 2 13 3 = 1 := by decide
example : quotient 2 13 4 = 0 := by decide
example : quotient 3 0 0 = 0 := by decide
example : (13 : ℕ) / 2 ^ 13 = 0 := by
  rw [← quotient_eq_div_pow]
  exact quotient_eq_zero 2 13 13 (by decide) (by decide)

-- U(n)=n, parent(n)=0, d(n)=n-floor(n/2): nonzero corrections.
example (n : ℕ) :
    n = (∑ i ∈ range n, (0 : ℕ)) +
      (∑ i ∈ range n, (n / 2 ^ i - (n / 2 ^ i) / 2)) := by
  apply unroll 2 (fun _ => 0) (fun m => m)
    (fun m => m - m / 2) (by decide) rfl rfl (by simp)
  · intro m hm
    have h : m / 2 ≤ m := Nat.div_le_self m 2
    omega
  · rfl

-- The nonzero residual is essential before the cutoff.
example : (13 : ℕ) =
    (∑ i ∈ range 2, (13 / 2 ^ i - (13 / 2 ^ i) / 2)) + 13 / 2 ^ 2 := by
  norm_num [Finset.sum_range_succ]

example : (7 : ℕ) =
    ∑ i ∈ range 7, (7 / 2 ^ i - (7 / 2 ^ i) / 2) := by
  norm_num [Finset.sum_range_succ]

example (parent old seed : ℕ → ℕ) (h0 : parent 0 = 0) :
    RenewalNext.update 2 parent old seed 0 = 0 := by
  simpa using RenewalNext.update_zero 2 parent old seed

#print axioms ArchiveRenewalUnroll.unroll
#print axioms ArchiveRenewalUnroll.update_unroll
end ArchiveRenewalUnrollTest
