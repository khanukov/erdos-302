#!/usr/bin/env python3
"""Regenerate literal fast-vertex proof candidates. Does not certify compilation."""
import argparse
import hashlib
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[2]
DATA = ROOT / 'lean/ActualSparse64/Data.lean'
PIN = '956c9d8f8c2515aa3d0d7c1c15b80ce28830064b36926c9ed65bf321af9fd554'
OUT = ROOT / 'lean/ActualSparse64'

def generate():
    raw = DATA.read_bytes()
    if hashlib.sha256(raw).hexdigest() != PIN:
        raise ValueError('literal data hash mismatch')
    text = raw.decode('utf-8')
    lists = {}
    for name in ('S', 'T', 'D', 'V'):
        matches = re.findall(r'^def ' + name + r' : List Nat := \[([0-9, ]*)\]$', text, re.M)
        if len(matches) != 1:
            raise ValueError('invalid list ' + name)
        lists[name] = [int(x.strip()) for x in matches[0].split(',')]
        if len(lists[name]) != len(set(lists[name])):
            raise ValueError('duplicate ' + name)
    s, t, d, v = (lists[x] for x in ('S', 'T', 'D', 'V'))
    source_raw = (ROOT / 'lean/ExtensionBoundaryData.lean').read_bytes()
    if hashlib.sha256(source_raw).hexdigest() != '3b656c520b64ea502c0a140c5db575b00cb8fc8f01893a129b116adfc49b8dd5':
        raise ValueError('Finset literal hash mismatch')
    source_text = source_raw.decode('utf-8')
    for list_name, finset_name in (('S', 'source'), ('T', 'target'), ('D', 'firstDelete')):
        found = re.findall(r'def ' + finset_name + r' : Finset ℕ :=\s*\{([0-9,\s]*)\}', source_text)
        if len(found) != 1 or set(lists[list_name]) != {int(x.strip()) for x in found[0].split(',')}:
            raise ValueError('literal Finset mismatch ' + finset_name)
    sample = (OUT / 'FastSample.lean').read_bytes()
    if hashlib.sha256(sample).hexdigest() != '8680cd57765222f89521e0a8556e8f97fa68bfd05d5c41139653fc98a842bdae':
        raise ValueError('lookup source hash mismatch')
    match = re.search(rb'def mask : Nat := ([0-9]+)', sample)
    if not match or int(match.group(1)) != sum(1 << x for x in s):
        raise ValueError('source bitmask mismatch')
    if len(v) != 64 or set(v) != set(s) - set(t) or not set(d) <= set(v):
        raise ValueError('coverage mismatch')
    result = {}
    for x in v:
        result[OUT / f'Vertex{x}.lean'] = f'''import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair{x}_full : SparseBoundaryFast.pairs S lookup D {x} = true := by decide

theorem shard{x}_full : SparseBoundaryShards.shard S D {x} = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup {x} source_lookup (by decide) pair{x}_full
#print axioms pair{x}_full
#print axioms shard{x}_full
end ActualSparse64
'''
    imports = ''.join(f'import ActualSparse64.Vertex{x}\n' for x in v)
    cases = ' | '.join(f'h{x}' for x in v)
    branches = '\n'.join(f'  · subst v; exact shard{x}_full' for x in v)
    result[OUT / 'All.lean'] = imports + f'''import SparseBoundaryMathlib
import ExtensionBoundaryData

/-! Candidate only until this whole module and all 64 shards compile and pass
    axiom gates. Literal archive transcription is not archive-byte proof. -/
namespace ActualSparse64
set_option maxRecDepth 100000
set_option maxHeartbeats 40000000

theorem outside_eq : SparseBoundary.outside S T = V := by decide

theorem target_subset : ∀ x, x ∈ T → x ∈ S := by
  intro x hx
  have h : T.all (fun x => decide (x ∈ S)) = true := by decide
  exact of_decide_eq_true (List.all_eq_true.mp h x hx)

theorem delete_subset : ∀ x, x ∈ D → x ∈ S ∧ x ∉ T := by
  intro x hx
  have h : D.all (fun x => decide (x ∈ S ∧ x ∉ T)) = true := by decide
  exact of_decide_eq_true (List.all_eq_true.mp h x hx)

theorem all_shards : ∀ v, v ∈ V → SparseBoundaryShards.shard S D v = true := by
  intro v hv
  simp only [V, List.mem_cons, List.mem_singleton] at hv
  rcases hv with {cases}
{branches}

theorem checked : SparseBoundary.check S T D = true := by
  apply SparseBoundaryShards.assemble S T D V target_subset delete_subset
  · intro x hx; rw [outside_eq] at hx; exact hx
  · exact all_shards

theorem source_eq : S.toFinset = ExtensionFirstArchive.source := by decide
theorem target_eq : T.toFinset = ExtensionFirstArchive.target := by decide
theorem delete_eq : D.toFinset = ExtensionFirstArchive.firstDelete := by decide

theorem boundary : ExtensionSeedCandidate.Boundary ExtensionFirstArchive.source
    ExtensionFirstArchive.target ExtensionFirstArchive.firstDelete := by
  have h := (SparseBoundary.check_iff S T D).mp checked
  have h' : SparseBoundary.Boundary S.toFinset.toList T.toFinset.toList D.toFinset.toList := by
    simpa only [SparseBoundary.Boundary, Finset.mem_toList, List.mem_toFinset] using h
  have h'' := (SparseBoundaryMathlib.list_boundary_iff S.toFinset T.toFinset D.toFinset).mp h'
  simpa only [source_eq, target_eq, delete_eq] using h''

#print axioms outside_eq
#print axioms all_shards
#print axioms source_eq
#print axioms target_eq
#print axioms delete_eq
#print axioms boundary
end ActualSparse64
'''
    # Keep each expensive declaration in a fresh Lean process.  The original
    # theorem statements and proof bodies remain byte-for-byte unchanged.
    old = result[OUT / 'All.lean']
    start = old.index('theorem outside_eq')
    names = ('outside_eq', 'target_subset', 'delete_subset', 'all_shards',
             'checked', 'source_eq', 'target_eq', 'delete_eq', 'boundary')
    chunks = {}
    for i, name in enumerate(names):
        a = old.index('theorem ' + name, start)
        b = old.index('theorem ' + names[i + 1], a) if i + 1 < len(names) else old.index('#print axioms outside_eq', a)
        chunks[name] = old[a:b]
    header = '\nnamespace ActualSparse64\nset_option maxRecDepth 100000\nset_option maxHeartbeats 40000000\n\n'
    def stage(name, imports, declarations, gates=()):
        result[OUT / (name + '.lean')] = (''.join('import ' + x + '\n' for x in imports) + header
            + ''.join(chunks[x] for x in declarations)
            + ''.join('#print axioms ' + x + '\n' for x in gates) + 'end ActualSparse64\n')
    stage('Outside', ['ActualSparse64.Data'], ['outside_eq'], ['outside_eq'])
    stage('Subsets', ['ActualSparse64.Data'], ['target_subset', 'delete_subset'])
    stage('Coverage', [f'ActualSparse64.Vertex{x}' for x in v] + ['SparseBoundaryMathlib'], ['all_shards'], ['all_shards'])
    stage('Checked', ['ActualSparse64.Outside', 'ActualSparse64.Subsets', 'ActualSparse64.Coverage'], ['checked'])
    for name, decl in [('SourceEq', 'source_eq'), ('TargetEq', 'target_eq'), ('DeleteEq', 'delete_eq')]:
        stage(name, ['ActualSparse64.Data', 'ExtensionBoundaryData'], [decl], [decl])
    stage('All', ['ActualSparse64.Checked', 'ActualSparse64.SourceEq', 'ActualSparse64.TargetEq',
                  'ActualSparse64.DeleteEq', 'SparseBoundaryMathlib'], ['boundary'], ['boundary'])
    return result

def generated_inventory():
    return set(OUT.glob('*.lean')) - {OUT / 'Data.lean', OUT / 'FastSample.lean'}

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--check', action='store_true')
    args = p.parse_args()
    files = generate()
    expected = set(files)
    actual = generated_inventory()
    if args.check:
        if actual != expected or any(not path.is_file() or path.read_text() != value for path, value in files.items()):
            raise SystemExit('generated file inventory or content mismatch')
        print(f'verified {len(files)} generated files')
    else:
        if actual - expected:
            raise SystemExit('unexpected generated files; refusing to delete')
        for path, content in files.items():
            path.write_text(content)
        print(f'wrote {len(files)} generated files')

if __name__ == '__main__':
    main()
