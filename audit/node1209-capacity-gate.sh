#!/usr/bin/env bash
# Run in the pinned project after the dependencies through MixedDag are built.
# All modules use one fresh build directory; no cross-run artifacts are imported.
set -euo pipefail
: "${GITHUB_WORKSPACE:?set repository root}"
: "${RUNNER_TEMP:?set runner temp}"
root="$GITHUB_WORKSPACE"
logdir="$RUNNER_TEMP/node1209-capacity-logs"
mkdir -p "$logdir"
python3 -B "$root/independent_bank/node1209_capacity.py" --check
python3 -B -m unittest discover -s "$root/independent_bank" -p test_node1209_capacity.py
if grep -nE '\b(sorry|admit|native_decide)\b' "$root"/lean/node1209-capacity/*.lean "$root"/lean/node1209-bridge/*.lean; then exit 1; fi
# Per-process virtual address-space cap, not a physical or aggregate memory cap.
# Raise only this limit for the Rows000 bad_alloc experiment.
ulimit -v 33554432
printf 'Lean RLIMIT_AS KiB: soft=%s hard=%s\n' "$(ulimit -Sv)" "$(ulimit -Hv)" | tee "$logdir/resource-limits.log"
export LEAN_NUM_THREADS=1 LEAN_STACK_SIZE_KB=262144
for ((b=0; b<64; b++)); do
  printf -v name 'Node1209Rows%03d' "$b"
  cp "$root/lean/node1209-pack-all/$name.lean" .
  timeout 1200s lean -o "$name.olean" "$name.lean" > "$logdir/$name.log" 2>&1
  names=()
  for ((i=b*8; i<b*8+8 && i<510; i++)); do names+=("$name.check$i" "$name.bound$i"); done
  python3 "$root/audit/mathlib-bridge-ci/check_axioms.py" "$logdir/$name.log" "${names[@]}"
done
cp "$root/lean/node1209-capacity/"*.lean .
timeout 1200s lean -o Node1209CapacityData.olean Node1209CapacityData.lean > "$logdir/Node1209CapacityData.log" 2>&1
for ((b=0; b<91; b++)); do
  printf -v name 'Node1209Capacity%03d' "$b"
  timeout 1200s lean -o "$name.olean" "$name.lean" > "$logdir/$name.log" 2>&1
  mapfile -t vertices < <(python3 -c 'import re,sys; print("\n".join(re.findall(r"theorem vertex(\d+) :", open(sys.argv[1]).read())))' "$name.lean")
  ((${#vertices[@]} > 0)) || exit 1
  names=("$name.capacity")
  for v in "${vertices[@]}"; do names+=("$name.vertex$v"); done
  python3 "$root/audit/mathlib-bridge-ci/check_axioms.py" "$logdir/$name.log" "${names[@]}"
done
timeout 1200s lean -o Node1209CapacityAll.olean Node1209CapacityAll.lean > "$logdir/Node1209CapacityAll.log" 2>&1
python3 "$root/audit/mathlib-bridge-ci/check_axioms.py" "$logdir/Node1209CapacityAll.log" Node1209CapacityAll.coverage Node1209CapacityAll.capacity
for name in Node1209CapacityBridge Node1209BridgeTests; do
  cp "$root/lean/node1209-bridge/$name.lean" .
  timeout 1200s lean -o "$name.olean" "$name.lean" > "$logdir/$name.log" 2>&1
done
python3 "$root/audit/mathlib-bridge-ci/check_axioms.py" "$logdir/Node1209CapacityBridge.log" Node1209CapacityBridge.load_eq_indexed Node1209CapacityBridge.valid_of_load Node1209CapacityBridge.node1209_valid
printf 'PASS: all 901 vertices, assembly, bridge and tests gated\n'
