#!/usr/bin/env python3
"""Emit independently kernel-checked vertex files and bounded batch proofs.

The Python support parser chooses proof candidates only: the final Lean theorem
uses the original support and fails if any candidate was omitted or incorrect.
"""
import argparse
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--out', type=Path, required=True)
    args = ap.parse_args()
    text = (ROOT / 'lean/Pack1094.lean').read_text()
    match = re.search(r'def support : Finset ℕ := \{([^}]*)\}', text)
    if not match:
        raise SystemExit('support declaration not found')
    vertices = [int(n.strip()) for n in match.group(1).split(',')]
    if len(set(vertices)) != len(vertices) or 2 not in vertices:
        raise SystemExit('duplicate support or missing previously proved vertex 2')
    remaining = [v for v in vertices if v != 2]
    batches = [remaining[i:i+8] for i in range(0, len(remaining), 8)]
    args.out.mkdir(parents=True, exist_ok=True)
    for v in remaining:
        (args.out / f'Pack1094Vertex{v}.lean').write_text(f'''import Pack1094
open Finset UpperBridge
open scoped BigOperators
namespace ArchivePack1094
set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
theorem capacity_vertex_{v} :
    (∑ i ∈ indices.filter (fun i => {v} ∈ T i), w i) ≤ 1000 := by
  decide
#print axioms capacity_vertex_{v}
end ArchivePack1094
''')
    for i, batch in enumerate(batches):
        imports = '\n'.join(f'import Pack1094Vertex{v}' for v in batch)
        cases = ' | '.join('rfl' for _ in batch)
        proofs = '\n'.join(f'  · exact capacity_vertex_{v}' for v in batch)
        (args.out / f'Pack1094Batch{i:03}.lean').write_text(f'''{imports}
open Finset UpperBridge
open scoped BigOperators
namespace ArchivePack1094
set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
theorem capacity_batch_{i:03} (x : ℕ) (hx : x ∈ ({{{', '.join(map(str, batch))}}} : Finset ℕ)) :
    (∑ j ∈ indices.filter (fun j => x ∈ T j), w j) ≤ 1000 := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with {cases}
{proofs}
#print axioms capacity_batch_{i:03}
end ArchivePack1094
''')
    imports = '\n'.join(f'import Pack1094Batch{i:03}' for i in range(len(batches)))
    cases = ' | '.join('rfl' for _ in vertices)
    proofs = []
    for v in vertices:
        if v == 2:
            proofs.append('  · exact capacity_vertex_two')
        else:
            i = remaining.index(v) // 8
            proofs.append(f'  · exact capacity_batch_{i:03} {v} (by decide)')
    (args.out / 'Pack1094AllCapacities.lean').write_text(f'''import Pack1094Shard
{imports}
open Finset UpperBridge
open scoped BigOperators
namespace ArchivePack1094
set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
theorem all_capacities : ∀ x ∈ support,
    (∑ i ∈ indices.filter (fun i => x ∈ T i), w i) ≤ 1000 := by
  intro x hx
  simp only [support, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with {cases}
{chr(10).join(proofs)}
#print axioms all_capacities
end ArchivePack1094
''')
    (args.out / 'batches.txt').write_text('\n'.join(' '.join(map(str, b)) for b in batches) + '\n')
    print(f'{len(vertices)} support vertices; {len(batches)} batches, plus existing vertex 2')

if __name__ == '__main__': main()
