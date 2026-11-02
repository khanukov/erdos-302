# Mixed full data export

Run from the repository root:

```sh
python independent_bank/mixed_full_export.py > mixed-full.json
python -m unittest discover -s independent_bank -p test_mixed_full_export.py -v
```

The CLI authenticates the exact publication ZIP against `verify_bank.HASH` before parsing; it reads data members only, rejecting duplicate names for the two members it reads and duplicate JSON object keys. Its `source_archive_sha256` identifies those ZIP bytes, not a theorem and not a hash of the output. The `export(bank, intervals)` Python API accepts in-memory inputs, validates them and conditionally interprets them, but does **not** authenticate their provenance and deliberately emits no archive hash. Inputs must be finite acyclic JSON-shaped data; neither arbitrary hostile in-memory object graphs nor resource-exhaustion resistance are supported.

Each node includes its original archive record and interpreted normalized support and demand. Each occurrence in pack/qpack rows, case constraints, or trim references is exported in its original order with its image index, earlier source node and rational scale. Occurrences are not deduplicated. For a packing node, `normalizer` is the gcd of all scaled image support values. The normalized support consists of these values divided by that gcd. For qpack, `weights` and `capacity` are the original rational weights and unit capacity multiplied by the LCM of row denominators; for pack they are the original integer weights and capacity. The archived rows remain authoritative for the original fractions. Case constraints can include image points outside the case support: consumers must subtract the number of outside points from the source demand, as the interpreter does, not silently discard them.

The four externalActive leaf lower bounds are assumptions, not proven by this export. The interval-derived profile is checked against the expected four numbers, but its mathematical validity and the old-profile bounds are not established here. Small leaves and all intermediate nodes are checked by Python relative to those assumptions; this export is not a Lean proof, a byte-to-Lean provenance theorem, an extension/renewal proof, or the final upper bound. The data and the ZIP hash do not independently establish any of those claims.

The JSON uses sorted keys and compact separators; stdout includes one trailing newline. With the same Python semantics, source files, and ZIP, repeated CLI runs produce identical bytes. The code does not execute archive programs or interpolate data into source code. Run only on trusted, resource-bounded inputs; the general Python API has no input-size or recursion/resource limits.
