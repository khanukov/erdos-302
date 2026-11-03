# Inactive retention candidate

This is an **uncompiled CI candidate**, not a verified theorem. The Lean source
states an equivalence between retention of every positive rational reciprocal
triple with distinct right denominators, in either order, and the
absence of a bad triple from three finite scans indexed by `U \ V` and `U`.
It assumes every vertex of `U` is positive. Recovered triples are guarded by
all universe memberships, `b < c`, and the exact equation, so truncated
natural division is not accepted as an edge. No completeness of an external
edge list is assumed. The generic proof and finite checker still need a Lean
compiler and axiom-gate run; resource cost has not been measured.

The checked *candidate statement* for the literal induced subgraph `{1,2,3,6}`
of node 1097 has inactive vertex 1, retains the real edge `(2,3,6)`, and includes
negative tests for removing each edge endpoint, truncated quotients, zero, and
equal right denominators. The existing `UpperBridge.reciprocal_iff_product`
and `OrderedEdge` are used for the bridge; equal denominators are deliberately
excluded (1/1 = 1/2 + 1/2). The source scan checks the two sample sets
against the existing node-1097 Lean literals; this is not archive authentication.
It is neither the full node-1097 retention result nor a certificate for the
other nodes, nor does it establish the original smooth-universe identification.

Run `.github/workflows/inactive-retention-candidate.yml` on a hosted runner to
compile and gate the exact candidate SHA. It pins the toolchain archive digest,
Mathlib revision and manifest, checks the cache dependencies, scans the Lean
source for forbidden shortcuts and gates every listed theorem's printed axioms.
The job is bounded to 120 minutes and one Lean thread, with a 24 GiB
per-process virtual-address limit, not an aggregate memory limit. Mathlib
cache objects are reused. A green result would cover only this standalone module
and its sample, including the rebuilt UpperBridge dependency. No hosted run
has been performed for this candidate.
