# Sparse boundary status

`SparseBoundary.lean` is kernel-checked using Lean/Std. It enumerates using
`S \ T`, not the proposed deletion `U`. `candidates_iff_outside` derives
completeness from `SparseTriple.candidates_iff`; no external list of edges is
assumed. `check_iff` proves the list Boolean equivalent to the list boundary.
For lists representing finsets, membership converts via `Finset.mem_toList`;
`SparseTriple.edge` is the arithmetic tail of `UpperBridge.OrderedEdge`, so
these list conditions are exactly `ExtensionSeedCandidate.Boundary`.
`lean/SparseBoundaryMathlib.lean` states and attempts to prove that connection,
but has **not** been compiled: this local workspace lacks mathlib and the
upstream lower-lean dependency. It must be checked before use.

`python3 audit/extension-ci/sparse_boundary.py` executes an independent,
efficient set-based decision on the literals in `ExtensionBoundaryData.lean`.
The Python implementation is regression-tested against brute-force enumeration
on small universes, but is **not formally connected to the Lean Boolean**, so its
result is not a Lean proof of the concrete boundary. The literals have not
been proved to correspond to any archive; no provenance claim is made.
The existing sparse-triple job runs these checks under its ten-minute limit;
that CI run has not been executed here.
