# Conditional full-bank Lean data producer

From the repository root:

```sh
python independent_bank/mixed_full_producer.py > MixedFullGenerated.lean
python -m unittest discover -s independent_bank -p test_mixed_full_producer.py -v
```

The producer first runs `mixed_full_export.export`, including the independent conditional bank interpreter, then emits all 4,106 nodes and all 623,846 reference occurrences in original order. Pack and qpack rows use occurrence-indexed `Fin` rows; qpack rational weights are multiplied by the common denominator, and both packing rules incorporate the image normalizer into each reference denominator. Case trees preserve their input constraint indices and weighted occurrences. For an image U and target T, each materialized case constraint is `(U ∩ T, source demand - |U \\ T|)` with integer subtraction, matching `BankCase.Residual` rather than natural subtraction or the obsolete image-subset restriction. Case/trim references incorporate their own normalizers. Unknown or invalid input is rejected by the interpreter or translation, rather than skipped. The API accepts bank and interval objects, not a caller-supplied exported projection; it authenticates neither in-memory object. Inputs must be finite, acyclic, trusted and resource bounded.

The CLI authenticates the pinned publication ZIP before parsing, and labels its output with that archive hash; this is not a byte-to-Lean provenance theorem. Determinism means identical source, Python semantics, and authenticated ZIP produce identical output bytes. The generated data is large; no generated artifact is committed. Shell output redirection may leave an empty file if input validation fails.

**External bounds are assumptions:** nodes 1097, 1107, 1112, and 1114 become `.external` payloads, and `externalBounds` explicitly names their semantic bounds. `extraCheck` requires those bounds, and `fullTarget` is a conditional checker obligation, not an established theorem. The projected ordinary nodes expose the same supports and demands to `MixedCaseTrimCandidate`; this relies on that candidate's signed residual semantics. The emitted `externalBounds` is a named disclosure, not a proof or an automatic discharge of `fullTarget`.

The emitted Lean file has **not been compiled** or checked at full scale. No proof of the external bounds, full bank, archive provenance, renewal/extension, or final upper bound is asserted. The Python checks and transcription tests are regression evidence only. No external soundness theorem or full-bank induction is asserted by this producer. Consumers must separately compile, prove the required soundness/assumptions, and discharge the checker obligations.
