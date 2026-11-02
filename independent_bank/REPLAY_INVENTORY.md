# Baseline archive replay dependency inventory

Run `python3 independent_bank/replay_inventory.py` to emit deterministic JSON;
`replay_inventory.json` is the checked-in output. Run
`python3 -O -m unittest discover -s independent_bank -p 'test_replay_inventory.py' -v`
to compare the output with the actual pinned archive and exercise rejection cases.
The tool checks the whole publication ZIP SHA-256 before reading it and fingerprints
all baseline replay semantic sources: verifier, bank, extensions, upstream intervals,
upstream thresholds, and claim. It parses the data; it **does not execute** archive
code. A source/archive change requires a deliberate pin update and a fresh audit of
how the verifier consumes its inputs, not merely regenerating the output.

For this exact archive, `verify.py` main calls `check_bank`, then
`check_extensions`, then `renew(levels, vals+ext)`. `check_bank` iterates every
node in order, resolving image references in pack/qpack rows, trim refs and case
constraints; named root references also resolve through images. `renew` iterates
all witnesses at every prime level. Consequently **all 4,106 nodes are operational
roots**, and all 515 extension records enter renewal. The archive's named roots map
is empty; it is not the operational-root set. All actual referenced image nodes
must be strictly earlier than their consuming node. The output records distinct
node dependencies, each extension's source and level, the complete operational
root list, and the transitive dependency closure of extension sources (3,596 nodes).
Image scaling and repeated uses are not represented in this node-level graph;
all original bytes remain fingerprinted. Unused images are range/shape checked,
but backwardness is meaningful at each actual use.

This is an **operational replay scope**, not a claim that all roots or extensions
are mathematically necessary for the final bound. The 3,596-node closure is not a
replacement for replaying the other nodes or all extension records. This structural
inventory is not a proof checker: it does not validate node arithmetic, case trees,
extension coverage, renewal values, or the verifier's soundness, and makes **no
Lean soundness or compilation claim**. It introduces no new proof method.
