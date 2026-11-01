# Erdős 302: pinned upstream theorem and route to an unconditional bound

## Verdict

The pinned public Kitamura source **does contain a formal statement and proof text for an unconditional global upper bound**, but its constant is **0.8461739827964009…**, not the local package's **0.8412308070499916…**. The latter is a proposed improvement requiring the local proof bank and renewal bridge; it is not an already formalized Kitamura result. The local package's boundary cuts produce no further global improvement in its reported run. This audit examined the exact public source and independently compared its 20 profile data against the local transcription; it did **not** rebuild the upstream Lean project or prove the new bridge. The source author reports successful builds and standard axioms; that is not an independent rebuild.[1][2]

## Exact pinned theorem and provenance

The public repository `KitaKen1/erdos-302-upper-bound` was cloned and checked out at `9447ceb28138949b2fb32442cec506a6f53104f9`; `git log -1` reports 2026-09-25 09:59:34 +0900, subject “Add a Lean proof of an improved upper bound for Erdős Problem 302”. Its `lean/lean-toolchain` pins Lean `v4.27.0`; `lean/lakefile.toml` pins Formal Conjectures `69a8f0781aa26ca8b46d615df5ed80f698467ae4`. README reports Mathlib `a3a10db0` and states author-run builds and axiom output `[propext, Classical.choice, Quot.sound]`; these were not independently reproduced here.[1][6]

Let `NoUnitFractionTriple A` and `IsMaxNoTripleCard N (f N)` be the upstream imported Formal Conjectures definitions. In `lean/Erdos302ReflectiveUpperFC.lean:29–33`, the precise finite theorem is

```lean
theorem Erdos302ReflectiveUpper.reflective_card_bound
  (N : ℕ) (A : Finset ℕ) (hA : A ⊆ Finset.Icc 1 N)
  (hfree : Erdos302.NoUnitFractionTriple A) :
  (A.card : ℝ) ≤ Erdos302PriorityUpper.upperConstant * N +
    Erdos302ReflectiveUpper.reflectiveError
```

Here `reflectiveError = 53896239`, and `upperConstant` is exactly

```text
303298432907684665348375061155255053723893276661771828230864577892179469
/ 358435072543067896655954874015956559321978063343228205466655134412800000
= 0.8461739827964009…
```

The module's `reflective_maximal_card_bound` states the same for `f N` for every `N`; `reflective_limsup_normalized` proves the limsup ≤ the exact constant; `limsup_le_0_8461739827964010` gives the decimal rational; `eventually_le_0_8461739827964010` has the usual `∀ ε>0, eventually ...` statement. These declarations have the extremal-function specification as a hypothesis, not a hypothesized upper bound or finite-certificate premise.[1][2] They do not assert the exact density or the local 0.84123 coefficient.

## External profile interface: direct source-to-data audit

The exact relevant declarations are in `Erdos302ReflectiveChainTopFC.lean`, not merely its final global theorem. For example:[3]

```lean
Erdos302ReflectiveChain.chain_18 :
  (∀ n ≤ 500000, chainSol_18 n = predT TL_18 0 n) ∧
  ∀ n, CoverLowerBound (smoothSet {2, 3} n) (chainSol_18 n)
```

Analogous `chain_19` through `chain_0` cover the 20 sets, with index 19 corresponding to `{3}` and index 0 to all primes through 71; each `chain_i.1` equates the solution and decoded table through 500000 and each `.2` supplies the smooth-set cover lower bound for **all** `n`. `correction_i` identifies the corresponding correction with `ivalAt I_i`. `Erdos302Reflective.level_cover` explains all hypotheses: primality, checked finite recurrence, agreement of the parent, a valid parent cover bound, and valid listed witnesses; it derives both table agreement and the all-n cover bound.[3][4]

Independently, using Python's JSON parser and direct reading of pinned Lean list literals, I compared each `I_0`–`I_19` to the corresponding local `baseline/upstream_intervals.json` list in **the same order**: all 749 pairs matched exactly, with zero mismatched levels. I then decoded each upstream `TL_i` packed integer pair in the documented low-20-bit-first order,[5] built each table's predecessor lookup, and independently reconstructed the local recurrence from the JSON corrections, in reverse index order, for **all 500001 n values at all 20 levels**. There were **zero mismatches among 10,000,020 entries**, including n=0. At level 0 the four `externalActive` nodes in `baseline/bank.json.xz` query `(n, demand) = (420,71), (644,102), (806,124), (814,125)`. Script: `/root/.hermes/cache/scratch/compare302profiles.py` (scratch may expire). This is a data-level comparison, not a Lean theorem about the transcription and not a replay of the local bank.

The mapping is local order `P=(3,2,5,...,71)` at level j ↔ upstream index `20-j`, with half-open interval `[a,b)` and overlapping intervals counted with multiplicity. An aggregate rational match alone would not establish this correspondence; the comparison above checks substantially more, but the parser and lookup remain outside the Lean kernel. For the four `externalActive` facts, additionally prove that deleting isolated vertices from the upstream smooth prefix preserves its cover number: one direction restricts a cover to the active support and the other extends by no isolated vertices, using complete edge enumeration. The local bank computes the active support at `baseline/verify.py:125–128`; ordinary prefix demand is not definitionally the same support.

## Lowest-risk path to a new unconditional Lean bound

