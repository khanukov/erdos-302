# Prefix-to-cell integration candidate

`PrefixArchiveBridge.upper_from_prefix` derives the finite real upper bound with the
weighted ideal and error sums, from local prefix demands and cell allocation;
it does not assume the former global `hcover`. It is generic in the cell index;
20 levels plus correction rows can be represented by a finite index such as
`Fin 20 ⊕ C`, with one element per row. This is not itself a specialization to
archived rows, and there is no 20-level renewal expansion theorem here.

Exact remaining inputs: `A` lies in `[1,N]` and is triple-free; every `q` in
`s` is Q-rough and its actual smooth prefix has graph demand `r q`; each cell
has nonnegative real height, positive endpoints and ordered floor endpoints;
its prime set consists of primes, has density in [0,1], and satisfies the
stated power-of-two error budget. `hcount` asserts each analytic rough cell
count equals the count of its member predicate on the common support `s`.
`hallocate` asserts the *sum*, counting overlapping cells with multiplicity,
of their real heights at every `q ∈ s` is at most `r q`. Consequently neither
an arbitrary collection of separately valid demand bounds nor independent
per-level inequalities suffices: their sum must be justified jointly.

Still needed: identify Q-rough support and each of the actual archive's 20
levels and correction cells with these indices, prove all `hcount` equalities,
prove `hallocate` from the certified profiles and iterated renewal (the existing
PrimePowerRenewal theorem is only one-level), certify the base and all
correction heights and archive-to-Lean correspondence, instantiate and check
all analytic hypotheses and exact coefficient/error arithmetic, and discharge
all remaining hypotheses to obtain an unconditional endpoint. No archive-data
identity, full recurrence or numerical endpoint is claimed here.

Compilation and axiom-gate results for this candidate are pending hosted CI.
No local Lean execution or remote writes were performed.
