# Conditional, data-only bank check

The workflow reads only JSON and compressed JSON members from the pinned publication ZIP; it does not run or import code from the archive. The verifier and tests use the Python standard library. SHA-256 is checked before any archive parsing. It checks the bank's envelope, 4,106 nodes and exact type counts, 25,744 image shapes, interval structure, and processes every node with rule-specific field and arithmetic checks. Images are additionally checked when used. Python exceptions, not assertions, enforce verification checks under `python -O`. Tests include in-memory mutations of real bank data.

The four external claims are **assumptions**, not verified theorems: `(node, n, demand)` = `(1097, 420, 71)`, `(1107, 644, 102)`, `(1112, 806, 124)`, `(1114, 814, 125)`. The code computes numerical profiles from supplied intervals and checks those values; it does not verify that the old-profile theorem applies or proves the assumed bounds. The checker is independently implemented but has not been formally proven sound. A successful run is conditional Python evidence, not a Lean proof or an axiom audit, and does not check the extensions, renewal argument, or final upper bound. No CI success is implied until a hosted run actually completes.

To run in a repository containing this workflow and the pinned `input/erdos302_boundary_certificates_publication.zip`, use workflow_dispatch or open a matching PR. The workflow has no granted token permissions, does not pass secrets, uses a SHA-pinned checkout action with credentials persistence disabled, and has a six-hour timeout. PR checks test the checkout revision selected by GitHub (normally the PR merge commit). Hosted runner software remains in the trusted computing base. Publishing this local work and triggering CI require separate authorization; neither is done here.

Local smoke tests (not the full expensive interpretation):

```
PYTHONDONTWRITEBYTECODE=1 python3 -O -m unittest discover -s independent_bank -v
```

The full checker, intended for hosted CI, is `python3 -O independent_bank/verify_bank.py`.
