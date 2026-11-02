# Density prefix candidate

The dispatch-only `Density prefix candidate` workflow compiles the literal-ledger
bridge and this candidate, checks all seven printed theorem axiom reports against
the standard allowlist, and compiles the structural Lean examples. It runs with
a 180-minute job timeout and explicit per-command timeouts. A timeout or failed
build is not proof. The candidate is deliberately excluded from the automatic
UpperIntegration closure until the hosted run establishes that it compiles.

The proposed result matches each indexed occurrence's prior rational density
fold to the real Finset-product density. It does **not** establish the weighted
fold-to-sum equality, the cover hypothesis, or archive-byte provenance. Python
rational checks are independent sanity checks, not kernel evidence. No hosted
result is claimed by this change.
