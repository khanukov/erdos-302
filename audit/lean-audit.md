# Independent Lean audit of boundary certificates

## Verdict

The 119 generated finite propositions **compile and are axiom-free** with Lean 4.27.0 after replacing their single `import Mathlib` line with `import Std`. All other bytes of the source are unchanged. This is a kernel check of the finite propositions, not an end-to-end proof of their relationship to Erdős 302, not a global upper bound, and not a solution of the exact problem. The original `import Mathlib` variant could not be compiled here because the local Mathlib build objects are absent; no network or installation was attempted.

The uploaded artifact expressly claims no new global coefficient. Its Python replay reports the inherited upper bound `limsup f302(N)/N ≤ 0.841230807050`, dependent on the baseline's smooth-profile input; **this audit did not verify that global chain in Lean**. The earlier `/root/erdos302-explicit-lower` development is a different, lower-bound direction: its `POSITIVE_RESULT.md` claims a kernel-checked eventual lower bound at `5/8 + 1/(86400*commonL)`, and `stronger-endpoint/RESULT.md` claims the slightly stronger denominator `commonL-1`, with the latter described there as awaiting new independent hostile review. These are claims of that worktree, not independently rebuilt in this audit, and neither supplies a matching upper bound or exact density. Historical files such as `final-gap-audit/AUDIT.md`, `final-threshold-candidate/RESULT.md`, and parts of `STATE.md` describe earlier incomplete stages; do not read them as the final status without chronology.

## Verified finite build

Original `/root/erdos-302-independent-audit/source/erdos302_boundary_certificates/lean/BoundaryCertificates.lean` SHA-256 `3fd44e7980ca776d19abffd7d1bdaf30a1dc6456af7c9a4afd5fc457dcc2a494`; copied Std-import variant SHA-256 `9da7eb4e229ef3363f6a8fbc62296d9f2bd80c7ca4698b37b95708e7d1278719`. String comparison verified the only difference is the first import. The copied file's original comment saying it has not been compiled is historical, not the current audit status.

The file has exactly 12 `edges_*`, 84 `cell_*`, and 23 `inequality_*` theorems and 119 distinct corresponding `#print axioms` commands. Every report says `does not depend on any axioms`; there are no `sorryAx`, native-evaluation axioms, or custom axioms in those transitive reports. A lexical scan outside comments found no `sorry`, `admit`, `axiom`, or `native_decide` tokens. The proofs use `decide +kernel`. These facts establish the exact Lean proposition statements, not independent provenance of JSON-to-Lean conversion or the missing semantic bridge.

Commands and results (existing worktrees were not modified):

```bash
cd /root/erdos-302-independent-audit/source/erdos302_boundary_certificates
python3 -I -S -B -O generate_lean.py --check
# exit 0: GENERATED_119_FINITE_DECLARATIONS; compilation has not been performed
sha256sum lean/BoundaryCertificates.lean
# 3fd44e7980ca776d19abffd7d1bdaf30a1dc6456af7c9a4afd5fc457dcc2a494

mkdir -p /root/erdos-302-independent-audit/lean-audit
cp lean/BoundaryCertificates.lean /root/erdos-302-independent-audit/lean-audit/BoundaryCertificates.lean
python3 - <<'PY'
from pathlib import Path
p = Path('/root/erdos-302-independent-audit/lean-audit')
s = (p/'BoundaryCertificates.lean').read_text()
assert s.startswith('import Mathlib\n')
(p/'BoundaryCertificatesStd.lean').write_text(s.replace('import Mathlib\n', 'import Std\n', 1))
PY
cd /root
/usr/bin/time -f 'elapsed=%e maxrss_kb=%M exit=%x' timeout 240s \
  lean +leanprover/lean4:v4.27.0 -j 1 \
  --root=/root/erdos-302-independent-audit/lean-audit \
  -o /root/erdos-302-independent-audit/lean-audit/BoundaryCertificatesStd.olean \
  /root/erdos-302-independent-audit/lean-audit/BoundaryCertificatesStd.lean \
  > /root/erdos-302-independent-audit/lean-audit/compile-std.log 2>&1
# exit 0; elapsed=28.25; maxrss_kb=2659824; 119 no-axiom reports
```

