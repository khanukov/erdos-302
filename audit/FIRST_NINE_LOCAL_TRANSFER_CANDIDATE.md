# First-nine local transfer candidate

This is an **uncompiled, not axiom-gated candidate**, based on b55c946. It attempts to prove the actual checks for indices 0–8 of generated `FullLocalShards.S0.nodes` from `FirstRealShard.checked`, using `MixedDagLocality.check_local`. It lowers the wrapped payload type, proves target support/demand and rule equality and proves every read falls in 0–8; the final theorem attempts to discharge the wrapper difference. No whole-bank hypothesis is used.

The negative candidate changes node 4's demand to 0; node 5 actually reads it, field equality fails, and the node-5 checker is false. The CI workflow compiles and axiom-gates all declarations, but has not been dispatched or run for this candidate. Actual compiler diagnostics, resource behavior, and axiom output remain unknown. Source correspondence tests are not Lean proofs of archive transcription. This is not a proof of the remaining bank, archive correspondence, or final endpoint.