1. **First obtain a checked baseline, not a conditional wrapper.** In an isolated environment run the pinned repository instructions (`cd lean; lake exe cache get; lake build`), save build output and explicitly run `#check` and `#print axioms` for `reflective_card_bound`, `reflective_limsup_normalized`, `chain_0` through `chain_19`; compare their actual elaborated types to the source above. The upstream README estimates ~1.5 hours Lean time and up to ~4 GB in one module; those are author estimates, not this audit's measurements.[1] This step alone provides a rigorous partial result at ~0.846174 if the independent kernel build succeeds.
2. **Import, don't assume, the old profiles.** Derive each full prefix cover proposition from `chain_i.1` and `.2`. Represent the local intervals as Lean data and prove equality with each `I_i` or independently prove pointwise equality with `predT TL_i 0 n` for `n≤500000`; discharge by chunked kernel `decide`, not by hash or unchecked `native_decide`. Supply the four active-prefix facts explicitly with proven isolated-vertex trimming and each exact numeral above.
3. **Reify and prove the new finite bank.** Prove checker soundness for small-edge enumeration, injective positive rational scaling, integer/rational weighted-capacity rounding, residual case trees, and trimming. Have kernel-reduced computation verify the concrete bank and extension witnesses. Connect support elements and edges to upstream `CoverLowerBound` and its reciprocal-equation definition. A Python pass or historical mutation test is not a proof term.
4. **Reuse upstream chain and aggregation.** Feed newly proved seed/witness bounds into `level_cover` or its underlying finite recurrence and existing smooth/rough-counting modules, producing new chain tables and correction intervals. Prove per-level table agreement, witness selection, nonnegative corrections, cutoff tail and exact endpoint arithmetic. Each local `U_j` must use recomputed corrections; adding new gains to an old correction list without accounting for shared charges is unsound. The provided `baseline/PROOF.md:125–194` gives an argument, not a compiled instance.
5. **State and check the actual resulting type.** Target the finite assertion `∀ N f, IsMaxNoTripleCard ... → (f N : ℝ) ≤ C*N + 55064831540`, with exact C from `baseline/claim.json`, followed by the limsup corollary. Check `#print axioms` on the final declarations and ensure no extra imported assumptions or `sorryAx`. Arithmetic was independently checked in `checker-audit.md`, but the bank and transfer were not kernel-checked there.

No claim is made here that this bridge is short: it is a concrete reuse plan, not a completed Lean proof. The public 0.84617 theorem cannot alone entail 0.84123, and the local profile equality audit only authenticates old data, not the new proposed savings.

## Stronger bound and local certificate scope

The package itself says its 0.841230807050 profile-only claim does **not** improve the earlier combined claim 0.839541658150 (`baseline/PROOF.md:204–208`). That earlier value's proof and status were not audited here; do not treat it as an established or formalized bound solely on this basis. The boundary package reports all 20 modified profile hashes unchanged, so there is no justified extra subtraction from 0.84123. A genuinely stronger global bound requires a fresh global seed, globally valid packing/availability certificate, or a larger profile search, followed by the same soundness and overlap accounting; a local strict separation by itself is not such a certificate.

For a tractable partial result, the local independent `math-audit.md:11–35` gives a direct elementary proof for `S={12,15,20,21,28,30,60,70}`, boundary `B={21,30,70}`, interior `I=S\\B`: every reciprocal-edge cover C satisfies `2|C∩I|+|C∩B|≥5`. The `lean-audit.md` separately reports successful compilation of 119 finite generated propositions after changing only the import from Mathlib to Std, but not the embedding of those Boolean propositions into the actual extremal problem. Proving that one embedding for arbitrary positive dilations is a manageable, unconditional, kernel-checkable intermediate result, not a numerical improvement of the global bound.

## Audit limitations

The upstream clone is a new local read-only-source working copy under `/root/erdos-302-independent-audit/kitamura`; no remote writes were made. No external Lean rebuild, transitive axiom query, proof-bank replay, or global 0.84123 proof was performed in this audit. The upstream author's verification and lack of independent human review are distinguished in its README.[1] This was a targeted source/interface audit, not an exhaustive literature search or a claim that the pinned public result is the strongest result in all later sources.

## Sources

[1] https://github.com/KitaKen1/erdos-302-upper-bound/blob/9447ceb28138949b2fb32442cec506a6f53104f9/README.md

[2] https://github.com/KitaKen1/erdos-302-upper-bound/blob/9447ceb28138949b2fb32442cec506a6f53104f9/lean/Erdos302ReflectiveUpperFC.lean

[3] https://github.com/KitaKen1/erdos-302-upper-bound/blob/9447ceb28138949b2fb32442cec506a6f53104f9/lean/Erdos302ReflectiveChainTopFC.lean

[4] https://github.com/KitaKen1/erdos-302-upper-bound/blob/9447ceb28138949b2fb32442cec506a6f53104f9/lean/Erdos302ReflectiveChainFC.lean

[5] https://github.com/KitaKen1/erdos-302-upper-bound/blob/9447ceb28138949b2fb32442cec506a6f53104f9/lean/Erdos302ReflectivePackFC.lean

[6] https://github.com/KitaKen1/erdos-302-upper-bound/tree/9447ceb28138949b2fb32442cec506a6f53104f9/lean
