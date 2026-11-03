#!/usr/bin/env python3
"""Generate bounded candidate checks on the actual dense node, not a proof of assembly."""
import sys
from pathlib import Path
import json
import node1190_min as minimum
import archive_prefix
ROOT = Path(__file__).resolve().parents[1]

OUT = ROOT / 'audit/node1190-final-split'

def intervals(n, size):
    if type(n) is not int or type(size) is not int or n < 0 or size <= 0:
        raise ValueError('bad interval')
    return [(a, min(a + size, n)) for a in range(0, n, size)]

def generate(doc):
    # Bind all occurrences, weights, support, and closure metadata to the pinned bank.
    if doc != minimum.extract(archive_prefix.load_bank()):
        raise ValueError('closure does not match pinned bank')
    if len(doc.get('nodes', [])) != 337 or doc['nodes'][-1]['original'] != 1190: raise ValueError('closure inventory')
    n = doc['nodes'][336]
    entries = n['raw_node']['tree'][0][2]
    if len(entries) != 530 or any(type(p) is not int or not 0 <= p < 530 for p, _ in entries):
        raise ValueError('invalid entry occurrences')
    vertices = n['support']
    if len(vertices) != 899 or len(set(vertices)) != 899:
        raise ValueError('target inventory')
    files = {}
    files['Node1190DualData.lean'] = '''import DenseData

namespace Node1190Dual
open Finset
open scoped BigOperators
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000

def refs : List MixedCaseTrimCandidate.Ref :=
  match (Node1209Dense.nodes 336).rule with
  | .extra (.caseRule rs _) => rs
  | _ => []
def entries : List (BankCase.WeightedRow ℕ) :=
  match (Node1209Dense.nodes 336).rule with
  | .extra (.caseRule _ (.dual es _)) => es
  | _ => []
def refAt (i : ℕ) : MixedCaseTrimCandidate.Ref := refs.getD i ⟨0, 0, 0⟩
def entryAt (i : ℕ) : BankCase.WeightedRow ℕ := BankCase.dualEntry entries i

def load (x : ℕ) : ℤ :=
  ∑ i ∈ (Finset.range entries.length).filter (fun i => x ∈ (entryAt i).1.1), (entryAt i).2

def objective : ℤ :=
  ∑ i ∈ Finset.range entries.length, (entryAt i).2 * BankCase.Remaining (entryAt i).1.1 (entryAt i).1.2 ∅
end Node1190Dual
'''
    prefix = 'import Node1190DualData\n\nnamespace Node1190Dual\nset_option maxRecDepth 65536\nset_option maxHeartbeats 100000000\n'
    for shard, (a, b) in enumerate(intervals(530, 10)):
        text = prefix
        for i in range(a, b):
            pos = entries[i][0]
            text += f'''theorem ref{i:03} : MixedCaseTrimCandidate.RefCheck Node1209Dense.nodes 336 (refAt {i}) := by decide
#print axioms ref{i:03}
theorem row{i:03} : (entryAt {i}).1 = MixedCaseTrimCandidate.row Node1209Dense.nodes 336 (refAt {pos}) := by decide
#print axioms row{i:03}
theorem weight{i:03} : 0 < (entryAt {i}).2 := by decide
#print axioms weight{i:03}
'''
        files[f'Node1190Refs{shard:03}.lean'] = text + 'end Node1190Dual\n'
    for shard, (a, b) in enumerate(intervals(899, 10)):
        text = prefix
        for i in range(a, b):
            x = vertices[i]
            text += f'theorem capacity{i:03} : load {x} ≤ 1000000 := by decide\n#print axioms capacity{i:03}\n'
        files[f'Node1190Capacity{shard:03}.lean'] = text + 'end Node1190Dual\n'
    files['Node1190Objective.lean'] = prefix + '''theorem lengths : refs.length = 530 ∧ entries.length = 530 := by decide
#print axioms lengths
theorem objective_exact : objective = 257076355 := by decide
#print axioms objective_exact
theorem objective_bound : (257000000 : ℤ) < 257076355 := by decide
#print axioms objective_bound
end Node1190Dual
'''
    files['Node1190LeafBridge.lean'] = '''import Node1190DualData

/- This is a decomposition of the executable Boolean check, not an assertion
   that the concrete node satisfies its premises. Occurrences remain indexed. -/
namespace Node1190Dual
open Finset
open scoped BigOperators
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000

theorem leaf_from_components (rows : List (BankCase.Constraint ℕ))
    (T O Z : Finset ℕ) (k : ℕ) (es : List (BankCase.WeightedRow ℕ)) (D : ℤ)
    (hrows : ∀ i ∈ Finset.range es.length, (BankCase.dualEntry es i).1 ∈ rows)
    (hD : 0 < D)
    (hw : ∀ i ∈ Finset.range es.length, 0 < (BankCase.dualEntry es i).2)
    (hcap : ∀ x ∈ BankCase.Free T O Z,
      (∑ i ∈ (Finset.range es.length).filter
        (fun i => x ∈ (BankCase.dualEntry es i).1.1), (BankCase.dualEntry es i).2) ≤ D)
    (hobj : D * ((k : ℤ) - 1 - (O.card : ℤ)) <
      ∑ i ∈ Finset.range es.length, (BankCase.dualEntry es i).2 *
        BankCase.Remaining (BankCase.dualEntry es i).1.1 (BankCase.dualEntry es i).1.2 O) :
    BankCase.check rows T O Z k (.dual es D) = true := by
  simp only [BankCase.check, Bool.and_eq_true, BankCase.dualCheck, decide_eq_true_eq]
  exact ⟨hrows, hD, hw, hcap, hobj⟩
#print axioms leaf_from_components

example : BankCase.check [({0}, 1), ({1}, 1)] ({0, 1} : Finset ℕ) ∅ ∅ 2
    (.dual [(({0}, 1), 1), (({1}, 1), 1)] 1) = true := by
  apply leaf_from_components <;> decide

-- Duplicate occurrences count twice, so the shared vertex exceeds capacity.
example : BankCase.check [({0}, 1)] ({0} : Finset ℕ) ∅ ∅ 2
    (.dual [(({0}, 1), 1), (({0}, 1), 1)] 1) = false := by decide
end Node1190Dual
'''
    imports = 'import Node1190LeafBridge\nimport Node1190ComponentFold\n'
    imports += ''.join(f'import Node1190Refs{i:03}\n' for i in range(53))
    imports += ''.join(f'import Node1190Capacity{i:03}\n' for i in range(90))
    imports += 'import Node1190Objective\n'
    files['Node1190Assembly.lean'] = imports + '''
namespace Node1190Dual
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000

/- The aggregate hypotheses are explicit: folding the individual facts into
   the Boolean checker is still missing. This is not an unconditional proof. -/
theorem singleton_check
    (hrefs : ∀ r ∈ refs, MixedCaseTrimCandidate.RefCheck Node1209Dense.nodes 336 r)
    (hleaf : BankCase.check (refs.map (MixedCaseTrimCandidate.row Node1209Dense.nodes 336))
      (Node1209Dense.nodes 336).support ∅ ∅ (Node1209Dense.nodes 336).demand
      (.dual entries 1000000) = true) :
    MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 336 := by
  change MixedCaseTrimCandidate.CaseCheck Node1209Dense.nodes 336 refs (.dual entries 1000000)
  exact ⟨hrefs, hleaf⟩

theorem Shard336_337
    (hrefs : ∀ r ∈ refs, MixedCaseTrimCandidate.RefCheck Node1209Dense.nodes 336 r)
    (hleaf : BankCase.check (refs.map (MixedCaseTrimCandidate.row Node1209Dense.nodes 336))
      (Node1209Dense.nodes 336).support ∅ ∅ (Node1209Dense.nodes 336).demand
      (.dual entries 1000000) = true) :
    ∀ i, 336 ≤ i → i < 337 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := by
  intro i hlo hhi
  have : i = 336 := by omega
  subst i
  exact singleton_check hrefs hleaf
#print axioms singleton_check
#print axioms Shard336_337
end Node1190Dual
'''
    # Keep the pre-existing concrete folds under byte-for-byte regeneration too.
    assembly = files['Node1190Assembly.lean']
    marker = '\n/- The aggregate hypotheses'
    folds = (ROOT / 'independent_bank/node1190_assembly_folds.template').read_text()
    generated = '\n/- Every index is retained, including repeated reference positions. -/\n'
    for batch, (a, b) in enumerate(intervals(530, 10)):
        names = ', '.join(f'h{i}' for i in range(a, b))
        generated += f'''theorem ref_positions{batch:03} (i : ℕ) (lo : {a} ≤ i) (hi : i < {b}) :
    MixedCaseTrimCandidate.RefCheck Node1209Dense.nodes 336 (refAt i) := by
  rcases ref_batch{batch:03} with ⟨{names}⟩
  interval_cases i <;> assumption

'''
        generated += f'''theorem row_positions{batch:03} (i : ℕ) (lo : {a} ≤ i) (hi : i < {b}) :
    ∃ j, j < refs.length ∧ (entryAt i).1 =
      MixedCaseTrimCandidate.row Node1209Dense.nodes 336 (refAt j) := by
  rcases row_batch{batch:03} with ⟨{names}⟩
  interval_cases i
'''
        for i in range(a, b):
            pos = entries[i][0]
            generated += f'  · exact ⟨{pos}, by rw [lengths.1]; omega, h{i}⟩\n'
        generated += '\n'
    def dispatch(kind):
        text = ''
        for batch, (a, b) in enumerate(intervals(530, 10)):
            if batch < 52:
                text += f'  by_cases h{batch} : i < {b}\n  · exact {kind}_positions{batch:03} i (by omega) h{batch}\n'
            else:
                text += f'  exact {kind}_positions{batch:03} i (by omega) (by omega)\n'
        return text
    generated += '''theorem all_ref_positions (i : ℕ) (hi : i < refs.length) :
    MixedCaseTrimCandidate.RefCheck Node1209Dense.nodes 336 (refAt i) := by
  have bound : i < 530 := by simpa [lengths.1] using hi
''' + dispatch('ref') + '''
theorem all_row_positions (i : ℕ) (hi : i < entries.length) :
    ∃ j, j < refs.length ∧ (entryAt i).1 =
      MixedCaseTrimCandidate.row Node1209Dense.nodes 336 (refAt j) := by
  have bound : i < 530 := by simpa [lengths.2] using hi
''' + dispatch('row') + '''
theorem hrefs_proved : ∀ r ∈ refs, MixedCaseTrimCandidate.RefCheck Node1209Dense.nodes 336 r := by
  apply Node1190ComponentFold.list_all_of_positions _ ⟨0, 0, 0⟩ refs
  exact all_ref_positions

theorem ref_fin (i : Fin refs.length) :
    MixedCaseTrimCandidate.RefCheck Node1209Dense.nodes 336 (refs.get i) := by
  rw [List.get_eq_getElem, List.getElem_eq_getD ⟨0, 0, 0⟩]
  exact all_ref_positions i.val i.isLt

-- The chosen witness is the original entry's positional reference, not a deduplicated row.
theorem rows_proved : ∀ i ∈ Finset.range entries.length,
    (BankCase.dualEntry entries i).1 ∈
      refs.map (MixedCaseTrimCandidate.row Node1209Dense.nodes 336) := by
  intro i hi
  obtain ⟨j, hj, hrow⟩ := all_row_positions i (Finset.mem_range.mp hi)
  rw [show (BankCase.dualEntry entries i).1 = (entryAt i).1 by rfl, hrow]
  exact Node1190ComponentFold.mapped_getD_mem refs ⟨0, 0, 0⟩
    (MixedCaseTrimCandidate.row Node1209Dense.nodes 336) j hj
#print axioms all_ref_positions
#print axioms ref_fin
#print axioms all_row_positions
#print axioms hrefs_proved
#print axioms rows_proved
'''
    # Split the literal support into small disjunctions; each branch consumes the
    # corresponding already-checked per-vertex capacity theorem.
    chunks = intervals(len(vertices), 10)
    generated += "\n/- Concrete support coverage and capacity aggregation. -/\n"
    for batch, (a, b) in enumerate(chunks):
        literal = ', '.join(map(str, vertices[a:b]))
        generated += f"def support_chunk{batch:03} : Finset ℕ := {{{literal}}}\n"
        generated += f"theorem chunk_capacity{batch:03} (v : ℕ) (hv : v ∈ support_chunk{batch:03}) : load v ≤ 1000000 := by\n"
        generated += f"  simp only [support_chunk{batch:03}, Finset.mem_insert, Finset.mem_singleton] at hv\n"
        generated += '  rcases hv with ' + ' | '.join('rfl' for _ in range(a, b)) + '\n'
        for i in range(a, b):
            generated += f'  · exact capacity{i:03}\n'
    literal = ', '.join(map(str, vertices))
    alternatives = ' ∨ '.join(f'v ∈ support_chunk{batch:03}' for batch in range(len(chunks)))
    defs = ', '.join(f'support_chunk{batch:03}' for batch in range(len(chunks)))
    generated += f"""
theorem support_coverage (v : ℕ) (hv : v ∈ (Node1209Dense.nodes 336).support) :
    {alternatives} := by
  change v ∈ ({{{literal}}} : Finset ℕ) at hv
  simpa only [{defs}, Finset.mem_insert, Finset.mem_singleton, or_assoc] using hv

 theorem capacity_proved : ∀ v ∈ BankCase.Free (Node1209Dense.nodes 336).support ∅ ∅,
    load v ≤ 1000000 := by
  intro v hv
  have hs : v ∈ (Node1209Dense.nodes 336).support := by
    simpa only [BankCase.Free, Finset.sdiff_empty] using hv
  have hc := support_coverage v hs
"""
    generated += '  rcases hc with ' + ' | '.join(f'h{i}' for i in range(len(chunks))) + '\n'
    for batch in range(len(chunks)):
        generated += f'  · exact chunk_capacity{batch:03} v h{batch}\n'
    generated += '#print axioms support_coverage\n#print axioms capacity_proved\n'
    for batch, (a, b) in enumerate(intervals(530, 10)):
        names = ', '.join(f'h{i}' for i in range(a, b))
        generated += f'''\ntheorem weight_positions{batch:03} (i : ℕ) (lo : {a} ≤ i) (hi : i < {b}) :
    0 < (entryAt i).2 := by
  rcases weight_batch{batch:03} with ⟨{names}⟩
  interval_cases i <;> assumption
'''
    generated += '''\ntheorem all_weight_positions (i : ℕ) (hi : i < entries.length) :
    0 < (entryAt i).2 := by
  have bound : i < 530 := by simpa [lengths.2] using hi
''' + dispatch('weight') + '''\ntheorem weights_proved : ∀ i ∈ Finset.range entries.length,
    0 < (BankCase.dualEntry entries i).2 := by
  intro i hi
  exact all_weight_positions i (Finset.mem_range.mp hi)
#print axioms all_weight_positions
#print axioms weights_proved

-- Candidate: each component is derived from occurrence-indexed shard facts.
theorem leaf_proved : BankCase.check
    (refs.map (MixedCaseTrimCandidate.row Node1209Dense.nodes 336))
    (Node1209Dense.nodes 336).support ∅ ∅ (Node1209Dense.nodes 336).demand
    (.dual entries 1000000) = true := by
  apply leaf_with_index_bridges
  · exact rows_proved
  · exact weights_proved
  · simpa only [load, entryAt] using capacity_proved
  · decide
  · rfl
#print axioms leaf_proved
'''
    assembly = assembly.replace(marker, folds + generated + marker, 1)
    assembly = assembly.replace('''/- The aggregate hypotheses are explicit: folding the individual facts into
   the Boolean checker is still missing. This is not an unconditional proof. -/''',
        '/- Candidate assembly: pending Lean compilation and axiom gates. -/')
    assembly = assembly.replace('    (hrefs : ∀ r ∈ refs, MixedCaseTrimCandidate.RefCheck Node1209Dense.nodes 336 r)\n', '')
    assembly = assembly.replace('''    (hleaf : BankCase.check (refs.map (MixedCaseTrimCandidate.row Node1209Dense.nodes 336))
      (Node1209Dense.nodes 336).support ∅ ∅ (Node1209Dense.nodes 336).demand
      (.dual entries 1000000) = true)''', '')
    assembly = assembly.replace('exact ⟨hrefs, hleaf⟩', 'exact ⟨hrefs_proved, leaf_proved⟩')
    assembly = assembly.replace('exact singleton_check hrefs hleaf', 'exact singleton_check')
    assembly = assembly.replace('theorem singleton_check\n :', 'theorem singleton_check :')
    assembly = assembly.replace('theorem Shard336_337\n :', 'theorem Shard336_337 :')
    files['Node1190Assembly.lean'] = assembly
    return {name: text.encode() for name, text in files.items()}

def check_files(expected, actual):
    if expected != actual:
        raise ValueError('generated inventory or bytes differ')

def main():
    if sys.argv[1:] not in (['--write'], ['--check']):
        raise SystemExit('use --write or --check')
    bank = archive_prefix.load_bank()
    minimum.check(bank)
    doc = minimum.extract(bank)
    files = generate(doc)
    if sys.argv[1:] == ['--write']:
        OUT.mkdir(parents=True, exist_ok=True)
        for path in OUT.glob('*.lean'):
            path.unlink()
        for name, text in files.items():
            (OUT / name).write_bytes(text)
    else:
        check_files(files, {p.name: p.read_bytes() for p in OUT.glob('*.lean')})
    print(f'PASS {len(files)} generated files; Python provenance only; Lean not verified')

if __name__ == '__main__':
    main()
