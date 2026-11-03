# Node 1209 induced closure — phase 1 candidate

This is **not a Lean replay of the DAG or a 258 bound**. `closure.json` retains every raw ancestor node, including all case trees and all 510 original pack rows, plus every image occurrence with original and dense source indices. The source is the SHA-256-pinned compressed bank; extraction independently checks strict backward references, dense mapping, exact occurrence order, and Python replay without external leaves. Normalization and archive-byte correspondence remain Python evidence, not Lean theorems. Run `python3 -B independent_bank/node1209_closure.py --check` and its unittest (also under `-O`).

`Small00.lean` through `Small22.lean` contain 368 standalone executable `ArchiveDag.SmallCheck` propositions on normalized support and demand, up to 16 per module. These are not yet linked to any Lean DAG data; there are no assumed-prefix or external-leaf hypotheses in these standalone declarations. The manual workflow `node1209-small-phase1.yml` is a **candidate**, not a CI result: it builds each module with a 15-minute limit and gates the printed theorem axioms. Mathlib cache objects are trusted. No hosted run has been performed for this candidate.

## Missing links

1. Generate actual dense `MixedDag.Node` data for all 376 ancestors, including faithfully normalized case trees, trim images, and the root's 510 weighted rows. Reindex every reference occurrence using `dense_source`; prove the Lean node data correspond to the small literals. The JSON is an extraction artifact, not Lean source or a Lean provenance proof.
2. Compile/check all 4 case and 3 trim rules and 1 pack rule. The root needs separately bounded row-integrality, 901 vertex capacities, objective and support-union certificates, then kernel-checked assembly into `MixedDag.Check`. Merely deciding the 510-row proposition monolithically is not a bounded certificate.
3. Assemble the 376 actual checks into a dense prefix using `MixedCaseTrimCandidate.sound`, prove the resulting node is the desired extension source and its demand is 258, and gate axioms. Existing prefix 256/1024 results cannot stand in for this identity or the intervening nodes.
4. Obtain a successful hosted run on the exact commit and separately complete the extension and global bound obligations. Nothing here establishes an unconditional 258 or 242 bound.
