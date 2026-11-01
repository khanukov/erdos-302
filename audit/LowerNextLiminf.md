# Liminf endpoint

`LowerNextLiminf.lower` proves `5/8 + roughDensity commonL / 24 ≤ Filter.liminf normalizedF302 Filter.atTop`, where the existing `Erdos302StrongerEndpoint.normalizedF302 N` is `(f302 N : ℝ) / N`. The theorem uses `LowerNext.endpoint`, establishes the real sequence is eventually at most 1 (needed for the conditionally complete real liminf), and takes the supremal lower bound by order density. The value at N=0 is immaterial. `LowerNextLiminf.log_lower` supplies the explicit increment `1 / (43200 * Real.log commonL)` using `LowerNext.deltaLog_lt`. Neither theorem asserts the sharp endpoint is eventually attained pointwise.

Build, from `/root/erdos-302-independent-audit/bridge`, using Lean 4.33.0-rc1:

```bash
export LEAN_PATH="/root/erdos-302-independent-audit/bridge:$(< /root/erdos-302-independent-audit/explicit-rebuild/lean-path.txt)"
LEAN=/root/.elan/toolchains/leanprover--lean4---v4.33.0-rc1/bin/lean
"$LEAN" -o LowerNext.olean LowerNext.lean
set -o pipefail
"$LEAN" -o LowerNextLiminf.olean LowerNextLiminf.lean 2>&1 | tee LowerNextLiminf.log
```

Both compilations succeeded. The new module's `#print axioms` reports exactly `[propext, Classical.choice, Quot.sound]` for each theorem; there is no `sorry`, `admit`, or new axiom. SHA-256: source `dbaa64068a4c65154d152786684b8844c707ac5dd73a38a39f8554e0777232d1`; successful log `c2d6761cb74a493e6602dee4b9b7edd89ab285ef996c5dc9002d2d55c0574b17`. This checks the derivation from the existing rebuilt imports; their upstream dependency oleans were reused, not independently kernel-replayed here. See `../lower-next.md` and `../explicit-rebuild/RESULT.md` for that trust boundary.
