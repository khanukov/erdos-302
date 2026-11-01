# Archived profile-only upper bound: proof and Lean dependency map

## Status and target

The archive **claims**, rather than supplies a kernel-verified proof of, the new all-N global upper bound. For the literal extremal function for distinct reciprocal triples, its target for N ≥ 1 is

```
f(N) ≤ C N + 55064831540
C = 5257732070693282578339807052385333596114146444258874863366093099862086223334703221767412397
  / 6250046986665851271465761945238620015244311869639997944823697072137494392402703576166400000
  = 0.841230807049991667993742190184877435609795058845356675464801...
```

Consequently it claims limsup f(N)/N ≤ C < 841230807050/10^12. This is profile-only: no outside-packing gain is included. It improves the archive's previous *profile-only* coefficient 0.8412635945052484…, not its mentioned, unaudited earlier combined 0.839541658150. Neither the upstream 0.84617 theorem nor a lower-bound construction proves this new claim. Evidence: `source/erdos302_boundary_certificates/baseline/PROOF.md:7-30,183-194,204-212`; `RESULT.md:11-57`; `claim.json`. Paths below are relative to `/root/erdos-302-independent-audit`; `B` abbreviates `source/erdos302_boundary_certificates/baseline`.

## Finite data and dependencies

Direct stdlib JSON/lzma parsing of `B/bank.json.xz` gives **4,106 nodes**, **25,744 image records**, and **0 named roots**: 3,528 `small`, 448 `pack`, 1 `qpack`, 122 `case`, 3 `trim`, 4 `externalActive`. Images are triples `(earlier-node-index, positive numerator, positive denominator)`; strict earlier-reference and integral images are checked by the proposed verifier (`B/verify.py:84-100`). The zero named-root count does not mean the proof is empty: all verified nodes become candidate witnesses (`verify.py:161-168`). Data are a pruned dependency DAG, with only proof ancestors of relevant seeds retained according to the archive (`PROOF.md:196-202`); this retention claim has not independently been proved in Lean.

The report additionally *reports*, without thereby proving validity, 17,530 small subset tests, 567,491 packing-weight entries, 2,626 visited case-tree nodes and 301,630 case-weight entries; 515 extension records with 41,776 listed deletions, 217 source supports, edge universe ≤ 40,000 and 49,708 enumerated arithmetic edges (`B/VERIFIED_REPORT.json`, keys `finite`, `extensions`; `verify.py:180-216`). Direct JSON parsing separately confirms 515 extension records. These numbers describe claimed computation, not verified cover bounds.

The proposed finite rules, their mathematical content, and the Lean bridge are:

