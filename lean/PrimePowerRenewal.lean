import PrimePowerSum
import RenewalUnroll

/-! One recurrence level, summed over the bounded earlier-product rough
indices. This is not the 20-level iteration or a cell/profile theorem. -/
namespace PrimePowerRenewal
open Finset

/-- Reindex the outer rough sum and unroll each resulting term. Both pair
coordinates are bounded by N in `pairs`; the inner range has the exact local
cutoff N/(q*p^k), including the empty range when that cutoff is zero. -/
theorem sum_unroll {p P N : ℕ} (hp : p.Prime) (hpP : Nat.Coprime p P)
    (parent u d : ℕ → ℕ) (hu0 : u 0 = 0) (hparent0 : parent 0 = 0)
    (hd0 : d 0 = 0)
    (hrec : ∀ n, 0 < n → u n = parent n + u (n / p) + d n) :
    (∑ t ∈ PrimePowerSum.targets P N, u (N / t)) =
      ∑ x ∈ PrimePowerSum.pairs p P N,
        ((∑ i ∈ range (N / (x.1 * p ^ x.2)),
            parent ((N / (x.1 * p ^ x.2)) / p ^ i)) +
         (∑ i ∈ range (N / (x.1 * p ^ x.2)),
            d ((N / (x.1 * p ^ x.2)) / p ^ i))) := by
  rw [← PrimePowerSum.sum_reindex hp hpP (fun t => u (N / t))]
  apply Finset.sum_congr rfl
  intro x hx
  exact ArchiveRenewalUnroll.unroll p parent u d (by have := hp.two_le; omega)
    hu0 hparent0 hd0 hrec _ _ (le_refl _)

/-- Specialization to the actual max-based archive update and its exact
nonnegative correction, rather than a hypothesized sum identity. -/
theorem sum_update {p P N : ℕ} (hp : p.Prime) (hpP : Nat.Coprime p P)
    (parent old seed : ℕ → ℕ) (hparent0 : parent 0 = 0) :
    (∑ t ∈ PrimePowerSum.targets P N, RenewalNext.update p parent old seed (N / t)) =
      ∑ x ∈ PrimePowerSum.pairs p P N,
        ((∑ i ∈ range (N / (x.1 * p ^ x.2)),
            parent ((N / (x.1 * p ^ x.2)) / p ^ i)) +
         (∑ i ∈ range (N / (x.1 * p ^ x.2)),
            (RenewalNext.update p parent old seed ((N / (x.1 * p ^ x.2)) / p ^ i) -
              (parent ((N / (x.1 * p ^ x.2)) / p ^ i) +
               RenewalNext.update p parent old seed (((N / (x.1 * p ^ x.2)) / p ^ i) / p))))) := by
  rw [← PrimePowerSum.sum_reindex hp hpP
    (fun t => RenewalNext.update p parent old seed (N / t))]
  apply Finset.sum_congr rfl
  intro x hx
  exact ArchiveRenewalUnroll.update_unroll p parent old seed
    (by have := hp.two_le; omega) hparent0 _ _ (le_refl _)

#print axioms sum_unroll
#print axioms sum_update
end PrimePowerRenewal
