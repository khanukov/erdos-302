# Independent mathematical and certificate-semantics audit

## Scope and verdict

Audited the original untrusted files in `source/erdos302_boundary_certificates/`, particularly `paper/BOUNDARY_CERTIFICATES_NOTE.md`, `certificate.json`, `verify_boundary.py`, and `lean/BoundaryCertificates.lean`. No archive code was executed. A separately written Python standard-library program independently enumerated arithmetic triples, covers, boundary minima and induced-subset ranks. Its scratch path is `/root/.hermes/cache/scratch/math302_audit.py` (scratch files may expire); SHA-256 `80cbb4fa3835e8d77f84a50edd9c23fbf436e283c3d119f55d88f69339f067d7`. The computation completed successfully.

**Outcome:** No false mathematical claim or counterexample was found in the local claims tested. The eight-vertex example and all nine supplied relaxation witnesses check out independently; the all-p family has the elementary symbolic proof below. This is not a verification of the inherited numerical global bound, its upstream theorem, baseline computational replay, or a Lean proof. One definite *arbitrary-input certificate status* weakness follows directly from static inspection: an empty certificate can receive the unconditional success status, explained below. It does not invalidate the particular nonempty certificate tested.

Evidence file hashes: `certificate.json` SHA-256 `c2b97a339988fb8794aee9cd7b8f4800a110c29bf79804f7faba3774aa8fd077`; note SHA-256 `615e20131a287f67e7fd166c047ab525cd8ee7ffce471aa62e4ac0e2d8da978c`.

## Exact eight-vertex calculation

Let S=(12,15,20,21,28,30,60,70), B=(21,30,70), I=S\\B. Direct enumeration of all 56 ordered-by-size 3-subsets using `bc=a(b+c)` returns exactly:

```
(12,15,60) (12,20,30) (12,21,28) (15,20,60)
(20,28,70) (20,30,60) (21,30,70)
```

Among all 256 Boolean assignments there are 132 covers. With state bits in the order (21,30,70), least-significant bit first, exhaustive minima and actual attaining covers are:

| state number | selected B | kappa | attaining cover |
|---:|---|---:|---|
|0|empty|infinity|none|
|1|21|2|{12,20,21}|
|2|30|2|{12,20,30}|
|3|21,30|2|{12,20,21,30}|
|4|70|2|{12,20,70}|
|5|21,70|2|{12,20,21,70}|
|6|30,70|2|{12,15,30,70}|
|7|21,30,70|1|{15,21,30,70}|

The empty state is impossible because B itself is an edge. The two interior-only edges have intersection {15,60}, hence at least one interior vertex is required, and a single interior vertex must be 15 or 60. In that case the three edges (12,20,30), (12,21,28), (20,28,70) force 30,21,70 respectively. This independently proves 2|C∩I|+|C∩B|≥5; extra edges only strengthen it. The table and witnesses additionally prove sharpness for each boundary state.

For x=(1/2,1/2,1/2,1/2,0,1/2,0,1/2), indexed by S above, independent direct enumeration of covers of H(U), separately for every one of 256 subsets U, gave sum_U x≥tau(H(U)) in every case. Its weighted objective is 2·(3/2)+3/2=9/2<5, so it is a genuine separation from the cube plus **all local subset-rank inequalities**. It does not imply global improvement or independence from arbitrary integer reasoning. Equivalence with minimizing |C∩U| over S-covers holds by restriction and extension by S\\U.

## Other finite data and semantic checks

The independent program enumerated full arithmetic induced edge sets and all cover assignments for all 12 supplied tables, compared edge sets without trusting certificate ordering, checked every exact state minimum, and decoded each supplied attaining witness. Cost vectors in certificate state order:

```
t0,t1,t3,t4,t5,t6,t7,t8,family_p4: [None,2,2,2,2,2,2,1]
t2:          [4,2,2,2]
potential_A: [2,1,1,1]
potential_B: [1,1,1,0]
```

It also checked all 12 base inequalities directly against every actual cover, interpreting gate `both_removed` as the Boolean AND of membership of 4 and 12. All nine fractional examples were independently checked against the ranks of every induced subset: 512 constraints for each nine-vertex example, 256 for the eight-vertex one (4352 total). The exceptional weighted_2 objective is 7/2<4; the other eight are 9/2<5. The independent computation used combinations of actual vertices for the cover minimization, not the archive's cover-intersection method.

