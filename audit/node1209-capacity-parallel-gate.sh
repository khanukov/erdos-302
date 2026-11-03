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
# 32 GiB virtual address space gives margin over a prior ~24 GiB VmPeak;
# this is not a physical-memory reservation or aggregate OOM protection.
ulimit -v 33554432
printf 'Lean RLIMIT_AS KiB: soft=%s hard=%s\n' "$(ulimit -Sv)" "$(ulimit -Hv)" | tee "$logdir/resource-limits.log"
export LEAN_NUM_THREADS=1 LEAN_STACK_SIZE_KB=262144
cp "$root/lean/node1209-pack-all/"*.lean .
python3 -B "$root/audit/node1209_parallel.py" rows "$logdir"
cp "$root/lean/node1209-capacity/"*.lean .
timeout 1200s lean -o Node1209CapacityData.olean Node1209CapacityData.lean > "$logdir/Node1209CapacityData.log" 2>&1
python3 -B "$root/audit/node1209_parallel.py" capacity "$logdir"
timeout 1200s lean -o Node1209CapacityAll.olean Node1209CapacityAll.lean > "$logdir/Node1209CapacityAll.log" 2>&1
python3 "$root/audit/mathlib-bridge-ci/check_axioms.py" "$logdir/Node1209CapacityAll.log" Node1209CapacityAll.coverage Node1209CapacityAll.capacity
for name in Node1209CapacityBridge Node1209BridgeTests; do
  cp "$root/lean/node1209-bridge/$name.lean" .
  timeout 1200s lean -o "$name.olean" "$name.lean" > "$logdir/$name.log" 2>&1
done
python3 "$root/audit/mathlib-bridge-ci/check_axioms.py" "$logdir/Node1209CapacityBridge.log" Node1209CapacityBridge.load_eq_indexed Node1209CapacityBridge.valid_of_load Node1209CapacityBridge.node1209_valid
printf 'PASS: all 901 vertices, assembly, bridge and tests gated\n'
