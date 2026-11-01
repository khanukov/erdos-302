# Prime support and parity projection

`Projection.lean` proves the mathematical projection in archive `baseline/PROOF.md:93–103`:

* `prime_shared` proves all three orientations of the prime-divisor assertion directly from `bc=a(b+c)`; no positivity or ordering is needed.
* `outside_smooth_even` combines that assertion with `UpperRenewal.reciprocal_at_most_one_odd` (archive line 98) and produces an even non-Q-smooth vertex from any edge with a non-smooth vertex. `Smooth Q n` says every prime divisor of n is in Q. For positive vertices this is the usual Q-smooth notion.
* `smooth_projection` instantiates `UpperRenewal.extension_projection` using T = the smooth elements of S and U = the even non-smooth elements of S. For every cover C of T it proves r ≤ |C|+|U|, given the source-cover lower bound r. This is the subtraction-free form of archive line 103. The source-cover bound is a hypothesis, not an established archive bank certificate.

Built against the existing `UpperRenewal.olean` and `UpperBridge.olean` in the Lean 4.33.0-rc1 lower-rebuild project using:

```
cd /root/erdos-302-independent-audit/lower-rebuild/project
LEAN_PATH=/root/erdos-302-independent-audit/upper-renewal:/root/erdos-302-independent-audit/upper-bank:$LEAN_PATH lake env lean --root=/root/erdos-302-independent-audit/upper-projection -o /root/erdos-302-independent-audit/upper-projection/Projection.olean /root/erdos-302-independent-audit/upper-projection/Projection.lean
```

All three printed axiom audits list only `propext`, `Classical.choice`, and `Quot.sound`, without `sorryAx`. No uploaded code was executed. The existing imported oleans were used, not rebuilt in this step.

Remaining gaps include computational correspondence with the archive smooth-support and extension data, verified bank source bounds, explicit extension enumeration and prefix deletion, renewal induction and table certification, smooth/rough counting and the global bound. This result alone does not establish the claimed extremal inequality.
