# Archive node 8: staged semantic trim

The pinned bank's node 8 is `trim` image 7 = `[7,1,1]`, referencing node 7.
Its candidate support is `{2,3,4,5,6,8,10,12,15,20,21,24,28,30}`
and demand is 4. It removes 7, 14 and 16. The generated Lean theorem
`ArchiveTrim8.bound8 : Extended.Bound target demand` has no premises; it
uses `ArchiveCase7Staged.bound7`, not an assumed node-7 bound. Complete
edge retention is checked over the whole source target, and separate witnesses
check each retained vertex. The image equality is checked in Lean.

`trim8.py` reads the archive via the SHA-256-gated `archive_prefix.load_bank`,
checks exact typed node/image records, the node-7 case and all referenced
source data, the generated node-7 data, the small prefix, and the exact
SHA-256 of the existing node-7 staged proof. It compares computed trim output
and gcd normalization with interpreter output. The Python interpreter and
transcription do not prove correspondence of the original archive bytes to
Lean. The node-7 Lean files are unchanged. Mutations are tested under both
normal and optimized Python.

`trim8-staged.yml` is a dispatch-only CI candidate that rebuilds the existing
integration closure and node-7 dependencies, then checks node 8 and its axiom
report using pinned Lean and Mathlib (with cached Mathlib objects). The staged run 41409255067 succeeded for commit 2d6f310. The automatic
integration closure now includes node 8 and a literal-support replay test;
the integrated candidate still requires its own exact-commit CI run.
No proof of the whole bank, bank-to-profile bridge, or unconditional archive
endpoint follows from this node. No local Lean build was attempted.
