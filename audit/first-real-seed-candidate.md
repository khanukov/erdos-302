# First real seed: candidate, not checked

`lean/ArchiveFirstSeedCandidate.lean` proposes an all-natural-arguments graph
bound for the sparse seed 1 at 6, 18, 24, 2 at 12, and 0 elsewhere. It
uses actual checked-node source declarations `ArchiveSmallPrefix.sound` at
nodes 0 and 1, whose supports are respectively {2,3,6} and {2,3,4,6,12};
the latter has demand 2. It converts ordered-cover bounds to `Demand Edge`,
and embeds the supports into `vertices (insert 2 Q) n`. It assumes only
`3 ∈ Q` for this seed result. This is not a seed-demand hypothesis and is
non-circular: the node proofs do not use the max recurrence.

The replay check `python audit/renewal-joint-ci/check_bounded_operands.py`
passed at ae476d0 and compares the real archive operands and corrections to
the old literal through n=24. An independent finite Python comparison also
matched this sparse function to that literal on 0..199; a Lean identity
between these two definitions is still required. Their common zero tail is
intended, but the finite Python test is not a proof of all-argument equality.

This candidate has **not** been compiled, axiom-gated, or tested in hosted
CI. A manual-dispatch workflow now stages its explicitly enumerated local
closure, checks the exact theorem contract and negative examples, compiles the
closure, and gates the node and seed axioms. Lean and Mathlib are pinned; the
Mathlib cache is reused. The source/exclusion inventories are updated, but this
module is deliberately excluded from the existing integrated proof slice. The
workflow and Lean contract are themselves unverified until hosted CI runs.
No heavy local Lean was run and no remote writes were authorized; historical
runs on other SHAs are not evidence for this candidate.

The first-cell recurrence still needs a Lean bridge from this seed to the
literal seed in `RealBounded`; it also needs the actual selected prior set Q
with `3 ∈ Q`, and all-argument old-profile and parent bounds. For broader
n and the full archive, the bounded seed's zero tail is a valid weaker seed,
not the archive's full seed: the full bank and extension witnesses, their
certified soundness and smooth-set embeddings/projections at every used n,
and a replay equality to the actual seed/max operands remain required.
Neither finite correction equality nor this seed alone establishes the
archive-level recurrence or global cover bound. Source-byte-to-Lean provenance
remains external.