| Rule | Precise proof obligation | Existing/planned mapping |
|---|---|---|
| `small` | On ≤9 positive vertices enumerate genuine reciprocal edges and eliminate every (r−1)-subset (r≤3); any smaller cover extends to that size. | `upper-bank/UpperBank.lean:7-56` has `Cover`, `check_sound`, `ordered_sound`; `:58-78` proves nodes 0 and 1. Listed genuine edges suffice for this *lower bound*, so completeness is unnecessary here. All remaining concrete checks and bank-data correspondence are missing. |
| image/dilation | m,d>0, all mv/d integral, injectivity and preservation of bc=a(b+c), plus normalization, preserve the demand. | No general archive-image soundness theorem identified; build one and certify all image references. |
| `pack`,`qpack` | For nonnegative weights, each vertex load ≤D and objective Σwᵢrᵢ>D(k−1) imply |cover|≥k. Rational weights can be cleared by a verified positive common denominator. | `upper-weighted/Weighted.lean:7-40` contains `weighted_inequality` and `weighted_bound`, but this workspace has no `Weighted.olean`; compilation/axiom status was not established here. `upper-bank-extended/Extended.lean:30-45` has the simpler disjoint `pack`. Full archive packing interpreter and rational reduction are missing. |
| `case` | On target T, O selected, Z excluded, F=T\\(O∪Z), each earlier `(S,r)` gives residual ≥r−|S\\T|−|O∩S|. A valid dual leaf exceeds remaining budget; impossible row/budget, forced equality and both split branches close by well-founded induction. | `Extended.lean:46-54` has a generic `branch`, not the residual/forcing/dual tree interpreter. `Weighted.weighted_bound` is a candidate leaf lemma if built. Must certify all trees and strictly earlier child/dependency indices (`B/verify.py:129-159`; `PROOF.md:72-86`). |
| `trim`, `externalActive` | Deleting isolated vertices preserves the cover demand; active support must be defined from *complete* edges. Four full-prefix demands at (420,71), (644,102), (806,124), (814,125) require restriction to active support. | `Extended.lean:55-69` has `trim_cover`, `trim_bound` with explicit edge-coverage hypotheses. Derive hypotheses by complete enumeration; obtain full prefix facts from pinned upstream chain proof terms, not a JSON label (`global-route.md:31-45`). |
| extension | For Q-smooth T⊆S, verify U⊆S\\T meets every edge not in T; then τ(T)≥r−|U|; for prefix n subtract additionally |T∩(n,∞)|. | Build complete arithmetic-edge enumerator and its soundness/completeness, then extension lemma and 515 instance checks (`B/verify.py:180-216`; `PROOF.md:105-123`). Completeness is essential here, unlike `small`. |

`UpperBridge.reciprocal_iff_product`, `complement_cover`, `deletion_bound`, and `finite_card_bound` link positive ordered arithmetic triples to the existing `Erdos302Lower.NoUnitFractionTriple` definition (`upper-bank/UpperBridge.lean:6-54`). Existing `.olean` files for `UpperBridge`, `UpperBank`, and `Extended` are present; their exact clean-build and transitive axiom status should be rechecked, and the definition must be bridged to whichever final extremal-function interface is used. `Extended.lean:96-270` also contains proofs of a small selection of concrete early bank-node propositions; they are not a replay of all 4,106 nodes.

External dependency: pinned Kitamura commit `9447ceb28138949b2fb32442cec506a6f53104f9`. Its `Erdos302ReflectiveChainTopFC.lean` has `chain_0`…`chain_19` giving finite table agreement through 500000 and all-n cover lower bounds, plus correction identities; `Erdos302ReflectiveChainFC.lean` has `level_cover`. Local order j=1…20 corresponds to upstream index 20−j (`global-route.md:31-45`). A previous independent data comparison reports all 749 interval pairs and 10,000,020 table entries agree, but it is not a kernel equality. The last recorded upstream rebuild probe failed on missing Mathlib oleans, with no project oleans and insufficient safely reserved disk (`kitamura-rebuild/RESUME.md:3-31`); do not count upstream source text or cache artifacts as an independently checked rebuild.

## Mathematical chain from finite witnesses to C

1. `B/PROOF.md:9-14`: for H(S) with edges a<b<c and bc=a(b+c), τ(S) is minimum vertex-cover cardinality and f(N)=N−τ([1,N]). `UpperBridge` partially implements the relevant complement-cover implication.
2. `PROOF.md:93-123`: projection of a proved `(S,r)` to Q-smooth T uses that a reciprocal edge has either zero or at least two vertices divisible by any given p, and has at most one odd vertex. Thus every edge outside T has an even vertex outside T, yielding τ(T)≥r−#even(S\\T). Explicit extension witnesses can reduce that cost. Prove modular arithmetic, smoothness, and prefix deletion in Lean.
3. With X=500000, prime order `(3,2,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71)`, U₀=0 and Uⱼ(0)=0, compute in increasing j and n:

   `Uⱼ(n)=max(Lⱼ(n), sⱼ(n), Uⱼ(n−1), Uⱼ₋₁(n)+Uⱼ(⌊n/pⱼ⌋))`.

   Here sⱼ is the strongest verified seed and Lⱼ the pinned old profile. The smooth blocks `Sⱼ₋₁(n)` and `pⱼ Sⱼ(⌊n/pⱼ⌋)` are vertex-disjoint; cross edges may exist and are simply ignored in a lower bound. Prove each operand and induction (`PROOF.md:125-140`, `verify.py:218-243`).
