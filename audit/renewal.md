# Renewal kernel: scope and integration

`Renewal.lean` builds with Lean 4.33 using the existing `lower-rebuild/project` Mathlib environment. No uploaded code is executed. It is a generic kernel development, not the archive's all-N bound.

* `Cover E S C` means every finite hyperedge `e` satisfying `E e` and contained in `S` meets `C`; covers need not be subsets of S. `Demand E S r` measures `|C ∩ S|`. It supports arbitrary graph/hypergraph edge predicates.
* `demand_mono` handles prefix inclusion, `demand_disjoint` sums demands on disjoint blocks even with cross edges, and `demand_image` transports demand under an injective edge-preserving map. `disjoint_scaled` proves the exact disjointness from the condition that p divides no old-block element.
* `update` defines the archive maximum, with U(0)=0 and `update_pos` the intended recurrence whenever p>1. Its strong recursion is noncomputable (it is a specification, not executable archive-table replay). `update_demand` derives the graph-cover bound by induction on n, assuming previous-level demand, inclusion/disjointness, scaled-demand transport, and old/seed bounds. `demand_image` can discharge scaling once reciprocal edges are shown invariant under positive dilation. The theorem is one level; apply by induction on j to obtain a multilevel result after establishing its hypotheses.
* `correction_identity` proves fresh subtraction reconstructs U(n), for positive n and p>1. At n=0 a separate condition on parent(0) is required. `tail` agrees with a supplied table up to X and uses parent(n)+tail(n/p) above X. `tail_sound` proves its numeric soundness given finite-table soundness and the target recurrence. It does not claim the raw max update equals the zero-correction tail above X.

Missing for the stated global claim: instantiate E with the actual reciprocal-edge graph and connect its covers to `UpperBridge.OrderedCover`; prove the smooth prefix decomposition and p-not-dividing-old-block for the chosen distinct primes (including positivity and n/p bounds); prove edge dilation and use `demand_image`; obtain all old-profile and seed certificates; explicitly assemble induction over levels, and instantiate `tail_sound` (or prove a graph-specific tail analogue). Also missing are kernel verification of archive data/tables, finite correction support/renewal reindexing, rough-factor counting, exact rational ledger, and the extremal and limsup bounds. No claim of end-to-end archive verification is made.

Build/check, from `/root/erdos-302-independent-audit/lower-rebuild/project`:

```
lake env lean /root/erdos-302-independent-audit/upper-renewal-next/Renewal.lean
```

The printed axioms must be standard only (`propext`, `Classical.choice`, `Quot.sound`); no `sorry` or `native_decide` is used.
