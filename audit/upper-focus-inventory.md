# Upper-bound inventory — 2026-11-01

## Verdict

The uploaded profile-only coefficient is **not** accompanied by a complete Lean proof. It is stronger numerically than both the user's public end-to-end Lean result and the pinned external profile result, but the bank, translations, and global bridge are not yet checked proof terms. A separate exact comparison of the stated integers has now been kernel checked; this is arithmetic only and does not prove a bound.

## Public main and exact scope

Read-only `git ls-remote https://github.com/khanukov/erdos302.git refs/heads/main` on 2026-11-01 returned `a60f43511ce0741ef6e80bdb9b620c5bf854f81c`, matching the local `refs/remotes/origin/main`. Be careful: `/root/erdos302` is a bare repository whose HEAD points to an older development branch at `98130e08b1491d5242c945808603ea7955f4cd52`, not public main. The independent audit repo `/root/erdos-302-independent-audit/repo` has a different remote (`khanukov/erdos-302`) and is not the public repo under review.

At public main, `Erdos302/Asymptotic/Integration.lean:30–47` states `Erdos302.Asymptotic.erdos_302_upper_140803024_163562355`: for any `f : ℕ → ℕ` satisfying `∀ N, IsMaxNoTripleCard N (f N)`, and any positive real epsilon, eventually `(f N : ℝ) ≤ (140803024 / 163562355 + epsilon) * N`. The same module's `f302_upper_140803024_163562355` specializes to the concrete extremal function and removes the maximality parameter. This is about distinct reciprocal triples. The constant is approximately 0.860852266403232. `Integration.lean` imports `Asymptotic.Endpoint` and `Packing.PrefixOmission`; the finite bank lies in generated BasePrefix and Packing modules, with `certificates/q139708800/certificate.json` and `certificates/q3360/exact_certificate.py` the non-Lean verification inputs. `Erdos302/UpperBound.lean` is just generic packing infrastructure and is not the final proof.

The main README reports the end-to-end Lean theorem, an exact-main cache-free rebuild of 80,181 project modules, 160,362 outputs, and axiom allowlist `[propext, Classical.choice, Quot.sound]` at earlier exact source commit `015d376e432040a2a71c7a5689c2fd238779ac2c`, claiming no project-local Lean source changed in this revision. These are **repository-reported** results; I did not independently reproduce the enormous build or verify the remote CI run here. The work is preliminary, unrefereed, and the README says not independently verified. The exact theorem has no bank-validity hypothesis; the maximality premise characterizes the function rather than assuming its upper bound.

## Pinned Kitamura upstream

Read-only remote main matched `9447ceb28138949b2fb32442cec506a6f53104f9` (2026-09-25). `lean/lean-toolchain` specifies `leanprover/lean4:v4.27.0`; `lean/lakefile.toml` pins Formal Conjectures at `69a8f0781aa26ca8b46d615df5ed80f698467ae4`; upstream README reports Mathlib `a3a10db0` and successful builds with standard axioms. No independent full build or axiom query was run in this investigation; `/root/erdos-302-independent-audit/kitamura/lean/.lake` was absent.

`lean/Erdos302ReflectiveUpperFC.lean:31–33` provides the unconditional finite theorem `Erdos302ReflectiveUpper.reflective_card_bound`: for `A ⊆ Finset.Icc 1 N` and `Erdos302.NoUnitFractionTriple A`, `(A.card : ℝ) ≤ upperConstant * N + 53896239`. Its constant is

`303298432907684665348375061155255053723893276661771828230864577892179469 / 358435072543067896655954874015956559321978063343228205466655134412800000` ≈ 0.8461739827964009.

