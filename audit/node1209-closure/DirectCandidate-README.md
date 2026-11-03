# Node 1209 direct source-bound candidate

This is a **conditional, uncompiled candidate**, not an established source
bound. It invokes mixed-DAG soundness at dense index 374 (archive node 1190)
and then transfers the resulting bound to the root support by literal subset.
Its only mathematical antecedent is that every dense checker at indices
`0 ≤ i < 375` succeeds. In particular, it does not assume the bound itself,
nor does it require dense index 375's 510-row root pack check. The antecedent
still includes the unchecked node-1190 case and all earlier checks.

The generator independently replays the SHA-256-pinned bank and compares both
complete ordered support literals against that replay, rejecting coordinated
changes to shared vertices as well as individual changes. It also checks that
node 1190 has 899 vertices, node 1209 has 901, both demands are 258, and the
additional vertices are 1892 and 1900. This is a Python provenance/replay check, not a kernel proof
linking archive bytes to Lean. The source and dense literals are regenerated
separately in the workflow. The Lean subset proof uses a single `decide`; its
resource use and even successful elaboration have not been verified. If it
exhausts resources, split and normalize the literal subset proof before claiming
success. The manually dispatched workflow compiles the closure and candidate,
checks an exact-type contract, and gates reported axioms; it has not been run.
