#!/usr/bin/env python3
"""Regenerate first extension literals from the authenticated archive.

The conditional Python bank interpreter does not establish a Lean bound or a
kernel proof of archive correspondence. Never execute archive code.
"""
from pathlib import Path
import sys
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'independent_bank'))
from bank_interpreter import edges
from seed_reconstruction import load_inputs, ranks, extensions
from verify_bank import verify

def validate(s, t, u, k):
    def ordered(xs):
        return type(xs) in (list, tuple) and all(type(x) is int and x > 0 for x in xs) and list(xs) == sorted(set(xs))
    if not all(ordered(x) for x in (s,t,u)) or type(k) is not int or k <= len(u):
        raise ValueError('malformed support or demand')
    S,T,U = set(s),set(t),set(u)
    if not T <= S or not U <= S-T or any(not set(e)<=T and set(e).isdisjoint(U) for e in edges(s)):
        raise ValueError('invalid boundary')

def literal(xs):
    chunks = [', '.join(map(str, xs[i:i+12])) for i in range(0,len(xs),12)]
    return '{' + ',\n   '.join(chunks) + '}'

def generate():
    bank, intervals, rows, _ = load_inputs(ROOT/'input/erdos302_boundary_certificates_publication.zip')
    results = verify(bank, intervals)
    ext = extensions(rows, results)
    if len(ext) != 515 or rows[0]['source_node'] != 1209 or rows[0]['prime_level'] != 15:
        raise ValueError('archive origin')
    s,k = results[1209]; t,r = ext[0]; u = rows[0]['delete']
    validate(s,t,u,k)
    if (len(s),len(t),k,r) != (901,837,258,242):
        raise ValueError('unexpected witness dimensions')
    return '''import ExtensionSeedCandidate

/-! Generated from authenticated inputs by audit/extension-ci/first_archive.py.
This literal is not itself a kernel proof of archive correspondence. -/
namespace ExtensionFirstArchive
open Finset ExtensionSeedCandidate

set_option maxRecDepth 100000 in
def source : Finset ℕ :=
  ''' + literal(s) + '''

set_option maxRecDepth 100000 in
def target : Finset ℕ :=
  ''' + literal(t) + '''

def firstDelete : Finset ℕ :=
  ''' + literal(u) + '''

-- Deliberately a finite-resource diagnostic; not yet known to finish.
set_option maxRecDepth 100000 in
set_option maxHeartbeats 100000000 in
 theorem checked_pair_boundary : PairBoundary source target firstDelete := by
  decide

theorem checked_boundary : Boundary source target firstDelete :=
  pair_boundary_sound checked_pair_boundary

/-- Still conditional on the genuine source node's 258 demand. -/
theorem source_to_seed (hb : Extended.Bound source 258) :
    Extended.Bound target 242 :=
  by
    have h := seed hb checked_boundary (Finset.Subset.rfl : target ⊆ target)
    simpa [firstDelete] using h

/-- Prefix restriction is also conditional only on that same source bound. -/
theorem projected_seed (P : Finset ℕ) (hp : P ⊆ target)
    (hb : Extended.Bound source 258) :
    Extended.Bound P (242 - (target \\ P).card) :=
  BankProfile.restrict_bound hp (source_to_seed hb)

#print axioms checked_pair_boundary
#print axioms checked_boundary
#print axioms source_to_seed
#print axioms projected_seed
end ExtensionFirstArchive
'''

def check_bytes(actual, expected):
    if actual != expected:
        raise ValueError('generated artifact mismatch')

def shard_intervals():
    return [(i, min(i + 100, 1901)) for i in range(0, 1901, 100)]


