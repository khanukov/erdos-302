# Literal-ledger / analytic bridge candidate (2026-11-02)

`lean/ArchiveLedgerSumBridge.lean` connects the *generated Lean literals* and
`SumBridge.global_upper_archive` at the type level. `entriesFrom` enumerates
cell occurrences, carrying the preceding prime list; it does not deduplicate
cells. Heights, endpoints, prime sets and the error exponent are explicitly
defined from each entry. The indexed theorem concludes the literal rational
coefficient bound plus 55064831540, conditional on the hypotheses displayed in
its type. It imports the previously kernel-checked ledger arithmetic; a prior
successful run does not verify this new module.

**Not an unconditional result.** The indexed theorem still assumes:

* positive endpoints and quotient ordering, primality of all prefix primes,
  density bounds and the exponent budget;
* `hgain`: exact equality of the real weighted ideal sum with N times the
  literal ledger fold's rational gain, including list-to-finset indexing,
  prefix product, casts, duplicate occurrences and fold algebra;
* `herror`: exact equality of the weighted analytic error sum to the ledger's
  natural-number fold;
* `hcover`: the independent global block/renewal accounting inequality.

In addition, deriving the cover requires sound profiles and corrections from
the archive's bank, extensions, recurrence and cell correspondence; Python
byte-transcription tests do not prove archive-to-Lean provenance. No
assumption above is proved merely by stating the indexed theorem or by a clean
axiom report. The workflow's optional full-candidate job builds and audits the
new module after building ArchiveLedger; it has not been run for this commit.
No local heavy Lean build was run. A successful future CI build is necessary to
establish even this conditional candidate's elaboration and axiom list.
