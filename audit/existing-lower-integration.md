# Existing unconditional lower bound: provenance and integration audit

## Outcome and evidence level

The historical artifact `/root/erdos302-explicit-lower` at commit `4d48553b6d522f0c9f675ee21970ade35db192ab` contains a tracked Lean formalization of an unconditional *lower bound*, not an exact solution. Its original approved endpoint is `5/8 + 1/(86400*commonL)`; the same commit contains a **strictly stronger but not independently approved** endpoint `5/8 + 1/(86400*(commonL-1))`. Here `commonL` is an explicitly defined, astronomically large natural number in `fixed-mixed-composition/CommonL.lean`, and the subtraction in the stronger formula is over the reals.

Evidence checked in this audit:

* Running `python3 /root/erdos302-explicit-lower/final-threshold-candidate/verify_final_endpoint.py` returned `ok: true`, `checked_sources: 62`, no failures and the two expected git heads. This is a source-hash, token, object-presence/mtime and pin check; **it is not a fresh kernel compilation or fresh `leanchecker` replay**.
* Running `python3 /root/erdos302-explicit-lower/stronger-endpoint/verify_stronger_endpoint.py` returned `ok: true`, 10 checked files, 62 baseline sources, and the stated standard axiom list. The existing `stronger-endpoint/compile.log` reports `propext`, `Classical.choice`, `Quot.sound` for the pointwise theorem and lower conclusion. `stronger-endpoint/RESULT.md` calls the stronger result a candidate pending hostile review. This audit did not independently replay its proof terms.
* All 59 explicit-lower sources in the baseline manifest are tracked at this commit, and their `.olean` files exist. The other three manifest sources are `/root/erdos302/lower-lean/Erdos302Lower/{Defs,FromErdos301,Maximum}.lean`; the 62-file manifest gives exact absolute paths and SHA-256 hashes. Other untracked files in the old worktree are not evidence of what commit 4d48553 contains and must not be assumed reproducible from that commit.
* A one-line import smoke test **did not succeed**: `lake env lean` in the historical #301 checkout attempted dependency re-cloning and failed at `fatal: unable to read tree (da1f94df976c7cd38117281c57d6ee3046c8d104)`. Thus a working current import or reproducible clean build has NOT been independently established. That attempted `lake env` unexpectedly wrote package checkout state in `/root/erdos302-lower-next/reproduction/sources/erdos-301-proof/lean/.lake`; it did not modify either the explicit-lower repository or the new audit repository. Investigate/repair only in a separate scratch clone; do not assume that checkout is pristine.

## Exact theorem entrypoints

* `/root/erdos302-explicit-lower/final-threshold-candidate/ExplicitEndpointCandidate.lean`: `Erdos302ExplicitEndpoint.f302_explicit_pointwise` proves `∃ N₀, ∀ N ≥ N₀, (5/8 + delta) * N ≤ (Erdos302Lower.f302 N : ℝ)` with `delta := 1/(86400*commonL)`; `f302_explicit_lower_candidate` packages positivity and eventual bound into `Erdos302Lower.Erdos302MaximumLowerConclusion`.
* `/root/erdos302-explicit-lower/final-threshold-candidate/LiminfAdapter.lean`: `f302_explicit_liminf_lower` and `five_eighths_lt_explicit_liminf`; normalization is `(f302 N : ℝ)/(N : ℝ)`, with the `N=0` issue avoided by working eventually above 0 and a proof `f302 N ≤ N` to justify real liminf boundedness.
* `/root/erdos302-explicit-lower/stronger-endpoint/StrongerEndpoint.lean`: `Erdos302StrongerEndpoint.f302_stronger_pointwise`, `f302_stronger_lower_candidate`, and `old_delta_lt_delta`. The improved denominator follows from `Real.log_lt_sub_one_of_pos` and the existing kernel Mertens lower constant. `/root/erdos302-explicit-lower/stronger-endpoint/StrongerLiminf.lean` exports `f302_stronger_liminf_lower` and `five_eighths_lt_stronger_liminf`. Historical compile and axiom logs are in the same directory.
* This is not a numeric estimate with a practical onset, a matching upper bound, proof of convergence, or the exact extremal density.

## Provenance, direct/transitive dependencies

The #302 source is `/root/erdos302`, origin `https://github.com/khanukov/erdos302.git`, HEAD `98130e08b1491d5242c945808603ea7955f4cd52`; distinguish it from the private audit origin `https://github.com/khanukov/erdos-302.git` at `4bc566326f4e9db487e41ffe7a4439b823e64fe6` when inspected. The source HEAD is the pinned public-repository local snapshot; this audit did not establish the current remote's tip or visibility. See `/root/erdos302/docs/LOWER_BOUND_PROVENANCE.md` for the prior qualitative theorem and its historical CI record. It has `Erdos302Lower.erdos302_f302_lower_five_eighths_plus` already, but without an explicit rational delta.

Exact historical external pins from that file and `/root/erdos302-lower-next/reproduction/sources/erdos-301-proof/lean/lakefile.toml`:

| Dependency | Revision / configuration |
|---|---|
| `donalddellapietra/erdos-301-proof`, `lean/` | `789c6f045dbc81da3811031247d186a7128dafce` |
| `donalddellapietra/erdos-327-proof`, `lean/` | `a7201442f71af90a8e7b930f993c8eec69f685cf` |
| `teorth/mathlib4` fork | `da1f94df976c7cd38117281c57d6ee3046c8d104` |
| Lean | `leanprover/lean4:v4.33.0-rc1` |

