# Literal-ledger / analytic bridge candidate (2026-11-02)

`lean/ArchiveLedgerSumBridge.lean` connects the *generated Lean literals* and
`SumBridge.global_upper_archive` at the type level. `entriesFrom` enumerates
cell occurrences, carrying the preceding prime list; it does not deduplicate
cells. Heights, endpoints, prime sets and the error exponent are explicitly
defined from each entry. The indexed theorem concludes the literal rational
coefficient bound plus 55064831540, conditional on the hypotheses displayed in
its type. It imports the previously kernel-checked ledger arithmetic. Hosted
run [41391420681](https://github.com/khanukov/erdos-302/actions/runs/41391420681)
at `686383574a06581ddcd85ab9c32e52fb8eba76b1` compiled this module and passed
four axiom reports with `propext`, `Classical.choice`, and `Quot.sound`.
Mathlib cache objects were reused.

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
axiom report. The successful workflow establishes the conditional declarations
at the SHA above, not the missing premises or a proof for later changes.
