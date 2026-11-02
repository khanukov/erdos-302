# Staged archive prefix candidate

`ArchiveSmallPrefix` reifies nodes 0–3 and proposes
`valid : ∀ i < 4, ArchiveDag.Check nodes i` and
`sound : ∀ i < 4, Extended.Bound (nodes i).support (nodes i).demand`,
derived from `ArchiveDag.sound`, with no leaf-bound hypotheses. These are
Lean candidates, not verified results: neither local Lean nor hosted CI was run.
The integration workflow includes both declarations in its axiom gate.

The Python generator checks the compressed bank hash and duplicate JSON keys,
accepts only positive sorted unique gcd-one small supports and positive demands,
and rejects unsupported node types instead of silently omitting them. The
byte-to-Lean transcription is not a kernel-checked archive parser. The fallback
node is outside `i < 4` and must not be counted as replayed.

Node 4 is a case: image 0 references node 2 at 1/1, image 1 node 3 at 1/1,
and image 2 node 0 at 4/1. It needs a sound integrated case-rule constructor,
image-derived source bounds, and exact target identity. Existing
`ArchiveCase4Semantic` is separate and does not make node 4 an `ArchiveDag`
node. Node 5 is trim, referencing node 4 via image 3 at 1/1: it needs a sound
isolated-vertex deletion rule and exact normalized support identity. Later
case, pack, qpack, trim, and external leaves need corresponding sound rules or
explicit hypotheses. No full-bank, profile, or endpoint claim follows.