The #302 root toolchain is instead Lean `v4.27.0`; the lower proof explicitly uses `lower-lean/` and 4.33. Do not import 4.33 `.olean`s into another compiler or silently replace the fork with stock Mathlib. #301 uses #327 analytic declarations. The public provenance says its lower CI uses cached upstream `.olean`s and on main/tags/manual runs a `leanchecker --fresh` replay; this is historical documentation, not an independently run check here. Cached `.olean` kernel replay is not a clean source rebuild.

Key actual proof chain: `final-mixed-integration/UnconditionalMixedClosure.lean` imports `BulkAllocation`, `SieveAllocation`, `TransitionAllocation`, `TerminalProfileClosure`, `BoundaryABIAdapters`; combines these with the five-way and rough-third integration into `eventualRoughThirdBudgets_unconditional`. The endpoint constructs `Erdos301.Analytic.roughThirdSet`, uses its subset/admissibility/decomposition and density lemmas, unions the disjoint `Erdos302Lower.oddQuarter`, then applies `Erdos302Lower.card_le_f302` from `Maximum.lean`. `final-ambient/AmbientWitnesses.lean` supplies the explicit density/absorption inequalities; #327's Mertens estimate is used for the explicit rational minorant. `stronger-endpoint/StrongerEndpoint.lean` directly imports `ExplicitEndpointCandidate`, `AmbientWitnesses`, and `Erdos302Lower.Maximum`, then builds on the same carrier chain. The complete import closure must be generated from sources, not inferred from this summary.

## Minimal integration and reproduction procedure

The minimum **consumer entrypoint** for the standard endpoint is `import LiminfAdapter` (or `import ExplicitEndpointCandidate` if only pointwise); for the stronger endpoint it is `import StrongerLiminf` (or `import StrongerEndpoint` for pointwise). This is one import at the API level, **not** a one-file build: all transitive Lean sources and pinned packages are required. Test for example:

```lean
import StrongerLiminf
#check Erdos302StrongerEndpoint.f302_stronger_pointwise
#check Erdos302StrongerEndpoint.f302_stronger_liminf_lower
#print axioms Erdos302StrongerEndpoint.f302_stronger_liminf_lower
```

For an isolated source reconstruction, use the 62-file exact source manifest at `final-threshold-candidate/source_manifest.json` plus tracked stronger endpoint sources, and retrieve precisely pinned #301, #327, mathlib and all their pinned Lake dependencies. Study `final-threshold-candidate/rebuild_final_endpoint.py`: it derives a dependency-first local build order from the imports and enumerates the required separate module search roots; however its paths are hardcoded to `/root` and it writes `.olean` next to historical sources. **Do not run it in place.** Adapt the script and manifest to an isolated copy with matching Lean module names, make all source and object paths unambiguous, verify all hashes, build dependencies first, then run the import smoke test and `leanchecker --fresh` or equivalent fresh proof-term replay; report exact commands, pins, hashes and axiom transcript. The baseline verifier alone checks timestamp freshness, not source-to-object correspondence cryptographically or clean reproducibility. The previous build was resource-intensive according to `STATE.md`, so plan substantial memory/time and do not compete with the ongoing independent rebuild.

The new private repository has `lean/Bridge.lean` importing only `Std`, and no declared Lake/mathlib project in its tracked root. Therefore no verified drop-in import currently exists. Keep the heavyweight 4.33 proof in a pinned separate Lake project or explicitly adopt that toolchain and exact dependencies; do not overwrite its ongoing Std-based independent work. After compilation, add a checked bridge theorem between `Erdos302Lower.NoUnitFractionTriple` on finite sets and `Erdos302Bridge.TripleFree` on membership predicates restricted to positive intervals. The local bridge uses the ordered polynomial relation `0<a<b<c` and `b*c=a*(b+c)`, while the lower source prohibits the rational equality for every pairwise distinct ordering. For positive denominators, rational positivity forces the reciprocal's denominator to be the smallest and the two tails can be swapped; clear denominators to establish both directions. This equivalence is mathematical reasoning here, **not a Lean-proved compatibility theorem**. The new bridge by itself is a local weighted inequality, not the global upper bound or the lower extremal theorem.

## Relation to the original problem

`/root/erdos302/lower-lean/Erdos302Lower/Defs.lean` defines pairwise-distinct `a,b,c` and rational `1/a ≠ 1/b+1/c`. `Maximum.lean` filters the powerset of `Finset.Icc 1 N` and takes the supremum of cardinalities. This matches the finite positive-interval extremal function in the problem statement, including distinctness (not the stronger convention allowing `b=c`). The formal `ℚ` equality agrees with the usual equality of unit fractions because all denominators in `Icc 1 N` are positive. This semantic comparison was inspected, not machine-checked against an external formal problem specification. Source: https://www.erdosproblems.com/history/302 .

## Licensing and publication safety

* `/root/erdos302/LICENSE_SCOPE.md` and `/root/erdos302/LICENSE` state that original #302 repository software, Lean code and non-paper documentation are MIT with copyright notice; `paper/` original manuscript is CC BY 4.0. Carry notices when copying MIT material.
* The explicit-lower repository itself has **no tracked LICENSE/COPYING file** at commit 4d48553. Its source is not automatically covered by the separate public repository's license merely because it imports it. User authorization permits local reuse for this task; obtain an explicit rights/license grant before redistributing those original files.
* The #302 `LICENSE_SCOPE.md` says the pinned #301 and #327 repositories have no license files and are not relicensed by #302. Verify the exact upstream snapshot and obtain required permission before vendoring/redistribution. The fork's license and transitive dependencies must be checked separately. External fetch as a dependency is not proof of permission to redistribute.
* The new audit repo README declares the workspace private and preliminary, with no inferred license or human-author signoff. No remote write/publication was made.
