# Seed/max first-cell candidate (uncompiled)

`SeedMaxFirstCellCandidate.lean` imports the mixed bank nodes 0–31 and the
literal ledger. It computes the seed maximum directly from those node supports
and demands at level {2,3}, then computes the archive-style old/max renewal at
n=1..11 and compares its derived correction to the literal ledger. It also
computes the seed-only max recurrence, checks that removing the old term does
not change this bounded result, and records the actual node 0 graph bound and
its seed value at 6. The first literal cell is [6,24) of height 1; this shard
covers only 6..11 of that cell and 1..5 before it.

Dependencies and limits:

* Node 0's bound depends on `ActualPrefix32.sound`, the mixed DAG and its
  checked rule soundness. `witnessed_correction` joins that bound with the
  computed equalities; it does **not** prove a generic graph-demand soundness
  theorem for the seed maximum. Only the explicit node 0 bound is connected
  semantically. No general profile lower bound or global cover is proved.
* `smooth23` is a finite hand-written enumeration up to 120, not a proved
  equivalence to `UpperProjection.Smooth`. The first two input levels' parents
  are set to zero; oldAux includes the old interval [6,24), with remaining
  intervals omitted because they start at 48. These transcription and bounded
  old-profile premises are not yet formally connected to archived inputs.
* Bank and ledger literals are not linked to archive bytes in Lean. Node
  transcription is independently byte-checked by `next_shards.py --check`.
  The separate Python replay confirmed the requested bounded recurrence and
  ledger agreement using the first 32 parsed archive witnesses.
* The candidate and its combined imports have NOT been compiled or axiom-gated.
  The amended dispatch-only first-real-shard workflow is a CI candidate, not a
  CI result. It rebuilds the mixed prefix and ledger in the same pinned
  environment and gates all new named declarations. It can reuse Mathlib cache.
  Resource usage and elaboration success remain unverified.
