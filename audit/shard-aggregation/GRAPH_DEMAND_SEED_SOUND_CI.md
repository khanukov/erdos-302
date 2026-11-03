# Graph-demand seed soundness CI candidate

The first-real-shard workflow compiles the seed-soundness candidate, its typed
contract and prerequisites, then checks the reported axioms. It runs on push,
pull request and manual dispatch. This is a staged CI gate, not evidence that
the workflow has run successfully on this commit.

The general theorem requires **every** natural number that is Q-smooth and at
most n to be in W. In particular 1 is smooth, so at n = 6 the hypothesis
requires 1 in W as well as 2, 3, 4 and 6. This is stronger than merely embedding
the filtered support of the particular archived node, and it is not established
here for any intended ambient set. The graph-demand conclusion remains
conditional on that hypothesis and on checked nodes.

The only link from the semantic maximum to the 32-node table's seed in this
candidate is the equality of their values at n = 6, where both are 1. It does
not establish table/semantic equality at other points, global recurrence
soundness, archive-byte correspondence, or a final endpoint theorem. The typed
contract pins these hypotheses and the point n = 6; the axiom checker allows
only the repository's standard Lean axioms.
