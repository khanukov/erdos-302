# Unconditional rough-count identity and discrepancy

Let S be a finite set of distinct primes, L,U natural numbers, and L ≤ U. Write P(T)=∏_{p∈T} p, with P(∅)=1, and D(S)=∏_{p∈S}(1−1/p). Then

    #{n ∈ ℕ : L < n ≤ U and gcd(n,P(S))=1}
      = ∑_{T⊆S} (−1)^|T| (⌊U/P(T)⌋ − ⌊L/P(T)⌋),

where the sum and subtraction on the right are in ℤ (or ℝ), not natural-number subtraction. In particular,

    | #{n : L<n≤U, gcd(n,P(S))=1} − (U−L) D(S) |
      ≤ 2^|S| − 1.

Proof: Since every element of S is prime, gcd(n,P(S))=1 iff no p∈S divides n. For each n, expand ∏_{p∈S}(1−1_{p|n}) by the distributive law. The expansion gives ∑_{T⊆S}(−1)^|T|∏_{p∈T}1_{p|n}. The product of indicators is 1 exactly when all primes in T divide n. Distinct primes are pairwise coprime, so this is equivalent to P(T)|n, including the empty set. Summing over the finite interval and swapping finite sums proves the identity, because the number of multiples of positive P(T) in (L,U] is ⌊U/P(T)⌋−⌊L/P(T)⌋.

The analogous product expansion is D(S)=∑_{T⊆S}(−1)^|T|/P(T). Subtract it times U−L. For each T, the resulting unsigned error is |{L/P(T)}−{U/P(T)}|<1, where braces denote fractional part. For T=∅ the error is exactly zero. The triangle inequality on the remaining 2^|S|−1 terms proves the displayed bound (also for S=∅).

The hypothesis L≤U matters: the previous candidate's real-valued length U−L is negative on reversed intervals. For S=∅, L=10, U=1, the count is 0, discrepancy is 9 and the prior 2·2^|S| bound is 2. A universally quantified theorem must instead use max(U−L,0) as a real length, or require L≤U.

## Pinned source guidance

The inspected mathlib checkout is `/root/erdos-302-independent-audit/lower-rebuild/project/.lake/packages/mathlib` at `da1f94df976c7cd38117281c57d6ee3046c8d104`.

* `Mathlib/Combinatorics/Enumerative/InclusionExclusion.lean:165`: `Finset.inclusion_exclusion_sum_inf_compl` over a finite ambient type. Its card specialization at line 182 is `Finset.inclusion_exclusion_card_inf_compl` over ℤ. Instantiate the finite ambient type with the subtype `{n // n ∈ Finset.Ioc L U}`, and S p with its finset of multiples of p; identify each infimum with the corresponding divisibility filter, including the empty intersection (the full subtype).
* `Mathlib/Data/Nat/GCD/BigOperators.lean:38–44`: `Nat.coprime_prod_left_iff` / `Nat.coprime_prod_right_iff`. Combine with `Nat.Prime.coprime_iff_not_dvd` in `Mathlib/Data/Nat/Prime/Defs.lean:418`.
* `Mathlib/RingTheory/Coprime/Lemmas.lean:120` uses `Finset.prod_dvd_of_coprime`; pairwise coprimality of distinct primes and `Finset.dvd_prod_of_mem` supply both directions for product divisibility.
* `Mathlib/Data/Nat/Factorization/Basic.lean:531`: `Nat.Ioc_filter_dvd_card_eq_div` counts multiples on (0,N]; decompose (0,U] into (0,L] and (L,U] with L≤U to obtain the interval count.
* `Finset.prod_sub` supplies density expansion, as in the earlier candidate. The real bound then needs natural-division/remainder cast lemmas and a finite absolute-sum bound; isolate T=∅ for the sharper constant.

## Status

This is a mathematical proof and source-level implementation route, not a kernel-checked Lean theorem. No Lean candidate is presented as CI-ready: translating subtype/cardinality coercions and proving the interval rounding estimate remain unverified, as does hosted CI. No local Lean execution or remote writes were performed. The exact identity and sharp bound were checked by Python rational arithmetic for 4,480 cases with subsets of {2,3,5,7} and 0≤L≤15, L≤U≤24; this finite check is not a proof.
