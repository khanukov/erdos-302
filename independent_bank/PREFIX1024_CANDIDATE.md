# Actual mixed prefix 1024 candidate

`prefix1024_shards.py` regenerates the literal nodes 0–1023 from the SHA-256-pinned compressed bank via the existing mixed prefix exporter and producer. It emits 64 bounded check modules, each with 16 closed checks, and an aggregate which chains all segments from zero and applies `MixedCaseTrimCandidate.sound`. There is no assumed prefix. The 768 new nodes 256–1023 are all `basic`; each has a separate `by decide` check. Nodes at and beyond 1024 use the explicit default.

The dispatch-only `actual-prefix1024-representative.yml` regenerates and byte-compares all files, runs structural and mutation tests, and compiles the common literal data plus checks 256–271 and their standalone segment. It gates the axioms of all 16 checks and the segment. It does **not** compile the remaining checks or the aggregate; those remain unverified candidates until separately built and axiom-gated. The prior prefix-256 CI success applies to its original source SHA, not these newly generated modules.

The Lean checks concern generated literals. Correspondence to pinned archive bytes is a Python regeneration check, not a Lean theorem. This is neither full-bank replay nor the final mathematical result.
