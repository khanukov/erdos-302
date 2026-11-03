# Bounded recurrence pilot candidate

The hosted pilot at `655a7ad` failed during elaboration: Lean could not
synthesize decidability for the bounded recurrence proposition. The candidate
now declares a computational `Decidable (equation n)` instance before the
unchanged, closed recurrence theorem. This addresses the missing pointwise
instance; it does **not** establish that the full finite proof executes within
CI's resource limits or even that the exact Mathlib bounded quantifier now
elaborates. Those remain to be checked in a hosted build and axiom gate.

A scoped local Lean 4.33.0-rc1 probe used the generated definitions and all 52
report cells in a stand-in ledger, replacing the Finset theorem with a Boolean
check of 80 inputs. It compiled with `decide +kernel`; `#print axioms` reported
`propext` for both that check and `input_shape`. This checks computation in the
stand-in, not the actual imported ledger or the stated Finset theorem.

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
