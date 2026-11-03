# Inactive-endpoint retention probe (not a Lean certificate)

The companion Python script compares two independent finite enumerations on the
literal candidate sets. It is exploratory evidence only, not a kernel check,
not an archive correspondence check, and not a proof of the upstream theorem.

Proposed Lean checker: for each `x ∈ U \ V` and `y ∈ U`, test the
three ways in which `x` may be an edge endpoint. For `x = a`, require `x < y`
and recover `c = x*y/(y-x)`; for `x = b` or `x = c`, let `(b,c)` be
`(x,y)` or `(y,x)` and recover `a = b*c/(b+c)`. Check membership, strict
ordering, and the exact equation `b*c = a*(b+c)` after every division.
Checking exact equality is essential: natural division truncates.

For equivalence with the original universal edge-retention statement, Lean
must prove, without assuming an enumerated edge list is complete:

* Every edge of the positive universe has `a < b` and is recovered in the
  appropriate scan. For the `a`-case use `a*(b+c) = b*c` to derive
  `a*b = c*(b-a)` and `0 < b-a`, then exact natural division cancellation.
* Every recovered tuple is an original edge, by the checked membership,
  ordering, and exact equation. Each reported failure contains an inactive
  endpoint. Thus absence of scan failures is equivalent to retention.
* If the intended original edge statement has no positivity hypothesis, handle
  zero separately; do not silently strengthen it. For these particular literal
  universes, establish positivity by a kernel-checked closed lemma.

The scan costs three tests per inactive/universe pair, but actual Lean kernel
runtime and memory are unknown; literal membership and proof-term construction
may still dominate. A hosted pinned-toolchain CI run, exact axiom gate, and a
full-1097 theorem matching the existing universal statement remain necessary.
