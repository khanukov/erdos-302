# Occurrence-indexed pack rule: candidate, not kernel-verified

Based on dc8a02bdffb04fd52cfaffa9e27b8b0913254a86. Modules in `lean/` are explicitly excluded from both existing integration inventories: this is a separately dispatched diagnostic candidate, not a change to the checked selected slice. No remote dispatch or local Lean build.

## Inventory

* `BankRowPack.lean`: executable proposition `Check` indexed by `Fin n`, checked prior-reference, positive scale, exact divisibility, and `ArchivePack.Valid`; candidate `sound` derives each prior bound via existing `ArchiveDag.sound`, and uses `ArchivePack.scaled_bound` and `ArchivePack.sound`. Prior DAG checks remain explicit hypotheses. Distinct row positions are retained even with the same source.
* `BankRowPackTests.lean`: candidate positive certificate with disjoint scaled copies of a real edge giving bound 2; duplicate-reference capacity, strict rounding, missing support, forward reference, inexact scaling, zero multiplier and empty-certificate negatives.
* `test_candidate.py`: independent exhaustive graph/cover sanity and duplicate-occurrence arithmetic. Python checks are not Lean proofs.
* `archive1090.py`, `test_archive1090.py`, and `BankRowPackArchive1090.lean`: a staged translation of literal qpack node 1090's seven rows and four referenced edge sources. See [ARCHIVE1090.md](ARCHIVE1090.md) for the exact byte digest, translation and limitations.
* `.github/workflows/bank-row-pack-candidate.yml`: manual hosted diagnostic; pins Lean binary checksum, upstream source and mathlib revisions; is configured to compile the direct DAG dependency sequence and candidates, test examples, and gate reported axioms. Cache retrieval is attempted and may reuse precompiled mathlib objects.

Direct sequence: `Erdos302Lower.Defs`, `UpperBridge`, `UpperBank`, `Extended`, `Weighted`, `Scaling`, `PackRule`, `Dag`, `BankRowPack`, `BankRowPackTests`, `BankRowPackArchive1090`. Workflow transitive imports depend on pinned Mathlib. No source-closure inventory or automatic integration gate is asserted for this diagnostic.

## Gaps

The candidate and tests have **not** been compiled and could contain Lean errors. No workflow run, axiom output, or performance measurement is claimed. The node 1090 `prior`, `checked`, and `bound` declarations are staged claims, not kernel-checked results: the diagnostic workflow must succeed and its axiom gates pass at the exact commit before claiming that check.

Node 1090's literal rows and referenced edge data are translated, but its preceding archive DAG is **not replayed**. The Lean environment places those four archived edges at their source indices and uses a checked dummy edge at every other index. The resulting capacity 1, objective 7 and demand 7 describe this translated node in that synthetic environment, not verification of the complete archive node in its original DAG or of the full bank. The Python generator verifies a pinned digest and performs the translation; neither the digest nor Python tests establish byte-to-term correspondence in Lean, independent provenance, or mathematical correctness of the archive.

The rule is a semantic composition on top of the existing ordered checker, not a new constructor in its induction: packed outputs cannot yet themselves occur as earlier DAG nodes without extending the recursive checker or building a proved mixed-node induction. General byte-to-term correspondence, qpack beyond this staged example, case, trim, external leaves, full 4106-node replay, profile construction and endpoint remain open. The separate test certificate is synthetic. The naive capacity predicate scans all occurrences per vertex and is not a viable claimed full-bank resource result.