`reflective_limsup_normalized` assumes only `∀ N, Erdos302.IsMaxNoTripleCard N (f N)` and obtains limsup ≤ that exact constant. This is stronger than the public user's formalized 0.86085, but does not establish 0.84123. `Erdos302ReflectiveChainTopFC.lean` has `chain_0` … `chain_19`, pairing agreement with encoded tables to 500000 and all-n smooth-set cover lower bounds; `correction_i` ties chain corrections to interval tables. Exact interface and previous data-only 10,000,020-entry comparison are documented in `global-route.md:31–45`; the latter is not a Lean identity proof. Four active-prefix bank demands `(420,71), (644,102), (806,124), (814,125)` additionally need isolated-vertex trimming proven.

## Supplied baseline

`source/erdos302_boundary_certificates/baseline/claim.json` gives exact C:

`5257732070693282578339807052385333596114146444258874863366093099862086223334703221767412397 / 6250046986665851271465761945238620015244311869639997944823697072137494392402703576166400000`.

The desired finite theorem is `f302 N ≤ C*N + 55064831540` for all N, then limsup ≤ C < `841230807050/10^12`. This is a **target**, not a checked Lean theorem. `LEAN_HANDOFF.md` explicitly says the data were not compiled and lists missing proof obligations. Profile-only excludes outside packing; an older claimed combined 0.839541658150 is mentioned in `PROOF.md` but was not audited and cannot be credited as a formalized result. The boundary cuts report no added global gain.

SHA-256 local snapshot fingerprints (not externally authenticated provenance):

- `claim.json`: `a48fee528f91b66e0ac973e61cd8c2e3c73be8e8102734c0eea8055926ec93f7`
- `bank.json.xz`: `5c1a1fa4edcc1a0bc7ac3fc9cd3bc7fca4eedad6cb689b6540436ca35ed89034`
- `upstream_intervals.json`: `b9f1b518c895fffc8efe40b6abb9b39cd877ef77ef0c78b5211b5b103b117111`
- `PROOF.md`: `0e028ac30d662c5ed7ca92fb10b6c35054094163c9dc888dd7e2b05187b45bb1`

`checker-audit.md` documents static review, arithmetic checks, and untrusted code risks; no uploaded code was executed for this inventory. It did not establish bank soundness or the all-N bridge. Uploaded-generated source must not be run without sandbox review.

## New checked milestone

`upper-milestone/ExactComparison.lean`, independently written using only `Std`, contains closed natural-number cross-multiplication propositions proving baseline C < headline 0.841230807050 and C < upstream Kitamura C. Running `lean +leanprover/lean4:v4.27.0 ExactComparison.lean` succeeded, and `#print axioms` reported no axioms for both theorems. This is exact numerical comparison **only**: it neither checks the bank nor establishes the C bound. No uploaded code was executed.

## Actionable kernel route and blockers

1. In a sandbox, independently rebuild Kitamura's exact pinned upstream closure and inspect the elaborated `reflective_card_bound`, `chain_0` … `chain_19` and their transitive axioms. It requires the exact Lean 4.27.0, pinned Formal Conjectures, and the corresponding Mathlib closure; author estimates ~1.5 h and up to ~4 GB for one module. Separate dependency cache trust from fresh local build and record hashes and logs.
2. Import the proved chain results, not JSON hashes as hypotheses. Prove each concrete decoded profile/correction matches the local reified data and derive the four active-prefix propositions by a formal isolated-vertex deletion lemma.
3. Formalize bank semantics and soundness: reciprocal edge completeness; positive injective scaling; integer/rational weighted cover and capacity rounding; residual case trees; active trimming; explicit extension edge covers. Reify the supplied bank as data only after hardened parsing; verify all finite certificates with kernel reduction and no `sorry`, invented axioms, or unreviewed native evaluation.
4. Prove parity-aware projection, the renewed 20-prime recurrence, zero-correction tail, smooth/rough disjointness and inclusion–exclusion error. Recompute corrections with overlap accounting, rather than subtracting the new savings from an unchanged old integral. Connect the exact rational ledger and finite error to the actual extremal function.
5. Build in isolated source/object directories, query final theorem and `#print axioms`; do not label a conditional wrapper or cached numerical replay an unconditional theorem. The reusable public 0.86085 finite packing machinery is useful precedent but has a different bank and does not by itself implement this profile renewal.
