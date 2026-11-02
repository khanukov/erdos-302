# Persistent upper integration (candidate)

The root Lake project pins Lean 4.33.0-rc1 and mathlib `da1f94df976c7cd38117281c57d6ee3046c8d104`; it does not require the unrelated #301 or #327 projects. `lean/Erdos302Lower/Defs.lean` reproduces the **literal predicate declaration** from `lower-lean/Erdos302Lower/Defs.lean` at public commit `a60f43511ce0741ef6e80bdb9b620c5bf854f81c`, source SHA-256 `bf79ae9596f6872d3275ee91f8b2dc52b49eb5bdd60b2c8b41782f87dc137f9d`; only the unrelated import and lower-bound conclusion are omitted. This avoids asserting an equivalence of differently defined predicates.

`UpperIntegration` imports the transitive closure of the listed roots in `lean/UpperIntegration.lean`: bridge/finite certificates, projection, case-tree and DAG/packing infrastructure, smooth block accounting and renewal, rough counting/rounding/summation, and prime-power decomposition and reindexing. The `UpperIntegration` library owns the closure in `lean/`, including `ArchiveLedgerSumBridge`; `ArchiveLedgerPilot` owns `LedgerChecker`, `ArchiveLedger`, and `LedgerTests` in `audit/ledger-candidate/lean/`. The integrated root imports the bridge and ledger tests, and Lake resolves the ledger dependency through its owning library. Both libraries list exactly their closure modules as roots. Structural tests check the two source directories, duplicate ownership, namespace-prefix expansion, and exact closure. Every source in those directories outside the closure is explicitly listed in `audit/upper-integration-excluded.txt`; adding one requires an explicit integration or exclusion decision. Included tests are importable modules; examples in imported source are also elaborated. Generated bank artifacts, external reflective chain, LowerNext, and unimported standalone tests are not included. This is a selected connected integration, **not a claim that every potentially usable existing file is included or that all components have previously passed together**.

Nineteen representative theorem axiom reports are checked against the existing standard-axiom allowlist; this is not a whole-project axiom audit. Mathlib cache downloads are used and are part of the build trust boundary. The build checks its inputs at the pinned revisions, but does not independently replay every cached mathlib proof. Neither successful import nor the conditional arithmetic/cover implications prove the target upper bound, validate the complete bank, match upstream profiles, or establish the all-N and limsup bridge. The archive's target remains unproved here.

`Pack1094Tests` is also excluded: its previous monolithic check terminated with exit 143. The separate shard verification and its `.olean` reuse are described in [STATUS.md](STATUS.md); the integrated target does not import that result.

## Ledger bridge assumptions and limitations

`ArchiveLedgerSumBridge.conditional_literal_endpoint` assumes nonnegative weights `hh`, positive endpoints `ha` and `hb`, quotient order `hLU`, primality `hprime`, density bounds `hrho`, exponent budget `hbudget`, exact gain and error sum matches `hgain` and `herror`, and the independent block-count cover `hcover`. The indexed theorem derives nonnegative weights from natural heights, but still assumes every other condition above. In particular, the gain equality includes list-to-finset indexing, prefix products, casts, repeated occurrences and fold algebra; the error equality is also not proved by literal arithmetic. The cover depends on sound profiles, corrections, extensions, recurrence and cell correspondence. These assumptions are hypotheses, not axioms established by the axiom checker. Python generation checks are not a Lean proof of archive-byte provenance. Neither conditional endpoint proves the desired unconditional bound.

The prior bridge pilot run 41391420681 checked an earlier exact commit, not this integrated candidate. The new integrated build and its resource behavior remain pending CI. The standalone `PilotAudit` is excluded because its three reports are printed directly in the integration root; all other excluded source modules are enumerated in the exclusion file, including the previously resource-heavy `Pack1094Tests` and standalone tests not imported by the root.

## CI

The `Upper integration` workflow runs on pull requests, pushes to `main`, and manual dispatch. Its core commands, **in GitHub CI only**, are:

```
python3 tests/test_upper_project.py
python3 -O tests/test_upper_project.py
python3 audit/mathlib-bridge-ci/test_check_axioms.py
lake exe cache get
lake build UpperIntegration
lake env lean lean/UpperIntegration.lean
python3 audit/mathlib-bridge-ci/check_axioms.py "$RUNNER_TEMP/upper-axioms.log" UpperBridge.finite_card_bound ArchiveSumBridge.boundaryOK_of_pos ArchiveSumBridge.global_upper_archive SmoothPartition.global_from_prefix_demands PrimePowerReindex.bounded_decomposition PrimePowerSum.sum_reindex PrimePowerRenewal.sum_unroll PrimePowerRenewal.sum_update BankProfile.checked_node_seed BankProfileConcrete.full_prefix PrefixArchiveBridge.cells_le_prefix PrefixArchiveBridge.upper_from_prefix ArchiveLedger.archive_check ArchiveLedger.archive_valid ArchiveLedger.archive_arithmetic ArchiveLedgerSumBridge.ledger_gain_complement ArchiveLedgerSumBridge.ledger_error_real ArchiveLedgerSumBridge.conditional_literal_endpoint ArchiveLedgerSumBridge.conditional_indexed_endpoint
```

The workflow captures the penultimate command with `tee` into the named log and uses `pipefail`. CI requires network access to fetch pinned dependencies and cache. The initial integration build passed for commit `665c9ab576a10e33495ac7ef3e15a7014da71cca` in run `41374590165`; see [STATUS.md](STATUS.md) for the dated evidence and limitations. A result for that commit does not establish a result for later changes.
