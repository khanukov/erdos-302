# Staged case-4 replay candidate

`ArchiveCase4Staged` attempts an assumption-free semantic prefix of length five:
the four prior nodes come from `ArchiveSmallPrefix.sound`, and node 4 uses
`BankCase.check_sound` with the generated archived dual tree. Each of the three
row bounds is obtained by `ArchiveScaling.bound_image` from prior nodes 2, 3,
and 0, respectively; the literal scaling equalities and row supports are Lean
checks. The separately defined semantic prefix is **not** a five-node
`ArchiveDag.Check`: `ArchiveDag.Rule` still has no case constructor.

The Python gate authenticates the compressed bank and reuses the exact
case/source/image translation checks, then compares the generated case data and
semantic proof template. Python-to-Lean correspondence remains outside Lean.
The tests mutate case fields, source data, images, and weights. The upper
integration workflow builds and checks the candidate and gates its axioms.
These are candidates until that hosted workflow succeeds; this worktree did
not run Lean. The existing `ArchiveSmallPrefix` proof itself likewise needs
successful Lean checking before relying on this candidate.

Node 5 is `{'t': 'trim', 'ref': 3}`; image 3 is `[4, 1, 1]`. A next step
must prove a trim rule identifying deletion of exactly isolated vertices,
verify the image and the normalized result, and extend the semantic prefix,
not treat the trim bound as an assumption. Full replay additionally needs
fail-closed interpretation and soundness for all used case, trim, pack, qpack,
and external-leaf forms, all prior-reference/scaling/normalization invariants,
and a checked bridge from external bank bytes and archive profiles to the
Lean objects. The bank has 4,106 nodes and 25,744 images. Full-bank replay,
profile coverage and the unconditional endpoint are not established here.
