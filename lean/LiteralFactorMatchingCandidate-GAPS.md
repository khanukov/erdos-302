# Literal factor-matching candidate: status and gaps

This is an **uncompiled candidate**, originally based on d286f6a and carried forward onto 34c014a. The prior hosted run
41415550542 reported an overall failure; its successful factor-count declaration
is not a successful build of this new combined development. The new workflow is
prepared but has not been pushed or run, per the isolated-worktree/no-remote
constraint. It fetches pinned Mathlib caches; those cached objects are reused.

`LiteralFactorMatchingCandidate` proposes a `Fin 4705` occurrence index,
`P = cellPrimes`, `Q = ArchiveLedger.primes.toFinset`, `S = Q \ P`, common
support `Icc 1 N` filtered by `Rough Q`, the exact natural-valued suffix
multiplicity, and a derived count equality from the factor-count theorem. Literal
prime, subset, disjointness, union and endpoint positivity checks are spelled out.
The final conditional cover has the exact multiplicity theorem's natural
height/count inputs and real output; its joint allocation and local graph-demand
hypotheses are **not** proved.

Open items:

* Run the proposed workflow at its exact committed SHA and repair any elaboration,
  reduction, dependency, resource, test or axiom-gate failures. Neither the
  source nor axiom allowlist has been Lean-verified here.
* Prove the joint pointwise multiplicity allocation from actual verified profile
  recurrence and seed/graph certificates, and the associated per-block `Demand`;
  independent per-cell inequalities are insufficient for overlapping cells.
* Reindex the Fin 4705 weighted cover to `ArchiveLedgerSumBridge.Index` and
  explicitly connect it to the existing endpoint theorem; the present cover
  uses `idx` but does not yet prove the weighted sums equal.
* Prove literal-ledger-to-archive provenance and profile/certificate origin; the
  Python finite test checks a generated JSON ledger, not Lean/archive-byte
  correspondence. It checks the factor identity at N=60, not all N.
* Finish the remaining archive analytical and global endpoint obligations; no
  unconditional Erdos-302 bound is claimed here.

The dispatch-only job copies the pinned project and sources to runner temporary
storage and adds a pilot library there, owning the candidate and its two excluded
factor/suffix dependencies. The committed `lakefile.toml`, UpperIntegration roots
and their exact-closure structural checks remain unchanged. The isolated target
recursively builds its complete local dependency closure using pinned Mathlib
revision and Lean toolchain; Mathlib cached objects are reused, not rebuilt.
The finite Python test covers all 4705 occurrences at N=60 only.

No hidden matching assumption is made: `literal_hcover` invokes the proposed
`matching` theorem, while `hd` and `allocation` remain explicit hypotheses.
A passing dispatch would check the candidate and listed axiom gates, not discharge
these hypotheses or prove the final endpoint. The workflow must be present on the
repository default branch to enable GitHub manual dispatch; dispatch the intended
ref and check its exact SHA and logs. No hosted run has been performed here.