4. Set `dⱼ(n)=Uⱼ(n)−Uⱼ₋₁(n)−Uⱼ(⌊n/pⱼ⌋)` for n≤X, and zero beyond X; continue the recurrence beyond X with zero correction. Prove nonnegativity and strong-inductive soundness. Recompute d from the *new* U tables, never blindly add old gains to improved parents (`PROOF.md:142-156`). The JSON reports 4,705 correction cells with aggregate cell-height sum 120,233 across 20 levels; these totals were independently summed from its listed level metadata, not checked against computation or Lean.
5. Unique smooth/rough factorization partitions [1,N] into `q*S₂₀(⌊N/q⌋)` with q coprime to P₂₀. The complement of a triple-free set covers every block. Reindex powers of pⱼ to obtain the exact renewal sum `Σⱼ Σ_{q≤N, gcd(q,Pⱼ₋₁)=1} dⱼ(⌊N/q⌋)` (`PROOF.md:158-172`). Adapt pinned upstream prime-block/renewal lemmas only after checking their precise hypotheses and definitions.
6. A height-h half-open cell [a,b) contributes rough q with N/b<q≤N/a. With `ρⱼ₋₁=∏_{p∈Pⱼ₋₁}(1−1/p)`, inclusion–exclusion bounds the absolute error of this interval count by 2^j. Thus `G=Σⱼρⱼ₋₁ Σcells h(1/a−1/b)`, `E=Σⱼ2^j Σcells h`, and `f(N)≤(1−G)N+E`. The archive asserts exact `1−G=C` and E=55064831540 (`PROOF.md:173-194`, `verify.py:240-250`). Prove both cell-table identity and rational ledger, with endpoints including b=500001; a report's 4,705 cells or hashes are not those proofs.
7. Divide by positive N and pass to limsup; no density limit is assumed. `upper-milestone/ExactComparison.lean:4-13` proves the closed cross-multiplication comparison of the *stated rational integers* to the decimal headline; `upper-focus-inventory.md:42-44` records a successful Lean 4.27 run with no axioms. It does not identify C with the computed ledger or prove any extremal inequality.

## Smallest defensible end-to-end backlog

1. Secure a sufficiently provisioned isolated pinned Lean environment; rebuild the precise upstream chain closure and inspect actual elaborated `chain_i`, `correction_i`, `level_cover` and transitive axioms. Reify or prove pointwise equality of old profiles and derive the four active-prefix demands via `trim_bound`. Avoid the much larger upstream final theorem if only chain imports are needed, but measure the real dependency closure first.
2. Complete generic scaling, arithmetic-edge completeness, weighted packing, residual case and projection soundness; check compilation/axioms of `Weighted` first. Reify the *existing pruned bank* and verify all needed ancestors in bounded kernel-reduced chunks; use all needed source-node results, not the empty `roots` map. Kernel-check extension witnesses and only those seed inequalities required to reproduce the reported endpoint, provided omitted candidates are proved unnecessary by the checked recurrence.
3. Prove the recurrence, correction/tail and smooth–rough counting once, reusing matching upstream statements where possible. Check the 20 finite tables or a smaller proof-producing cell certificate with explicit pointwise identities. Prove exact rational G and E and connect to the real extremal definition. Finally derive unconditional finite and limsup theorems and check their actual types, `#print axioms`, no `sorryAx`, and clean-build logs.

No uploaded verifier or other uploaded code was executed for this map. Existing reports and `.olean` files are evidence of their recorded scope, not proof of the unbuilt end-to-end theorem; `VERIFIED_REPORT.json`, hashes, search success, and Python output never stand in for kernel soundness.
