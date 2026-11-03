# Closed N=6 candidate — not compiled

`lean/JointSixCandidate.lean` states the sum over the **actual** `Fin 4705`
occurrence indices, original `height` and `mult`, and an independent-set bound
on the actual `SmoothRenewal.vertices Q 6` and `SmoothRenewal.Edge`. The
weight and edge are not assumptions. The last theorem combines them at q=1.
Python `audit/joint_concrete_check.py` independently computes weight 1 and
edge {2,3,6}, but is not a Lean proof.

## Exact hosted workflow

`.github/workflows/joint-six-candidate.yml` is a `workflow_dispatch` workflow.
After this commit is made available on an appropriately configured GitHub
repository and workflow dispatch is enabled, select that exact ref and run the
workflow. It pins the Lean tarball checksum and Mathlib revision, downloads the
cache, runs the Python/inventory checks, builds `+JointSixCandidate`, compiles
the existing joint regression file and the new candidate, gates its printed
axioms, and uploads logs even after failure. No remote write or dispatch was
performed. This workflow cannot run on an unpushed commit.

## Explicit gaps / risk

* **No Lean build has been run for this candidate.** In particular, the
  `literal_weight` `norm_num` script is a speculative first attempt: the
  4705-index sum, nested ledger chunks and noncomputable/classical smoothness
  are likely to defeat direct reduction or exhaust resources. CI may fail;
  no kernel theorem or successful CI is claimed. If it fails, split the sum
  into bounded index shards, prove zero outside the unique contributing index,
  and prove the smoothness of t=1 separately; all shard conclusions must be
  about the original `height` and `mult`, not a Python-generated assertion.
* The q=1 theorem does not yet establish `support 6 = {1}` in Lean, nor apply
  `literal_hcover_of_joint_independence` to all q in support. The Python
  computation checks support but supplies no Lean bridge.
* `edge_in_vertices` and the cardinality proof are also uncompiled and may
  require tactic/API repairs. The independent bound uses a concrete edge and
  proper-subset cardinality, not an enumerated graph maximum; it does not claim
  alpha=5 in Lean.
* The ledger is a Lean literal generated from another artifact; no provenance
  from archive bytes is established. Nothing here proves larger N or an
  asymptotic endpoint.

Local checks: `python3 -B audit/test_joint_six_candidate.py`, the same with
`-O`, `python3 -B audit/joint_concrete_check.py`, and the three source inventory
checks. The static test checks shape only, not Lean elaboration or soundness.
