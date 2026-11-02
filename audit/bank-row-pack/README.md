# Occurrence-indexed pack rule: candidate, not kernel-verified

Based on dc8a02bdffb04fd52cfaffa9e27b8b0913254a86. Modules in `lean/` are explicitly excluded from both existing integration inventories: this is a separately dispatched diagnostic candidate, not a change to the checked selected slice. No remote dispatch or local Lean build.

## Inventory

* `BankRowPack.lean`: executable proposition `Check` indexed by `Fin n`, checked prior-reference, positive scale, exact divisibility, and `ArchivePack.Valid`; candidate `sound` derives each prior bound via existing `ArchiveDag.sound`, and uses `ArchivePack.scaled_bound` and `ArchivePack.sound`. Prior DAG checks remain explicit hypotheses. Distinct row positions are retained even with the same source.
* `BankRowPackTests.lean`: candidate positive certificate with disjoint scaled copies of a real edge giving bound 2; duplicate-reference capacity, strict rounding, missing support, forward reference, inexact scaling, zero multiplier and empty-certificate negatives.
* `test_candidate.py`: independent exhaustive graph/cover sanity and duplicate-occurrence arithmetic. Python checks are not Lean proofs.
* `.github/workflows/bank-row-pack-candidate.yml`: manual hosted diagnostic; pins Lean binary checksum, upstream source and mathlib revisions; compiles the complete direct DAG dependency sequence and candidate, tests examples, gates reported axioms. Cache retrieval is attempted and may reuse precompiled mathlib objects.

Direct sequence: `Erdos302Lower.Defs`, `UpperBridge`, `UpperBank`, `Extended`, `Weighted`, `Scaling`, `PackRule`, `Dag`, `BankRowPack`, `BankRowPackTests`. Workflow transitive imports depend on pinned Mathlib. No source-closure inventory or automatic integration gate is asserted for this diagnostic.

## Gaps

The candidate and tests have **not** compiled and could contain Lean errors. No workflow run, axiom output, or performance measurement exists. The rule is a semantic composition on top of the existing ordered checker, not a new constructor in its induction: packed outputs cannot yet themselves occur as earlier DAG nodes without extending the recursive checker or building a proved mixed-node induction. No literal archive node is translated; byte-to-term correspondence, exact support/normalization, sparse capacity efficiency, qpack, case, trim, external leaves, full 4106-node replay, profile construction and endpoint remain open. The test certificate is synthetic. The naive capacity predicate scans all occurrences per vertex and is not a viable claimed full-bank resource result.
