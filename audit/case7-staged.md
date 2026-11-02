# Archive node 7 staged replay

Node 7's four image rows reference only earlier small nodes 0, 2, and 6
(images 4, 0, 5, 6); nodes 4 and 5 are not dependencies of this particular
case. The 5x image of node 0 is checked by `ArchiveScaling.bound_image`.
Node 6 is checked directly as an ordered edge. The four rows cover disjoint
subsets of the actual node-7 target. `ArchiveCase7Staged.bound7` is a Lean
candidate derived using the generated dual check and these earlier bounds; it
does not take a node-7 bound as a premise or invoke `Extended.bank_node_7`.

`case7_translation.translate_pinned_dual` handles a single dual root with
explicitly pinned case, image records and small-node sources. It checks the
interpreter prefix and fails on mutations; it deliberately rejects non-small
sources and other trees. The CLI verifies pinned archive identity via
`archive_prefix.load_bank` and compares the complete generated Lean file.
The archive-to-Lean connection is still a Python check, not a Lean theorem.
The interpreter's small-leaf callback is not a formal proof; the staged Lean
proof independently supplies each source bound.

The dispatch-only workflow `case7-staged.yml` runs both Python modes and
attempts Lean compilation and axiom checks. It has not been run on CI; this is
an unverified candidate, not an asserted Lean result. It does not integrate
node 7 into a general checked bank prefix or establish bank-to-profile
completeness. No local heavy Lean build was attempted.
