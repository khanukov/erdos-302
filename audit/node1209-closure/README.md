# Node 1209 induced closure — phase 1 candidate

This is **not a Lean replay of the DAG or a 258 bound**. `closure.json` retains every raw ancestor node, including all case trees and all 510 original pack rows, plus every image occurrence with original and dense source indices. The source is the SHA-256-pinned compressed bank; extraction independently checks strict backward references, dense mapping, exact occurrence order, and Python replay without external leaves. Normalization and archive-byte correspondence remain Python evidence, not Lean theorems. Run `python3 -B independent_bank/node1209_closure.py --check` and its unittest (also under `-O`).

`Small00.lean` through `Small22.lean` contain 368 standalone executable `ArchiveDag.SmallCheck` propositions on normalized support and demand, up to 16 per module. The standalone declarations have no assumed-prefix or external-leaf hypotheses. The separate dense candidate below attempts to link them to actual DAG checks. The manual workflow `node1209-small-phase1.yml` builds each module with a 15-minute limit and gates the printed theorem axioms. Mathlib cache objects are trusted.

## Dense linkage candidate

`Dense.lean` is generated from the pinned extraction by `independent_bank/node1209_dense.py`. It encodes all 376 nodes as `MixedDag.Node` values, with each of the 1,056 reference occurrences retained in order, including all 510 root packing rows and the signed projected case-dual rows. Python rejects non-backward and missing references. The 368 `checkN` declarations are intended to transport the independent small-shard theorems directly to `MixedDag.Check extraCheck nodes N`, without a checker hypothesis. They and the entire dense module are **uncompiled candidates** until the new manual `node1209-dense-candidate.yml` workflow succeeds and its axiom gate passes. No hosted run of this candidate is claimed.

The conversion from authenticated archive bytes, interpretation, support normalization, remapping, case-dual expansion and generated Lean bytes is **trusted Python**, not a Lean theorem about archive provenance. Byte regeneration and mutation tests are corroboration, not kernel proof. The default outside `[0,376)` is an empty small node; all intended references are checked backward by Python but no Lean theorem yet proves closure of references. Neither this candidate nor standalone small checks establishes any of the eight non-small `MixedDag.Check` obligations, a complete prefix, or a bound.

## Missing links

1. Compile and axiom-gate the generated dense data and the small-check transports; kernel-prove reference closure and verify the conversion beyond trusted Python if archive provenance is required.
2. Compile/check all 4 case and 3 trim rules and 1 pack rule. The root needs separately bounded row-integrality, 901 vertex capacities, objective and support-union certificates, then kernel-checked assembly into `MixedDag.Check`. Merely deciding the 510-row proposition monolithically is not a bounded certificate.
3. Assemble the 376 actual checks into a dense prefix using `MixedCaseTrimCandidate.sound`, prove the resulting node is the desired extension source and its demand is 258, and gate axioms. Existing prefix 256/1024 results cannot stand in for this identity or the intervening nodes.
4. Obtain a successful hosted run on the exact commit and separately complete the extension and global bound obligations. Nothing here establishes an unconditional 258 or 242 bound.

## Conditional assembly audit

`AssemblyCandidate.lean` has exactly eight checker premises: dense indices 4, 7, 14, 374 are case rules; 5, 8, 15 are trim rules; 375 is the root pack. Its 376 branches occur in index order, with the remaining 368 using the generated small checks. `MixedDag.Valid` is definitionally the bounded checker premise consumed by `MixedCaseTrimCandidate.sound`. The dense root and `Node1209SourceCandidate.node` have literally identical support and demand 258, but their pack references differ because the dense DAG is reindexed: the `change` in `source_bound` relies only on the support and demand projections, not equality of the full nodes. This is a source inspection and Python literal comparison, not a Lean compilation.

The manual assembly workflow now also compiles `AssemblyExactTypeCandidate.lean`, which spells out all eight premises and three conclusions without abbreviating the checker types. It still must succeed on the exact candidate SHA, including the axiom gate. In particular, the eight checker premises, archive-to-Lean provenance, and unconditional source/target bounds remain open; a successful conditional assembly run alone does not discharge them. Cached Mathlib objects remain part of the CI trust boundary.
