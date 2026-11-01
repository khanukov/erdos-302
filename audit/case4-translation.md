# Archive case 4 translation slice

`independent_bank/case_translation.py` is deliberately restricted to the exact
archive node 4, its three image rows and the three source small nodes. It
rejects a difference in any of those serialized data, including bool versus
integer, and the command-line entry point first verifies the pinned archive
SHA-256 via `load_archive`. It does **not** admit or translate any other case,
or does it check all bank rows. The interpreter additionally validates the
small-node prefix through node 4 and the case dual. Image references are
(0, source 2, 1/1), (1, source 3, 1/1), (2, source 0, 4/1).

For each referenced image U with demand r it computes the signed restricted
row `(U ∩ T, r - |U \\ T|)`. In this particular instance every image is
inside T, so the three residual demands are all 1. The generated Lean file
records all image/source references, normalized source supports and demands,
target support and exact demand, all restricted rows, and the dual weights
and denominator. It includes a `by decide` **candidate** checking `BankCase.check`.

Reproduce and compare (avoid redirecting directly onto the tracked file on a
failed invocation):

```sh
python independent_bank/case_translation.py > /tmp/archive-case4.lean && cmp /tmp/archive-case4.lean lean/ArchiveCase4.lean
python -m unittest discover -s independent_bank -p 'test*.py' -v
```

Use an appropriately isolated temporary directory in CI rather than `/tmp`
if required by the environment. A host Lean CI job must compile
`lean/ArchiveCase4.lean` in the same environment as `CaseTree.lean`; no local
Lean execution was performed here. The existing generic `BankCase.check_sound`
is separate: this candidate's acceptance has not yet been checked by Lean.
Even successful Lean compilation would check only this explicitly supplied
case-tree data. The archive bytes-to-data translation, image and source bounds,
restriction-of-cover semantics, exact archive correspondence, and the resulting
archive node bound are **not proved in Lean**. The Python validation, mutation
checks and brute-force row oracle are reproducibility evidence, not a semantic
bridge proof. In particular, the informational `sourceNodes` and `imageRefs`
definitions are not connected to `rows` by a Lean theorem. No full-bank or
unconditional theorem is claimed.
