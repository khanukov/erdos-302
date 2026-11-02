# Literal endpoint premises candidate

`EndpointPremisesCandidate.lean` is **uncompiled** pending hosted CI. It proposes
kernel-reduction checks for the 4,705 generated cell endpoint pairs and the 21
literal prime prefixes, then derives positivity, strict endpoint order, quotient
order for every natural `N`, primality, density bounds and the exponent budget.
It uses `HGainCandidate.indexed_hgain` and the existing error-match theorem to
state `endpoint_of_cover` with only the weighted global cover as a hypothesis.
All of these new declarations and their tests remain candidates until the modified
`hgain-candidate.yml` workflow and its axiom gates pass at this exact commit.
The Python tests are independent sanity checks, not kernel proofs.

**Still unproved:** the weighted global cover for the intended extremal function;
this requires the independent block/renewal accounting and the sound profile,
correction, extension, recurrence, and cell correspondence chain. The generated
literal/archived-byte correspondence also remains outside Lean. If candidate
compilation or axiom gates fail, the endpoint input properties and gain bridge
are not discharged by this candidate. No unconditional endpoint is claimed.
