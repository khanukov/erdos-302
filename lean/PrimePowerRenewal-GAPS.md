# Scope and remaining integration gaps

`PrimePowerRenewal.sum_unroll` and `sum_update` are candidate one-level finite identities, subject to hosted Lean CI. They combine the bounded prime-power reindexing with the existing unroll theorem; they do not assume the identity. The inner cutoff is the local quotient, so the zero case has an empty inner range.

Still required:

* Iterate the identity through all 20 archive prime levels, with the correct previous-prime products, base case, corrections, and bounds; prove that the resulting index structure is the intended global ledger.
* Connect the archive bank and its verified profile data to the actual update functions and correction terms at each level; establish the needed certificates, not merely an abstract recurrence.
* Identify and count all 4,705 cells, prove their classification and multiplicities agree with the iterated ledger, and connect their certified bounds to the corresponding profiles.
* Discharge the coverage/aggregation hypotheses required by the global upper bound, including the link to local block demands; the present theorem alone does not prove the global result.
