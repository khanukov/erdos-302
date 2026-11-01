# Further unconditional lower endpoint: removal of artificial half-loss

## Result and scope

Write `L = Erdos302FixedComposition.commonL`, `rho = Erdos301.Analytic.roughDensity L`, and let `f302(N)` be the existing formal finite maximum. The new Lean module proves, with no additional mathematical hypotheses,

1. `∃ N₀, ∀ N ≥ N₀, (5/8 + rho/24) N − 1 ≤ f302(N)` (`LowerNext.core`).
2. For **every real** `d < rho/24`, `∃ N₀, ∀ N ≥ N₀, (5/8 + d) N ≤ f302(N)` (`LowerNext.endpoint`). The threshold may depend on d.
3. In particular, with `d_log = 1 / (43200 log L)`, the pointwise eventual lower bound holds (`LowerNext.improvedLog`). The intermediate rational choice `d_2 = 1 / (43200 (L−1))` also works (`LowerNext.improved`). The module proves `d_2 = 2 * Erdos302StrongerEndpoint.delta` and `d_2 < d_log`; thus the logarithmic endpoint is **strictly more than twice** the previously rebuilt increment. Here `L ≥ 17`, and logarithm is the real natural log.

As an immediate real-analysis consequence of (2), `liminf f302(N)/N ≥ 5/8 + rho/24`: for each d below rho/24 the eventual normalized bound applies, and the supremum of such d is rho/24. This liminf corollary has not separately been formalized in the new module. The endpoint `rho/24` is not claimed as an eventual pointwise bound without the `−1` term.

## Proof and bridge

The construction and hypotheses are exactly those already established by the isolated rebuild. At all sufficiently large N, the unconditional budget theorem gives an admissible upper-third structured carrier C with `|C| ≥ (1/2 + rho/24)N`. The existing padding theorem says the disjoint union of C with the odd quarter is 302-triple-free, while the odd quarter has size at least `N/8 − 1`. Therefore `f302(N) ≥ (5/8 + rho/24)N − 1`. For any d strictly below rho/24 choose a natural K greater than `1/(rho/24 − d)`; for N≥K the difference `(rho/24−d)N` exceeds 1, absorbing the rounding loss. This avoids reserving half the positive density as in the older endpoint proof. No new construction, universal upper bridge, or solution of the full extremal problem is claimed.

For the explicit comparison, the imported certified inequality `mertensLowerConstant > 1/1800` and Mertens lower bound imply `rho > 1/(1800 log L)`. Dividing by 24 makes d_log strictly smaller than rho/24. `log L < L−1` gives the strict comparison to d_2. The proof checks positive denominators and the actual order of quantifiers.

## Evidence and trust boundary

- Source: `/root/erdos-302-independent-audit/bridge/LowerNext.lean`, SHA-256 `4c35f6c7153449c0f3acd91f2fae496dc839b9a098e5ad3260dc0bc71c68616d`.
- Successful full Lean invocation (exit 0): `export LEAN_PATH="$(< /root/erdos-302-independent-audit/explicit-rebuild/lean-path.txt)"; lean /root/erdos-302-independent-audit/bridge/LowerNext.lean`. Output: `bridge/LowerNext.log`, SHA-256 `fcfb5be6f667ea2fd5d9a29c3da64284cefc3b7468d96d48d553afb8749ab962`. Only tactic-linter warnings. `#print axioms` for core, endpoint, rational and logarithmic improvements and their comparison reports `[propext, Classical.choice, Quot.sound]`.
- The module imports `StrongerEndpoint` from the fresh source rebuild described in `explicit-rebuild/RESULT.md`; the upstream dependency oleans were reused and not independently kernel-replayed in that rebuild. This is a checked derivation from the existing formal construction, not an independent verification of its entire mathematical interface or upstream dependencies. Thresholds are existential, and `L` is the enormous fixed imported parameter. No claim of public numerical-record improvement or novelty outside the inspected local endpoints is made.
- The source reuse intentionally preserves existing cardinality, admissibility, disjointness and maximum interfaces rather than relying on a conjectural global bridge. The result is a genuine improvement of the previously displayed formal constant but does not bypass the original construction's constraints or address an upper bound.
