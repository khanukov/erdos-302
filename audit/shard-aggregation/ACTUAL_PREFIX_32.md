# Actual mixed prefix 0–31: candidate shards

This candidate transcribes the actual archive nodes 0–31, with separate closed
Lean checker goals in ranges 0–8, 9–15 and 16–31, all over the same literal
node function. The aggregation theorem `ActualPrefix32.sound` has no checked
prefix hypothesis and asserts each of the 32 literal node bounds. The node
function returns an explicit dummy value outside this prefix; no claim is made
about those indices. In particular, this is not the 1091-node replay.

`python3 -B independent_bank/next_shards.py --check` hashes and parses the
pinned archive via the existing loader and compares every byte of each of the
five generated Lean files. The Lean kernel checks literal data, not the
archive-to-Lean transcription; the Python comparison is not a kernel proof of
that correspondence. Generator tests include an altered-byte rejection.

The dispatch-only `.github/workflows/first-real-shard.yml` is extended to build
the candidate with the existing exact Lean binary hash and pinned mathlib and
upstream inputs and to gate axioms for all 32 checks and both aggregate
claims. Compilation and those gates are **not verified** until this exact
commit completes hosted CI. The workflow may reuse the pinned mathlib cache.
The prior first-nine candidate is also rebuilt on this workflow; any failure
before the new modules prevents this candidate from being checked.
