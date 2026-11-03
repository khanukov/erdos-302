# Sparse boundary Mathlib CI

The hosted job compiles the exact staged import closure, including
`SparseBoundaryMathlib`, and gates the exact axiom-report inventories for the
sparse proofs and extension seed. Its source project and Lean version are pinned;
the external lower definition is checked by commit and SHA-256. Cache artifacts
are used when available. This is a proposed CI gate, not evidence that the job
has run successfully. The candidate Mathlib bridge remains unverified until a
hosted run succeeds.

The bridge relates the Lean list checker to `ExtensionSeedCandidate.Boundary`.
It does **not** establish that a literal Python result or any archive witness is
the Lean Bool input, nor does it establish provenance for such a witness.
