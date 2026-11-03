# Node 1209 pack bounded-row pilot

`Node1209PackPilot.lean` is a **candidate**, not yet compiled or axiom-gated.
It contains the literal first eight root-pack occurrences, the source-node-0
support and the full root support. The intended bounded checks establish each
row's backward reference, positive scale, exact divisibility, and image
containment; `row_bounds` derives each semantic image bound from an exhaustive
small-check of source node 0. The row image IDs and weights are retained for
byte correspondence but are not used to prove capacity.

The generator replays the SHA-pinned archive and checks all 510 rows in Python;
its `--check` regenerates the *entire* Lean module byte-for-byte. This external
correspondence is not a Lean theorem. The workflow checks those bytes and gates
all three pilot declarations' axioms with the pinned toolchain. It has not yet
run. Existing capacity preflight is diagnostic, not a kernel proof. No 510-row
shards have been generated: representative Lean performance and correctness
remain unmeasured. The pilot does not prove root capacity, rounding, the mixed
DAG, or node 1209's demand 258.
