# Global finite summation: CI candidate, not kernel-verified

This overlay is a candidate only. **No Lean execution, hosted CI run, or remote write was performed.** There is no successful red/green Lean cycle; elaboration, theorem statements, transitive axioms and tests require hosted CI. No `sorry`, `native_decide`, or user-defined axioms are intentionally used. Check `#print axioms` in the CI log. The CI uses the repository's pinned Lean 4.33.0-rc1, mathlib commit and lake project; it relies on downloaded mathlib oleans and is not a cache-free independent rebuild.

## What the candidate proves if it compiles

`weightedCount_lower` sums per-cell real lower estimates `ideal i - error i ≤ count i`, multiplying by explicitly nonnegative height `h i`. The index set is finite and arbitrary, and no assumption that error is nonnegative is logically required. `global_upper` combines this with the separate block-accounting premise `f + weightedCount ≤ N` to derive `f ≤ N - weightedIdeal + weightedError`. It does not assume that conclusion, but does require the substantial renewal/block cover bound as an input. `count_cell_eq` equates the filtered finite q search to a filtered `Ioc (N/b) (N/a)`, assuming `a>0`; it does not prove the relation to floor quotient cells or an inclusion–exclusion estimate. The default roughness predicate is True; actual roughness must be instantiated explicitly. No prime, coprimality, or archive facts are silently assumed.

The intended specialization uses a finite index of level/cell pairs; `h` is the natural correction height cast to real; `count` is the rough q-count, `ideal` is `N*ρ*(1/a-1/b)` and `error` is the corresponding per-cell bound (e.g. `2^j`). To instantiate the theorem one must **prove**, not posit as a verified archive fact:

1. Ordered prime sets and their rough-factor unique decomposition; true smooth-block cover lower bounds and the finite recurrence/termination expansion, including U(0)=0 and zero corrections above X.
2. Exact equality of correction table cells to the expanded renewal sum, with no double-counting, positive cell endpoints, and the identity `a ≤ N/q < b ↔ N/b < q ≤ N/a` for positive q and endpoints.
3. Inclusion–exclusion rough-count discrepancy uniformly in N, with the correct density and archive error factor; cast natural counts to real. This is the missing per-cell `hc`, not established by this module.
4. Valid finite seed/profile bounds, pointwise upstream identification, all correction-cell computations, and exact rational ledger `weightedIdeal = N*G`, `weightedError = 55064831540`, `1-G=C`, plus the extremal function bridge and limsup argument.

Existing `Renewal.lean` and `SmoothRenewal.lean` give generic candidate ingredients but are not imported here: those exact modules and their own CI/axiom status must be validated before integration. No 0.84123080704999 global theorem is proved by this overlay.

## Test and handoff

Copy `Summation.lean` and `SummationTest.lean` into `lean/` and `summation.yml` into `.github/workflows/`; run hosted CI on an authorized branch, inspect the full output, and repair any Lean elaboration issues. The tests cover a concrete finite ledger, use the aggregation theorem with a negative discrepancy, and an equal-endpoint cell. `check_arithmetic.py` is an independent finite sanity check, not proof and not a substitute for CI. Workflow intentionally does not upload or push anything. The overlay itself is not a running CI environment.
