# Node 1190 leaf assembly candidate

The generated candidate folds all 530 indexed positive-weight occurrences and
connects the row, capacity and objective components to `leaf_with_index_bridges`.
Its singleton and final shard statements no longer assume the leaf checker.

**Not verified:** no Lean compilation or axiom gate was run for this candidate
or its component imports. In particular, the large support coverage/capacity
fold, indexed weight dispatch, concrete threshold reduction, definitional
objective bridge, and final `change` must all elaborate and pass kernel and
axiom checks on the exact committed snapshot. Generated Python tests and byte
regeneration do not establish any of those Lean claims. Upstream DAG soundness,
archive-to-Lean correspondence, and the wider theorem chain remain separate
obligations. This candidate does not prove the final mathematical result.
