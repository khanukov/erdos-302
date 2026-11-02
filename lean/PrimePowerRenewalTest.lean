import PrimePowerRenewal

namespace PrimePowerRenewalTest
open Finset

-- Concrete supports, including the N=0 boundary.
example : PrimePowerSum.targets 3 8 = {1, 2, 4, 5, 7, 8} := by decide
example : PrimePowerSum.pairs 2 3 0 = ∅ := by decide
example : PrimePowerSum.targets 3 0 = ∅ := by decide

-- A nonzero correction: u(n)=n, parent(n)=0, d(n)=n-n/2.
example : (∑ t ∈ PrimePowerSum.targets 3 8, 8 / t) =
    ∑ x ∈ PrimePowerSum.pairs 2 3 8,
      ((∑ i ∈ range (8 / (x.1 * 2 ^ x.2)), (0 : ℕ)) +
       (∑ i ∈ range (8 / (x.1 * 2 ^ x.2)),
          ((8 / (x.1 * 2 ^ x.2)) / 2 ^ i -
            ((8 / (x.1 * 2 ^ x.2)) / 2 ^ i) / 2))) := by
  apply PrimePowerRenewal.sum_unroll (by decide) (by decide)
    (fun _ => 0) (fun n => n) (fun n => n - n / 2) rfl rfl (by simp)
  intro n hn
  have h := Nat.div_le_self n 2
  omega

-- Actual update specialization, at the zero boundary and arbitrary inputs.
example (parent old seed : ℕ → ℕ) (h0 : parent 0 = 0) :
    (∑ t ∈ PrimePowerSum.targets 3 0, RenewalNext.update 2 parent old seed (0 / t)) =
      ∑ x ∈ PrimePowerSum.pairs 2 3 0,
        ((∑ i ∈ range (0 / (x.1 * 2 ^ x.2)),
          parent ((0 / (x.1 * 2 ^ x.2)) / 2 ^ i)) +
         (∑ i ∈ range (0 / (x.1 * 2 ^ x.2)),
          (RenewalNext.update 2 parent old seed ((0 / (x.1 * 2 ^ x.2)) / 2 ^ i) -
           (parent ((0 / (x.1 * 2 ^ x.2)) / 2 ^ i) +
            RenewalNext.update 2 parent old seed (((0 / (x.1 * 2 ^ x.2)) / 2 ^ i) / 2))))) := by
  exact PrimePowerRenewal.sum_update (by decide) (by decide) parent old seed h0

#print axioms PrimePowerRenewal.sum_unroll
#print axioms PrimePowerRenewal.sum_update
end PrimePowerRenewalTest
