# Node 1209 standalone literal diagnostic — incomplete

`RootRoundingLiteral.lean` kernel-checks a standalone list of 510 literal
(weight, demand) pairs and its strict numerical inequality. The Python
generator transcribes the occurrence data from the existing candidate generator;
it is not a proof that those pairs equal the bridge's indexed weights and source
demands, and this module makes no archive-provenance claim.

**Blocker:** This does not prove the `hround` hypothesis of
`Node1209CapacityBridge.node1209_valid`: the bridge has an arbitrary `r` and an
indexed sum over `Node1209CapacityData.rows`; no Lean equality connects that sum
to the literal diagnostic. Nor does it prove `hsub`: the 510 individual row
checks contain containment, but a Lean assembly relating their distinct target
literals and every indexed capacity row to those checks is still needed.
The source-demand function must also be connected to the checked mixed DAG,
without assuming the desired source bounds. The existing capacity theorem and
row shards are candidates unless their exact combined build and axiom gate have
passed. The standalone workflow is deliberately not a root validity gate.