def generate_shards():
    # The data prefix is obtained from exactly the same authenticated generator,
    # including the archive row's deletion literal.
    old = generate()
    data = old.split('-- Deliberately a finite-resource diagnostic;', 1)[0]
    data += 'end ExtensionFirstArchive\n'
    result = {'ExtensionBoundaryData': data}
    intervals = shard_intervals()
    for i, (lo, hi) in enumerate(intervals):
        name = f'ExtensionBoundaryShard{i:02}'
        result[name] = f'''import ExtensionBoundaryData

namespace ExtensionFirstArchive
open Finset ExtensionSeedCandidate

set_option maxRecDepth 100000 in
set_option maxHeartbeats 100000000 in
 theorem shard{i:02} : ∀ b ∈ source.filter (fun x => {lo} ≤ x ∧ x < {hi}),
    ∀ c ∈ source, b < c →
      let a := b * c / (b + c)
      a ∈ source → 0 < a → a < b → b * c = a * (b + c) →
      (a ∈ target ∧ b ∈ target ∧ c ∈ target) ∨
        (a ∈ firstDelete ∨ b ∈ firstDelete ∨ c ∈ firstDelete) := by
  decide

#print axioms shard{i:02}
end ExtensionFirstArchive
'''
    imports = ''.join(f'import ExtensionBoundaryShard{i:02}\n' for i in range(len(intervals)))
    cases = ''
    indent = '  '
    for i, (lo, hi) in enumerate(intervals):
        if i < len(intervals) - 1:
            cases += f'{indent}by_cases h{i} : b < {hi}\n{indent}· exact shard{i:02} b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc\n{indent}·\n'
            indent += '  '
        else:
            cases += f'{indent}exact shard{i:02} b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc\n'
    result['ExtensionBoundaryAssembly'] = imports + '''
namespace ExtensionFirstArchive
open Finset ExtensionSeedCandidate

set_option maxRecDepth 100000 in
set_option maxHeartbeats 100000000 in
 theorem source_lt : ∀ b ∈ source, b < 1901 := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 100000000 in
 theorem checked_pair_boundary : PairBoundary source target firstDelete := by
  refine ⟨?_, ?_, ?_⟩
  · decide
  · decide
  intro b hb c hc hbc
  have hbmax := source_lt b hb
''' + cases + '''
theorem checked_boundary : Boundary source target firstDelete :=
  pair_boundary_sound checked_pair_boundary

theorem source_to_seed (hb : Extended.Bound source 258) :
    Extended.Bound target 242 := by
  have h := seed hb checked_boundary (Finset.Subset.rfl : target ⊆ target)
  simpa [firstDelete] using h

theorem projected_seed (P : Finset ℕ) (hp : P ⊆ target)
    (hb : Extended.Bound source 258) :
    Extended.Bound P (242 - (target \\ P).card) :=
  BankProfile.restrict_bound hp (source_to_seed hb)

#print axioms source_lt
#print axioms checked_pair_boundary
#print axioms checked_boundary
#print axioms source_to_seed
#print axioms projected_seed
end ExtensionFirstArchive
'''
    return result


if __name__ == '__main__':
    out = generate()
    path = ROOT/'lean/ExtensionFirstArchive.lean'
    if sys.argv[1:] == ['--check']:
        check_bytes(path.read_bytes(), out.encode('utf-8'))
        print('PASS first extension byte-for-byte regeneration')
    elif sys.argv[1:] in (['--shards'], ['--check-shards']):
        artifacts = generate_shards()
        existing = {p.stem for p in (ROOT/'lean').glob('ExtensionBoundary*.lean')}
        if sys.argv[1:] == ['--check-shards']:
            if existing != set(artifacts):
                raise ValueError(f'shard artifact inventory mismatch: {existing ^ set(artifacts)}')
            for name, text in artifacts.items():
                check_bytes((ROOT/'lean'/f'{name}.lean').read_bytes(), text.encode('utf-8'))
            print('PASS complete shard regeneration')
        else:
            if existing - set(artifacts):
                raise ValueError('unexpected shard artifacts; refusing to overwrite')
            for name, text in artifacts.items():
                (ROOT/'lean'/f'{name}.lean').write_text(text)
            print('wrote', len(artifacts), 'shard artifacts')
    elif not sys.argv[1:]:
        path.write_text(out)
        print('wrote', path)
    else:
        raise SystemExit('usage: first_archive.py [--check]')
