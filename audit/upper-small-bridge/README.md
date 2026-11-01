# SmallStd–UpperBridge universal bridge

Lean: `leanprover/lean4:v4.33.0-rc1`, using the existing mathlib project at `../lower-rebuild/project`. The local copies of Checker.lean, Sound.lean and UpperBridge.lean are rebuilt from source; no Lean 4.27 oleans are imported.

`SmallStd.cover_lower` proves that, for any literal support list `v`, edge list `es`, bound `r`, and finite set `S`, `Checked v es r`, `v.Nodup`, and `OrderedCover v.toFinset S` imply `r ≤ S.card`. No complete edge enumeration is needed. `SmallStd.finite_card_bound` derives the corresponding triple-free finite cardinal bound. Nodup for concrete literals can be discharged with `by decide`. `Test.lean` checks the whole chain on `[6,10,15]`.

Rebuild from the existing project (replace D if moved):

```sh
cd /root/erdos-302-independent-audit/lower-rebuild/project
D=/root/erdos-302-independent-audit/upper-small-bridge
export LEAN_PATH="$D:$(lake env printenv LEAN_PATH)"
for m in Checker Sound UpperBridge Bridge; do
  lake env lean -R "$D" -o "$D/$m.olean" "$D/$m.lean" || exit 1
done
lake env lean -R "$D" "$D/Test.lean"
```

The printed axioms for the universal bridge and test are `propext`, `Classical.choice`, `Quot.sound`. This establishes the generic bridge; it does not rebuild or apply all 1420 certificates or prove their source/archive correspondence.
