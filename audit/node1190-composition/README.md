# Minimal-to-root composition — unverified Lean candidate

`RootDenseData.lean` is the complete node-1209 dense translation, with its namespace renamed so it can coexist with the different node-1190 minimal `DenseData`. The Python test checks byte-for-byte that this is the only change. These are separate Lean definitions, not an identification of the two DAGs.

`Composition.lean` proposes a decidable concrete Finset inclusion from minimal dense node 336 to full dense root node 375; soundness of the assembled minimal checks supplies its bound. Monotonicity transfers that bound to the root, then the existing root literal identities supply the source bound 258, and the existing boundary bridge supplies the target bound 242. No validity of the root node or desired bound is assumed. The exact-type contract and axiom gates cover all four conclusions.

The corresponding hosted workflow is manual-dispatch only. **Neither this composition nor its minimal closure has been kernel-checked here**; the workflow may fail or exceed resource limits. Python replay, source generation, namespace-rename testing, and digest checks do not prove that either Lean translation matches the archive bytes. Archive-to-Lean provenance remains an external trust boundary. The workflow compiles the minimal closure and both distinct dense definitions before the composition, and checks printed axioms.
