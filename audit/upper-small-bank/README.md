# Baseline small-node kernel check

Run from this directory with the existing Lean 4.33 project and `UpperBank.olean`/`UpperBridge.olean` at the absolute paths in `generator.py`:

```sh
python3 -m unittest -v
python3 generator.py --seconds 300 --chunk 100 --timeout 120
python3 verify_coverage.py
```

The generator removes previous files in `generated/` before each run. Preserve the directory and `coverage.json` elsewhere first if needed. It reads the compressed baseline exclusively as JSON, validates the node format, enumerates candidate ordered arithmetic edges, and emits literal source-indexed theorems using `UpperBank.ordered_sound`; `decide` is kernel reduction, not `native_decide`. Each chunk is checked by `lake env lean` and has a log and an axiom query for every theorem. The process group is killed upon timeout. Runs stop at the total wall-time budget or below 3 GiB free disk, checking the latter between chunks. No `.olean` is saved; the successful Lean runs checked the declarations in memory.

`verify_coverage.py` independently reparses the JSON and successful Lean statements, compares each exact index, literal vertex list and bound, checks source and generated-file hashes, and requires the exact axiom query output `[propext, Classical.choice, Quot.sound]` for every counted theorem. This verifies consistency of recorded logs and data; as usual, reproducibility requires rerunning Lean rather than treating stored text logs as tamper-proof execution evidence. Counts include a chunk only if its entire Lean invocation succeeded. `coverage.json` lists all compiled and uncompiled source indices. Both scripts return exit status 2 for incomplete coverage; any mismatch raises an error. Budget, resource contention and resulting coverage may vary by run.

Scope: each counted node bounds the size of an arbitrary ordered-edge cover of that node's vertex set by its literal source `r`. It does not verify case nodes, trim nodes, the completeness of the full archive proof, or the requested global numerical upper bound. Candidate edge generation need not be complete for soundness because Lean independently checks each supplied edge and the lower bound over all subsets.
