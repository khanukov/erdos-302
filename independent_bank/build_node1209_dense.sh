#!/usr/bin/env bash
# Run in the Lean project with LEAN_PATH set; preserve and gate every report.
set -euo pipefail
: "${GITHUB_WORKSPACE:?}" "${RUNNER_TEMP:?}"
python3 "$GITHUB_WORKSPACE/independent_bank/node1209_small_chunks.py"
for f in Small??Part?.lean; do
  name=${f%.lean}
  printf 'Starting %s at %s\n' "$name" "$(date -u +%FT%TZ)"
  timeout --kill-after=30s 15m lean -o "$name.olean" "$f" 2>&1 | tee "$RUNNER_TEMP/$name.log"
  mapfile -t declarations < <(python3 -c 'import re,sys; print("\n".join("Node1209Small."+x for x in re.findall(r"^#print axioms (node[0-9]+)$",open(sys.argv[1]).read(),re.M)))' "$f")
  test "${#declarations[@]}" -eq 4
  python3 "$GITHUB_WORKSPACE/audit/mathlib-bridge-ci/check_axioms.py" "$RUNNER_TEMP/$name.log" "${declarations[@]}"
done
for f in Small??.lean; do timeout --kill-after=30s 15m lean -o "${f%.lean}.olean" "$f"; done
timeout --kill-after=30s 45m lean -o DenseData.olean DenseData.lean
count=0
for f in Dense??.lean; do
  name=${f%.lean}
  printf 'Starting %s at %s\n' "$name" "$(date -u +%FT%TZ)"
  timeout --kill-after=30s 45m lean -o "$name.olean" "$f" 2>&1 | tee "$RUNNER_TEMP/$name.log"
  mapfile -t declarations < <(python3 -c 'import re,sys; print("\n".join("Node1209Dense."+x for x in re.findall(r"^#print axioms (check[0-9]+)$",open(sys.argv[1]).read(),re.M)))' "$f")
  test "${#declarations[@]}" -eq 16
  python3 "$GITHUB_WORKSPACE/audit/mathlib-bridge-ci/check_axioms.py" "$RUNNER_TEMP/$name.log" "${declarations[@]}"
  count=$((count + ${#declarations[@]}))
done
test "$count" -eq 368
timeout --kill-after=30s 45m lean -o Dense.olean Dense.lean
