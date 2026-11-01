# Smooth reciprocal renewal

`SmoothRenewal.lean` instantiates the copied generic `Renewal.lean` for finite edges `{a,b,c}` with `0<a<b<c` and `b*c=a*(b+c)`. `mul_inj` proves multiplication by a positive natural injective (and hence a bijection from any finite set onto its image); `triple_scale_iff` proves preservation and reflection of the ordered edge relation; `edge_image` supplies the forward finite-edge preservation required by `RenewalNext.demand_image`; `cover_pullback` and `demand_scaled` transport covers/demands.

`vertices Q n` is the positive interval `[1,n]` restricted to numbers all of whose prime divisors belong to Q. For prime p not in Q, `vertices_partition` and `vertices_disjoint` give the exact two blocks: `vertices Q n` and p times `vertices (insert p Q) (n/p)`. `demand_recurrence` proves their combined cover lower bound. No primality assumption on members of Q is needed. Partition equality actually does not require p ∉ Q, but disjointness and recurrence do. The n=0 case is included.

Gaps: the file does not explicitly package the image map as an `Equiv`, nor prove a general finite-edge image-reflection or two-way cover equivalence; it establishes the ordered-triple reflection and cover pullback needed for the lower-bound recurrence. It does not connect `Edge` to `UpperBridge.OrderedCover` or the rational reciprocal equation, instantiate `update_demand`, certify numerical tables, or derive 0.84123. Those require separate proofs.

Rebuild from `/root/erdos-302-independent-audit/lower-rebuild/project`:

```
export LEAN_PATH=/root/erdos-302-independent-audit/upper-smooth-renewal
lake env lean --root=$LEAN_PATH -o $LEAN_PATH/Renewal.olean $LEAN_PATH/Renewal.lean
lake env lean --root=$LEAN_PATH -o $LEAN_PATH/SmoothRenewal.olean $LEAN_PATH/SmoothRenewal.lean
```

Both compile in the existing Lean project. Printed axiom audits for the key theorems report only `propext`, `Classical.choice`, and `Quot.sound` (no `sorryAx`). The unused `hpQ` warning on partition is benign; it is necessary for disjointness, not the union equality.
