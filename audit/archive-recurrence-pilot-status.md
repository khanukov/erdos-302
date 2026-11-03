# Bounded recurrence pilot candidate

At base 0f2567a, this candidate states a closed, hypothesis-free equation on
`Finset.Icc 1 80` at zero-based level 1 (prime 2). Its correction uses the
actual `ArchiveLedger.ledger` level and all its cell occurrences, not a
handwritten cell list; the parent and current lists have 81 entries, including
zero and every possible quotient. The list values are generated from the
pinned report's cells; they are not assumed in Lean as propositions, and the
candidate theorem does not assume the recurrence. The candidate has **not
been compiled or kernel-checked**; the workflow is prepared for a separately
authorized hosted run. Python tests are not a Lean proof.

The generator hashes and reads the same archive and member bytes via
`reconstruct_report_profiles.read_archive`, rejecting duplicate JSON keys and
members. `--check` compares the entire generated Lean file. The independent
Python check uses a difference array rather than the generator's per-cell sum;
it checks the prefix and tests profile, endpoint, height, prime, length and
zero mutations. It does not independently verify graph demands, seed/max
provenance, or the archive-to-Lean correspondence inside the kernel.

The candidate uses a level-local sum, **not yet** the 4705-position
`ArchiveCorrectionBridgeCandidate.correction`; their equivalence remains
unproved. The parent zero profile is checked computationally from the first
level only by Python, not identified with a kernel-checked table of all 500001
reported entries. It checks only 80 arguments in one level, not the full
20-level recurrence, all-argument extension, global allocation, or endpoint.
The report hashes corroborate cell-driven reconstruction, not an independent
bank derivation. No data-as-axiom proposition is introduced; nonetheless no
claim of an actually verified closed theorem is warranted until the exact
candidate compiles and its axiom gate succeeds in hosted CI.
