# Small literal joint-independence instance

Run `python3 audit/joint_concrete_check.py` from the repository root. This is a
standalone Python computational check, not a Lean proof and not a claim about
archive contents or transcription provenance. It hashes and reads the same
literal Lean source bytes, checks the 20 level order and all 4705 occurrences,
and evaluates every multiplicity according to the formula in
`SuffixBijectionCandidate.multiplicity`. Its trusted boundary includes Python,
the parser, and the correspondence between that formula and the Lean
semantics. Source hashes detect changes, not authorship.

The smallest positive-weight instance found by exhaustive checking of all
`1 <= N <= 6` and their rough supports is `N=6`, `q=1`. The only contributing
occurrence is level 1, cell 0, `(a,b,height)=(6,24,1)`, with factor `t=1`.
The smooth vertex set is `{1,2,3,4,5,6}`; its only edge is `{2,3,6}`;
independent subsets have maximum cardinality 5. Thus the checked numeric
condition is `5 + 1 <= 6`. Every support at those N is `{1}`. The exhaustive
calculation also checks that all weights are zero at smaller positive N.

This matches the *hypothesis* of `literal_hcover_of_joint_independence` at
`N=6` under the manual semantic correspondence above; the theorem then gives
its stated hcover conclusion for each A satisfying its stated assumptions.
No machine-checked bridge from the Python result to that hypothesis is supplied,
and no Lean theorem is asserted to have been newly discharged. No conclusion
for larger N or asymptotic endpoint follows.
