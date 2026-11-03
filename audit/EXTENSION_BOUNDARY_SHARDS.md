# First extension boundary shard candidate (2026-11-03)

This is an **uncompiled candidate**, not a kernel-verified boundary. The isolated
closure workflow is configured to compile every shard and gate its axioms, then
compile and gate the assembly. No Lean build or hosted CI run was performed on
this revision; elaboration and resource feasibility remain unknown.

The 20 generated modules partition the first pair coordinate `b` into contiguous
half-open numeric intervals [0,100), ..., [1800,1900), [1900,1901).
Each shard quantifies over all members of the 901-element source in that interval
and all 901 possible second coordinates, with the original exact-division guard.
The assembly proposes a kernel-checked source bound `b < 1901`, the two subset
checks, and interval dispatch to derive `PairBoundary`, then `Boundary`, with
**no boundary hypothesis**. `source_to_seed` still assumes the genuine source
bound `Extended.Bound source 258`; `projected_seed` also assumes containment in
the target. There is no checked linkage to the source bank node or profile.

`first_archive.py --shards` regenerates all files from the pinned archive through
`load_inputs`, the conditional full-bank interpreter, and the archive row's own
deletion set. `--check-shards` checks their exact filenames and complete bytes.
This is data provenance checking, not a kernel proof that archive bytes correspond
to Lean literals or that the source demand is valid. The legacy monolithic module
remains in the repository but is excluded from this diagnostic closure. The
workflow builds shards serially against the same local compiled objects; it has
not demonstrated acceptable runtime within its 350-minute limit. It does not
prove the other 514 extension witnesses or the final endpoint.
