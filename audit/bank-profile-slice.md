# Bank-to-profile slice (candidate, not yet kernel checked)

`BankProfile.checked_node_seed` is a proposed Lean bridge from any node
accepted by `ArchiveDag.Check` (all preceding checks are explicit hypotheses)
to an `Extended.Bound` on its Q-smooth support through threshold n. It subtracts
the number of even non-smooth support vertices and the number of smooth
vertices above n. `restrict_bound` supplies the second loss; the existing
`smooth_projection` supplies the first. The generic theorem is accompanied by
a node-0 restriction test and a negative test showing that dropping a vertex
cannot in general retain the full demand. `UpperIntegration` and its hosted
workflow now include these modules and an allowlisted axiom gate. The intended
hosted run must build this exact commit; no run was dispatched because remote
writes are prohibited. No local Lean build was performed, so elaboration, tests,
and axiom output are unverified until CI succeeds.

This is not a proof of a numerical profile or of the final bound. In particular:

* `valid` remains a hypothesis for every node before `count`; the existing DAG
  checker does not cover every archived node variant. Archive parsing,
  normalized supports/demands, rational images and byte correspondence are not
  proved. A kernel check of this theorem alone does not discharge `valid`.
* The archive's prime-rank predicate must be proved equivalent to Q-smoothness
  for the actual levels, including exceptional values, and its ordered seed
  loop must be related pointwise to this prefix bound. The equality of the
  above-prefix set with the archive's counting expression and the maximum over
  all 4,106 nodes and 515 extension witnesses remain to be proved. The archive
  only emits seeds at allowed vertices; this theorem gives a sound lower bound
  at any prefix but does not assert equality with the emitted seed array.
* Extension rows, external upstream active-support assumptions, the conversion
  to `RenewalNext.Demand`, old profiles, renewal and tail, correction cells,
  summation, endpoint arithmetic, and the final extremal/limsup theorem remain
  open as described in `STATUS.md` and `audit/ledger-source-map.md`.
* CI uses pinned Lean and Mathlib source, but reuses Mathlib cache objects.
  A successful build would cover the selected integration target and axiom
  allowlist only, not a fresh replay of cached dependencies or full archive.

## Concrete test candidate

`BankProfileTests` instantiates the full `checked_node_seed` theorem with
node 0 from the pinned source bank, including a proof candidate for every required
`Check`. `independent_bank/archive_seed.py` checks the compressed bank SHA-256,
rejects duplicate JSON keys, and reproduces `lean/ArchiveSeedNode0.lean` from
that node's exact `small` support and demand. This is a Python source-byte
correspondence check, not a Lean proof of parsing or a verification of the full
bank. The resulting no-hypothesis Lean theorem candidate is
`BankProfileConcrete.full_prefix : Extended.Bound ({2, 3, 6} : Finset ℕ) 1`.
For Q = {2,3}, it claims the nonzero bound 1 at threshold 6, and checks thresholds
5 and 0. For Q = {3}, it checks the even non-smooth projection loss and
natural-subtraction saturation. The test theorem axiom report is
included in the integration gate. This candidate has not been Lean-checked:
remote writes and local Lean execution are prohibited. The generic and global
open obligations listed above remain open.
