# Std-only small-node checker

Lean 4.27.0, `import Std` only. `Checker.lean` defines an indexed edge certificate over the literal vertex list and a bounded bitmask cover predicate. `Checked v es r` checks all supplied edges for ordered positive arithmetic validity, and checks every bitmask below `2^v.length`: any mask hitting all these edges has at least `r` selected indices. `decide` is kernel reduction. Supplying only some valid edges is sound: an actual cover of all arithmetic edges necessarily hits the supplied subset.

`Sound.lean` proves `checked_edge`, `cover_of_hits`, and `lower_bound`. The latter is a mathematical lower bound for bounded indexed masks, not yet a theorem about Mathlib `Finset` covers. `weight` counts selected indices via `List.range`. `Test.lean` checks one valid triangle, rejects an overstated bound, and rejects an invalid arithmetic edge.

`generator.py` reads the compressed archive as JSON only, independently generates candidate edges, and writes source-indexed Lean literals. Its manifest is limited to successful entire chunks with full `#print axioms` output for each theorem. It excludes the 1900 prior `upper-small-bank` indices and the separately kernel-checked index 4022; this exclusion depends on those prior artifacts. It uses a 5-GiB address-space limit, a per-process timeout, total wall-clock budget, process-group kill on timeout, and a 3-GiB free-disk floor checked between batches. Existing generated evidence is never overwritten. `verify_coverage.py` reparses the original source, recomputes exact literals and edges, checks hashes and recorded logs, and reports coverage. Stored logs are not tamper-proof; rerun Lean to independently reproduce. Source-to-index correspondence is checked by Python, not itself a Lean proof of JSON decoding; each Lean statement literally contains the corresponding vertex list and bound.

Example commands (run in this directory; do not rerun the generator in a nonempty `generated/`):

```
lean +leanprover/lean4:v4.27.0 -o Checker.olean Checker.lean
LEAN_PATH=. lean +leanprover/lean4:v4.27.0 -o Sound.olean Sound.lean
LEAN_PATH=. lean +leanprover/lean4:v4.27.0 Test.lean
python3 generator.py --seconds 600 --timeout 90 --chunk 20 --mem-gib 5
python3 verify_coverage.py
```

## Bridge still required

In the Mathlib project, import this checker and prove for a duplicate-free literal vertex list `v` and any `S : Finset ℕ` that the mask selecting precisely indices `i < v.length` with `v[i] ∈ S` is `< 2^v.length`, has `weight v.length mask = (S ∩ v.toFinset).card ≤ S.card`, and has the advertised test-bit equivalence. Use `checked_edge` plus list-index membership to construct `UpperBridge.OrderedEdge v.toFinset` for every supplied edge. An `UpperBridge.OrderedCover` then yields `cover_of_hits`; apply `lower_bound` and the cardinal inequality. Literal `v.Nodup` can be discharged by kernel computation. This bridge has **not** been implemented or kernel checked here, and thus these results do not yet imply the existing Mathlib cover theorem or the overall archive result.
