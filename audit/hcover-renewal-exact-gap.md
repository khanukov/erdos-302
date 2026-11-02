# Exact local renewal-to-block interface (candidate, not Lean checked)

At main snapshot `99bc1e5`, `hcover` is **not proved**. This note isolates a local, pointwise statement which would connect the archive corrections to the existing block-demand theorem without assuming the global weighted sum. The stated candidate remains unimplemented and unverified in Lean; it is not a proof of the archive endpoint.

## Exact pointwise identity

Let `p₁,…,p₂₀ = (3,2,5,…,71)` be distinct primes, `Pⱼ = ∏ᵢ≤ⱼ pᵢ`, `P₀=1`, and `Tⱼ(n)` be the positive integers `t ≤ n` all of whose prime factors occur in the suffix `pⱼ,…,p₂₀`. For each level let `dⱼ(0)=0`, and suppose for all positive n:

```
U₀(n) = 0,     Uⱼ(0) = 0,
Uⱼ(n) = Uⱼ₋₁(n) + Uⱼ(n / pⱼ) + dⱼ(n).
```

Then the desired *pointwise* 20-level expansion, independently of any graph or global cover, is

```
U₂₀(n) = ∑_{j=1}^{20} ∑_{t ∈ Tⱼ(n)} dⱼ(n / t).        (★)
```

Reason: unroll level 20 in powers of p₂₀, substitute the corresponding level 19 expansion, and continue downward. Unique prime factorization makes the powers of each suffix prime a unique `t`, and `(n / a) / b = n / (a*b)`. Each sum is finite; terms at zero vanish. In particular, distinctness and exact suffix indexing matter. `lean/RenewalUnroll.lean:43–75` supplies the one-prime unrolling; `lean/PrimePowerRenewal.lean:9–26` provides one level of rough-index reindexing, not (★).

For the literal ledger, the remaining **archive-specific** local identity is, for each j and each n including 0 and the zero-correction tail,

```
dⱼ(n) = ∑_{c in level j cells} if c.a ≤ n ∧ n < c.b then c.height else 0.   (†)
```

It must be derived from the actual max update and verified finite profile/bank inputs, not from the ledger's rational coefficient. The cutoff and endpoints are material: the documented cutoff is 500000, cells are half-open and the last endpoint may be 500001; d is zero beyond the cutoff. See `audit/archive-upper-proof-map.md:41–48` and `audit/ledger-source-map.md:19–27`. In particular, table identities and valid lower bounds for the seeds/old profiles are separate proof obligations.

## From a single block to the requested global count

Assume in addition the genuine graph certificate `Demand Edge (vertices Q n) (U₂₀(n))` for all n, where Q is exactly the 20-prime set. For `q ≤ N` with `Coprime q P₂₀`, (★) and (†) identify the required demand in that *one* smooth block with the sum of its allocated correction occurrences `(j,t,c)` for which

```
t ∈ Tⱼ(N/q),       c.a ≤ N/(q*t) < c.b.
```

`lean/LocalBlockDemand.lean:43–67` transfers this demand to the interval complement and sums over disjoint rough blocks. Thus the missing input is a **pointwise block demand and allocation**, not `hcover` or an equivalent assumed global sum.

To identify the resulting occurrences with the analytic cell counts, use the bijection

```
(q,t) ↦ m = q*t,
q positive, gcd(q,P₂₀)=1, t ∈ Tⱼ(N/q)
  ↔ 1 ≤ m ≤ N, gcd(m,Pⱼ₋₁)=1.
```

The inverse extracts from m all prime powers belonging to the suffix j,…,20; the remaining factor is coprime to all 20 primes. For positive cell endpoints, `c.a ≤ N/m < c.b` iff `N/c.b < m ≤ N/c.a`. Consequently the occurrence sum is exactly the cell count appearing in `ArchiveLedgerSumBridge` and each height is counted once **per occurrence**. This yields `hcover` for `f = A.card` after the existing disjoint-block accounting; no separate assumption of the global weighted sum is needed. Formalizing the bijection, floor equivalence, real casts, and actual literal index correspondence are still required.

## Important interface pitfall

`lean/PrefixArchiveBridge.lean:10–36` uses a Boolean `member i q` and therefore contributes a cell's height at most once per final-rough q. The needed allocation can contain several suffix factors for the *same* `(cell,q)`. For example, with Q={3}, N=3, q=1 and a cell [1,4), both t=1 and t=3 qualify. Thus merely setting `member c q` to existence of t loses multiplicity and cannot by itself justify its `hcount` against the analytic earlier-rough count. A repair needs a multiplicity-valued allocation or an enlarged `(cell,t)` index with an independently proved sum/reindexing theorem; the existing conditional bridge does not establish either.

## Source and verification boundary

The archive proof map explicitly records the max recurrence, correction definition, smooth-block decomposition and earlier-prime rough sum (`audit/archive-upper-proof-map.md:41–48`); `audit/upper-global-hostile.md:13–17` explains why cross edges do not invalidate lower bounds and why the tail cannot be omitted. These are source-evidence pointers, not kernel proofs. The strongest rigorously isolated obligations are (★), (†), the all-n soundness of `U₂₀` as a graph demand, and the stated finite bijection; none follows from ledger arithmetic. Their decomposition does not assert any one is the sole missing theorem for the endpoint. No Lean build, test, or hosted CI was run in this worktree; no remote state was changed.

## Conditional graph-demand propagation

`DemandRenewalChain` supplies graph-demand propagation for a max update, a zero-correction tail, and an indexed update chain. The separate hosted run 41415553727 at `d286f6a` passed the tests and three allowed-axiom gates; inclusion in `UpperIntegration` is a separate integration candidate pending its own CI. The chain requires prime and freshness, the insertion schedule, base demand, exact update equations, and demand certificates for every old and seed profile. The tail requires a parent demand and demand for every table entry through its cutoff. These are hypotheses, not certificates for the archive profiles. The archive-specific occurrence matching and per-block allocation, concrete 20-level demands, `hcover`, and provenance remain open; no unconditional endpoint follows.
