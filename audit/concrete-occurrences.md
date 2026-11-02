# Concrete renewal occurrences (candidate)

`OccurrenceIndex.lean` is kernel-checked with Lean 4.33.0-rc1 and uses only `Std`. For each level, `occurrences` enumerates each exponent in `List.range n`, then recursively records suffix choices and emits that level's correction. List positions preserve multiplicity, including different exponent choices with equal evaluated arguments. Its `index_expansion` theorem proves the list-based expansion by induction; it makes no assumption on primes or the recurrence.

`RenewalConcreteOccurrence.lean` is an **unverified Mathlib candidate**. It bridges the list expansion to `RenewalMultiplicityCandidate.expansion`, and states a concrete allocation theorem without an assumed `index_expansion`. The local environment lacks the pinned Mathlib build, so these declarations and the expanded CI workflow have not been Lean-checked. CI must pass before treating either theorem as proved. The original generic theorem remains available.

Open obligations for the archive application:

* Prove each occurrence's correction identity from the actual archive cell construction, including its heights and multiplicities; it is currently an explicit hypothesis.
* Construct and prove the finite multiplicity-preserving bijection (or equivalent weighted counting statement) between this bounded exponent-choice list and the archive's actual suffix-smooth/cell occurrences. This includes any distinct-prime, uniqueness and range conditions; no such bijection follows from the generic list theorem.
* Prove the required demand, roughness, and recurrence premises for the concrete archive data. The present candidate does not by itself close `hcover`.

## Scope and verification status

The isolated, manually dispatched `renewal-multiplicity` workflow uses the pinned Lean digest and Mathlib revision, a 120-minute job limit, an exact source inventory and build order, and explicit axiom allowlist checks for both allocation declarations and both indexing declarations. This is a candidate CI gate, not evidence of a successful hosted run. Only the `Std` occurrence index and its tests were checked locally; Mathlib bridge, pointwise allocation, and graph-demand tests remain uncompiled pending the hosted job. The theorem names and axiom gates do not certify the archive-data obligations above.

The reference model's original `occurrences` function omits zero-argument terms. `bounded_occurrences` mirrors the Lean list including dummy zero occurrences and preserves exponent-choice identities; their weighted sums agree when correction at zero vanishes. The test with repeated divisor 2 demonstrates duplicate positive arguments while satisfying the divisor-greater-than-one hypothesis. The cover test uses a concrete edge `{2,3,6}` and demand 1, rather than assuming the impossible demand 3 on `{1,2,3}`.
