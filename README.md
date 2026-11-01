# Erdős Problem 302 — upper-bound verification

**Preliminary research workspace; not a completed proof or a peer-reviewed publication.**

The `input/` archive is the supplied boundary-certificates draft, preserved byte-for-byte. SHA-256: `9396819eb36e25926d7ae8ee78b85c61cb898801f935fccfe72ebcad491bc196`. Its internal manifest establishes consistency of the bundle, not mathematical validity or independently authenticated provenance.

The archive's baseline claims the profile-only global upper bound `limsup f(N)/N < 0.841230807050`, but **this repository does not yet contain a complete kernel-checked proof of that bound**. The new boundary certificates strengthen a local relaxation and do not themselves claim an additional global improvement. The baseline relies on an external profile input and a finite certificate bank whose full formal verification remains in progress. The archive does not claim a complete solution of Erdős 302.

Partial Lean developments and audit material are recorded under `lean/` and `audit/`. Earlier successful logs identify the exact scope and environment of each check; they are not substitutes for a reproducible build. A green CI job checks only its stated scope, not the global theorem unless that theorem is explicitly built and its axioms inspected. No license, independent human review, or novelty/priority claim is inferred from publication of this workspace.
