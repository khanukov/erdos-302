# Result 4: incremental upstream chain compilation

Continues RESULT3 using its cached Mathlib and built upstream modules; no archive code was executed. This is not a fresh independent rebuild, complete chain closure, or proof of the global 0.84123 bound.

Three additional sequential upstream modules compiled successfully with `lake env lean -j 1 -o ...` and nonempty `.olean` outputs:

| Module (prefix Erdos302ReflectiveChainData, suffix FC) | Time (s) | Artifact bytes | Result |
|---|---:|---:|---|
| 13 | 272.33 | 724104 | exit 0 |
| 12 | 43.32 | 712696 | exit 0 |
| 11 | 431.66 | 704520 | exit 0 |

Combined with RESULT3's 18 evidenced compiled modules, this is 21 evidenced modules out of its 235-module static local import DAG; closure has not been recomputed or established. Remaining modules and the global bound are unproved. Unique logs: `result4-141830-data{13,12,11}.log`.

Independent importing axiom checks in `project/lean/AxiomChainResult4{_12,_11}_141830.lean` exited zero; logs `axioms-result4-141830.log`, `axioms-result4-12-141830.log`, and `axioms-result4-11-141830.log` report each corresponding `Erdos302ReflectiveChain.check_13`, `check_12`, `check_11` depends on `[propext]`, its corresponding `I_13_end`, `I_12_end`, `I_11_end` depends on no axioms, and `Erdos302Reflective.levelCheck_sound` depends on `[propext, Classical.choice, Quot.sound]`. These checks establish only these particular level statements and the imported general soundness theorem, not the whole chain.

Each module ran with an explicit 900-second deadline, one Lean thread, a separate process session, 0.25-second free-space polling, and TERM then KILL of its process group after completion or interruption. The stop threshold was 3,758,096,384 bytes (3.5 GiB), above the requested 3.25 GiB floor. The threshold is best effort: concurrent writers and polling intervals prevent a hard floor guarantee. Final free space was 4,669,517,824 bytes. No Data11–13 build process remained at the final check. Another Lean workload was observed during this work, but the three builds completed; no contention stop was necessary. Builds were stopped after these three successes; Data10 and downstream modules were not attempted here. Scripts `run-result4-141830.py` and `run-result4-141830-data{12,11}.py` use exclusive log creation and refuse to overwrite an existing target artifact; they are one-shot, not general resume scripts.
