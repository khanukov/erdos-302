# Mixed DAG candidate

`MixedDag` is an independent ordered checker for edge, exhaustive-small,
image, and occurrence-indexed scaled-pack nodes. Its strong-induction proof
uses the mixed checker itself for every earlier node. Repeated source numbers
remain separate `Fin n` occurrences, including in capacity sums. Every row
checks strict backward reference, positive multiplier and divisor, and exact
divisibility. `ArchivePack.Valid` checks capacity, support and rounding.

An `extra` payload and its checker are parameterized. `MixedDag.sound` is
conditional on an explicit semantic soundness theorem for that checker given
bounds for earlier nodes. Instantiations must prove this contract; it is not an
unconditional proof of arbitrary extensions. The contract quantifies over every
node array, index and payload, and requires a bound for the current node even
without a premise that its rule is `.extra e`. An extension checker must encode
any needed relation between the payload and current node itself. It may inspect
the whole node array, including later nodes, but its soundness proof receives
semantic bounds only for strictly earlier indices. Decidability of the extra
checker is also an explicit instance requirement for executable `Check`.

For packs, the row domain is the finite type `Fin count`; support membership,
divisibility and capacity checks range over finite supports and row occurrences.
Executability still depends on computable node and row functions and on the
provided decidable extension checker; the definition imposes no resource bound.
Neither case nor trim is implemented here, and this candidate does not establish
archive replay or validate the synthetic predecessors used in
`BankRowPackArchive1090`.

The manual bank-row-pack GitHub workflow compiles both files and checks the
reported axioms. Local Lean elaboration and hosted CI remain required before
claiming the candidate is verified.
