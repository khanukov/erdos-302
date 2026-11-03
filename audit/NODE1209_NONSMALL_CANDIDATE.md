# Node 1209 case/trim candidate shards

Seven generated modules state `MixedDag.Check MixedCaseTrimCandidate.extraCheck
Node1209Dense.nodes i` directly, with no validity or predecessor-bound hypotheses.
The case indices are 4, 7, 14, 374 (original 4, 7, 14, 1190); trim indices
are 5, 8, 15 (same original indices). Each attempts `decide` on the actual
dense node; each has an exact-type example and an axiom print. No precomputed
success boolean is used. The case at dense 374 has 530 reference occurrences;
the trim checker quantifies over every triple in its actual source image. These
monolithic per-node decisions may exceed the bounds; no performance claim is
made. Further sub-sharding may be needed, especially for node 374.

The manual workflow rebuilds the dense and small dependencies, then checks the
seven exact fixed declaration names with the axiom allowlist. It pins Lean and
Mathlib as in the existing dense workflow and reuses the Mathlib object cache.
Each non-small Lean process has a 45-minute timeout and 12 GiB virtual-address
limit, with finite heartbeat and recursion options; the job has a 360-minute
deadline. The limit is per process, not an aggregate job-memory bound.

`node1209_nonsmall.py --check` authenticates and replays the source via the
existing closure extractor, compares all closure and small outputs, regenerates
and compares Dense.lean byte-for-byte, then requires an exact seven-file byte
inventory. Tests mutate theorem bodies, imports, identifier text and inventory.
The conversion from archive bytes to Lean remains trusted Python, not a Lean
proof of byte provenance. The declarations and workflow are uncompiled
candidates until an exact-SHA hosted run and axiom gates succeed. They do not
establish the root pack check, assembled DAG, semantic bound, or global result.