The potential cancellation in note lines 136–165 is valid: A and J are disjoint charged sets; both inequalities use the same actual Boolean state z=x4*x12, and the coefficients of z cancel. Merely overlapping read-only boundaries does not itself create duplicate charges. The stated capacity/ceiling rule is valid when all row coefficients are nonnegative and at most a positive D and all participating x are Boolean.

## Universal parametric family: algebra, not finite extrapolation

For integer p≥4 the nine expressions in note lines 104–108 satisfy a<b<c<d<e<f<g<h<i. Indeed c<d is p+1<p(p−1), f<g is 2<p−1, and the remaining comparisons are immediate from positive factors, including g<h<i. Hence all vertices are positive and distinct. The six reciprocal equalities can be checked symbolically using these exact differences:

```
1/a − 1/b = 1/[2p(p−1)] = 1/d
1/b − 1/c = 1/[2p(p+1)] = 1/f
1/d − 1/e = 1/[2p²(p−1)] = 1/h
1/d − 1/f = 1/[p(p²−1)] = 1/g
1/e − 1/f = 1/[2p²(p+1)] = 1/i
1/g − 1/h = 1/[2p²(p+1)] = 1/i
```

All denominators are nonzero, so these are polynomial identities valid for every p≥4, and imply the six claimed reciprocal edges. A separate numeric check passed for every integer p from 4 through 1000; this regression is not the universal proof.

The boundary edge yields s≥1; the first two edges imply r≥1. If r=1, the unique selected interior vertex must be b, because {a,b,d}∩{b,c,f}={b}. Then {d,e,h}, {d,f,g}, and {e,f,i} force h,g,i. Thus 2r+s≥5. If r≥2 the same bound follows from s≥1. Positive rational dilation with integral images preserves distinctness and the homogeneous reciprocal equation. The p=4 certificate uses the undilated displayed formulas divided by 2; the dilation is legitimate. No assertion about exact induced tables for every p follows.

## Finding: success status is not a completeness guarantee

`verify_boundary.py:85–96` requires fixed root fields and a baseline-claim hash; `:97–111`, `:155–155`, `:180–180`, and `:222–222` iterate data sections but do not require nonempty lists or specific IDs/counts. `:251–262` likewise checks only rows actually present. The returned status at `:267–276` is unconditionally `BOUNDARY_TABLES_AND_WEIGHTED_CUTS_EXACTLY_VERIFIED` if control reaches it.

Concrete counterexample by static control-flow proof: take the actual baseline object unchanged and set `gates`, `tables`, `inequalities`, `derived`, and `strict_relaxation_examples` to empty lists, retaining schema and the correct `baseline/claim.json`. Every relevant loop is empty; no minimum or table access is performed; the function returns that same success status with zero counts. This is not a demonstrated execution of the archive; it follows directly from its source. It is a false positive **only if** a downstream consumer interprets status as proving the published collection is present, not if it checks exact expected content/counts and treats the status as applying to supplied rows only. No false row is thereby proved. Remediate with a frozen expected manifest, required IDs/counts and content hash or a distinctly named `VALIDATION_COMPLETED` status; add an empty-certificate negative test.

The baseline metadata `archive_sha256` is not checked by this validator (`:90–96` checks the claim hash only). A matching claim hash identifies bytes, not truth of the inherited theorem. The general table reasoning uses nonnegative interior coefficients and explicit gate dependence on boundary bits (`:161–174`), and derivation bookkeeping and capacity checks are present (`:180–213`); this static inspection is not a complete adversarial verifier audit.

## Formalization and global limitations

The generated Lean source expressly says it was not compiled and makes no limsup/f302 claim (`lean/BoundaryCertificates.lean:3–5`). Its finite cell declarations, e.g. `:174–212`, assert lower bounds/impossibility conditioned on explicit Boolean edge constraints; they do not by themselves state attainment, exact hypergraph edge completeness, universal p, or the global bound. No Lean compilation or axiom audit was performed here. Independently enumerating finite cases is not a substitute for a kernel-checked general bridge.

The note's global bound and claim of unchanged twenty renewal hashes and coefficient (`paper/BOUNDARY_CERTIFICATES_NOTE.md:167–185`) depend on the separate baseline and upstream mathematical input. Neither was independently rederived or replayed in this audit. In particular, local weighted validity does not establish the inherited C, a new global bound, a safe subtraction from C, or the global density result. No historical novelty investigation or independent examination of the asserted mutation-test results was attempted.