Lean version: `4.27.0`, commit `db93fe1608548721853390a10cd40580fe7d22ae`. Exact 119-to-119 name match and report check:

```bash
python3 - <<'PY'
import re
from pathlib import Path
p=Path('/root/erdos-302-independent-audit/lean-audit')
a=(p/'BoundaryCertificates.lean').read_text()
b=(p/'BoundaryCertificatesStd.lean').read_text()
assert a.replace('import Mathlib\n','import Std\n',1)==b
names=re.findall(r'^theorem\s+(\w+)', a, re.M)
reports=re.findall(r"^'Erdos302BoundaryV1\.([^']+)' (.*)$", (p/'compile-std.log').read_text(), re.M)
assert len(names)==len(reports)==119 and set(names)=={n for n,_ in reports}
assert all(msg=='does not depend on any axioms' for _,msg in reports)
print('119 matching axiom-free declarations; only import changed')
PY
```

The unchanged original import was also tried with `cd /root/erdos302 && timeout 240s lake env lean -j 1 --root=/root/erdos-302-independent-audit/lean-audit -o /root/erdos-302-independent-audit/lean-audit/BoundaryCertificates.olean /root/erdos-302-independent-audit/lean-audit/BoundaryCertificates.lean`; it exited 1 at line 1, `unknown module prefix 'Mathlib'`. The `/root/erdos302` toolchain is v4.27.0 and its Mathlib checkout is `a3a10db0e9d66acbebf76c5e6a135066525ac900`, but its built `Mathlib.olean` and build tree were absent. Repeating in `/root/erdos302/lower-lean`, Lean v4.33.0-rc1 and Mathlib `da1f94df976c7cd38117281c57d6ee3046c8d104`, likewise exited 1 for missing Mathlib objects. Logs `compile.log` and `compile-433.log` preserve both failures. Neither failure is evidence that the original propositions are false; the successful Std variant verifies their unchanged bodies under the older local toolchain.

## Exact interface gap and route

1. The edge propositions check arithmetic identities such as `b*c = a*(b+c)` and order; the Boolean-cell and inequality propositions assume cover constraints over indexed bits. Neither by itself proves that an actual triple-free subset of positive denominators induces those constraints. Formalize a positive, injective support embedding, its deletion bits, and the conversion from these integer identities to the reciprocal equation and the definition `Erdos302Lower.NoUnitFractionTriple` (or a proved equivalent upper-bound definition). Show all enumerated edges are present and each cover hypothesis follows; establish correct interpretation of deletion/cardinality.
2. Package all boundary states, including impossible ones, into a sound table theorem. Prove the weighted combination respecting nonnegative multipliers, signed boundary coefficients, total defined AND gates, cancellation, and cardinality rounding. The concrete generated inequalities are independently decided, but their intended connection to a reusable table and to actual sets remains to be formalized. Formalize/check mapping from emitted indices and tables to the input support; kernel truth of generated formulas alone does not certify generator semantics or completeness of an edge list.
3. For a *global* statement, formally connect these local constraints to a sound global packing/profile or renewal argument and its asymptotic transfer, including any smooth-profile input and its hypotheses, and kernel-check the actual target theorem and transitive axioms. The supplied 11 cardinal consequences reproduce the existing profiles according to the artifact; any better constant requires a genuinely new validated global certificate, not subtraction of local savings. For an *exact* solution, a matching lower and upper bound and the necessary limit/endpoint justification are additionally required.

## Limits

No complete from-source rebuild of the preexisting 62-source lower-bound overlay was attempted; its local pinned Mathlib compiled objects were missing. Its checked-in logs and documentation are evidence of authors' earlier results, not a substitute for this audit's own kernel replay. No independently checked global theorem is asserted here, and no user worktree or uploaded source was intentionally modified. Offline-only scope excludes any claim about subsequent literature or publication status.
