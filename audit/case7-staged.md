# Archive node 7 staged replay

Node 7's four image rows reference only earlier small nodes 0, 2, and 6
(images 4, 0, 5, 6); nodes 4 and 5 are not dependencies of this particular
case. The 5x image of node 0 is checked by `ArchiveScaling.bound_image`.
Node 6 is checked directly as an ordered edge. The four rows cover disjoint
subsets of the actual node-7 target. `ArchiveCase7Staged.bound7` is a Lean
bound derived using the generated dual check and these earlier bounds; it
does not take a node-7 bound as a premise or invoke `Extended.bank_node_7`.

`case7_translation.translate_pinned_dual` handles a single dual root with
explicitly pinned case, image records and small-node sources. It checks the
interpreter prefix and fails on mutations; it deliberately rejects non-small
sources and other trees. The CLI verifies pinned archive identity via
`archive_prefix.load_bank` and compares the complete generated Lean file.
The archive-to-Lean connection is still a Python check, not a Lean theorem.
The interpreter's small-leaf callback is not a formal proof; the staged Lean
proof independently supplies each source bound.

The staged workflow succeeded for commit e0c685d (run 41405367129),
including kernel compilation and axiom checks. UpperIntegration now owns these
modules and runs the correspondence tests and axiom gate in automatic CI.
The new unified integration has not yet been compiled in CI. This proves only
the displayed node-7 bound, not a general checked bank prefix or
bank-to-profile completeness. No local heavy Lean build was attempted.
