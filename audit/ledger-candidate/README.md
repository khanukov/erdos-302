# Candidate literal ledger checker (not Lean-verified)

This standalone draft computes exact rationals from the 4,705 literal reported half-open intervals, checks ordering/bounds, exact prime order, cell count, C and E. `archive_arithmetic` is intended to follow from the Boolean checker and its literal data using kernel `decide`, not `native_decide`. **No Lean compilation or kernel verification has been performed.** Elaboration, performance, memory needs and feasibility are unknown. No claim is made that these cells follow from the bank, profiles, recurrence, or cover argument; this is not a proof of the archive theorem.

Trust boundary: `ledger.json` is extracted from the pinned report by Python, then `generate_lean.py` writes literals. Lean would check arithmetic about those literals only, not the ZIP, JSON parsing, or transcription. Python tests independently compare each generated triple and prime against the report, and recompute C/E using `Fraction` with a different expression for each cell; those tests are corroboration, not a kernel proof of correspondence. The archive SHA-256 identifies bytes, not authorship. Export rejects duplicate JSON keys; the translation scripts and Python remain trusted for correspondence. The pinned source SHA and detailed unproved dependency chain are in `audit/ledger-source-map.md`.

## Reproduction (from repository root)

```sh
python3 -B -m unittest discover -s audit/ledger-candidate/tests -v
python3 -B -O -m unittest discover -s audit/ledger-candidate/tests -v
```

These tests regenerate both files into a temporary directory and compare their exact bytes to the committed files. The JSON is taken from `input/erdos302_boundary_certificates_publication.zip` and hash-pinned; the exporter reads the same bytes it hashed. The archive is not an attestation of authorship. See `audit/ledger-source-map.md` for the distinct, unproved source obligations.

## Full-build diagnosis and candidate mitigation

Hosted run 41385790170 at 78c17b1 successfully elaborated the literal definitions but failed at `archive_check`: the default `decide` elaborator reduction could not reduce `instDecidableEqBool (check ledger) true` to either constructor. Its complete diagnostic ends at `match check ledger, true with ...`; it does not expose which subexpression inside `check` blocks reduction and does not report the proposition false. The `sorryAx` axiom reports are consequences of the failed declaration, not successful proofs. Independent Python checks agree with the advertised exact arithmetic, but are not a Lean proof.

A plausible reduction obstruction is that Lean 4.33.0-rc1 marks `Rat.add`, `Rat.mul`, `Rat.inv`, and `Rat.sub` irreducible, while ordinary `decide` first uses elaborator reduction at default transparency. The diagnostic alone does not prove that this is the blocking subexpression. This candidate instead splits `Valid` into its original conjuncts, proposes one separate kernel-checkable rational mass claim per level, and uses `decide +kernel`, which invokes kernel checking rather than requiring the elaborator's preliminary reduction. The generated fractions are proposed witnesses only: each Lean equality must be checked, and a Python test checks the same fractions independently using `h*(b-a)/(a*b)`.

Neither the candidate proof nor its resource usage has been checked in Lean. In particular, the largest mass claim still handles a whole level, not 128-cell chunks, and the ordered check is monolithic; simplifier matching and the composition step also need hosted verification. This is a sound proof strategy only if the unchanged theorem types compile without `sorryAx` under the configured axiom audit. It is not evidence that the checker is fixed or that the archive theorem holds.

## Bounded hosted pilot

Dispatch `.github/workflows/archive-ledger-pilot.yml` on the exact candidate ref on a GitHub-hosted runner. The default `full_candidate=false` runs only the small `LedgerTests`; to attempt the full declaration and axiom audit, explicitly dispatch with `full_candidate=true` (for example, `gh workflow run archive-ledger-pilot.yml --ref <candidate-ref> -f full_candidate=true`). This is an invocation for a future run, not evidence of one; do not dispatch without authorization.

The job sets `LEAN_NUM_THREADS=1` for Lake and its Lean children. The small and full builds have 5-minute and 15-minute timeouts respectively; the full axiom audit has a 2-minute timeout and the whole job has a 30-minute limit. `ulimit -v 24000000` applies a per-process virtual address space limit in the small and full build steps (and the full audit), inherited by their children. It is **not an aggregate job memory limit**, not a resident-memory limit, and does not apply to the earlier cache/setup steps. The earlier 6000000 limit coincided with a failed thread creation in run 41384786458; causation was not established. No cgroup job-wide limit is configured; concurrent processes and setup can consume additional memory. Timeouts and resource exhaustion may prevent completion. The full attempt retains available logs and exit status. A timeout or failed build is not proof.

Mathlib's dependency cache comes from the pinned mathlib revision and its cache service; it is trusted dependency input, not a cache-free replay. No project build artifact is restored. The pilot does not gate the existing integration workflow. Only a successful run on the exact candidate, including exact-type examples and axiom allowlist, can establish the literal arithmetic claim; even then Python byte comparison is separate evidence and does not establish archive input correspondence in Lean, bank-to-profile correctness, recurrence-to-cell identity, or counting/cover arguments. `maxHeartbeats 0` remains subject to the workflow's timeouts. No local or hosted Lean verification is claimed here.
