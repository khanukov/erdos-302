#!/usr/bin/env python3
"""Pinned archive-induced node 1190 closure; Python transcription is not a proof."""
import argparse
import collections
import copy
import json
from pathlib import Path
import archive_prefix
from bank_interpreter import interpret
from verify_bank import small_only
import node1209_closure
import node1190_render

OUT = Path(__file__).resolve().parents[1] / 'audit/node1190-min'

def extract(bank):
    nodes, images = bank['nodes'], bank['images']
    todo, seen = [1190], set()
    while todo:
        i = todo.pop()
        if type(i) is not int or not 0 <= i < len(nodes): raise ValueError('node index')
        if i in seen: continue
        seen.add(i)
        for j in node1209_closure.references(nodes[i]):
            if type(j) is not int or not 0 <= j < len(images): raise ValueError('image index')
            row = images[j]
            if type(row) is not list or len(row) != 3: raise ValueError('image shape')
            source = row[0]
            if type(source) is not int or not 0 <= source < i: raise ValueError('back reference')
            todo.append(source)
    order = sorted(seen)
    index = {original: dense for dense, original in enumerate(order)}
    short, image_occurrences, result = [], [], []
    for original in order:
        raw = nodes[original]
        node = copy.deepcopy(raw)
        refs = []
        for image_id in node1209_closure.references(raw):
            source, mul, div = images[image_id]
            if source not in index or index[source] >= index[original]: raise ValueError('mapping')
            refs.append({'image': image_id, 'original_source': source, 'dense_source': index[source], 'mul': mul, 'div': div})
            image_occurrences.append([index[source], mul, div])
        first = len(image_occurrences) - len(refs)
        if node['t'] in ('pack', 'qpack'):
            for k, row in enumerate(node['rows']): row[0] = first+k
        elif node['t'] == 'case': node['cs'] = list(range(first, first+len(refs)))
        elif node['t'] == 'trim': node['ref'] = first
        short.append(node)
        result.append({'original': original, 'raw_node': copy.deepcopy(raw), 'references': refs})
    values = interpret(short, image_occurrences, small_only)
    if len(values) != len(result): raise ValueError('replay length')
    for record, (support, demand) in zip(result, values):
        record['support'], record['demand'] = list(support), demand
    if len(result) != 337 or result[-1]['original'] != 1190: raise ValueError('inventory')
    return {'format':'node1190-induced-closure-v1', 'nodes':result}

def validate(bank, doc):
    # Full structure and values, not merely set difference/cardinalities.
    if json.dumps(doc, sort_keys=True, separators=(',', ':')) != json.dumps(extract(bank), sort_keys=True, separators=(',', ':')):
        raise ValueError('archive correspondence mismatch')

def files(bank):
    doc = extract(bank)
    out = {'closure.json': json.dumps(doc, sort_keys=True, indent=2)+'\n'}
    text = node1190_render.generate(doc)
    data = text.split('theorem check',1)[0]
    data = '\n'.join(x for x in data.split('\n') if not x.startswith('import Small'))
    out['DenseData.lean'] = data + 'end Node1209Dense\n'
    # Bounded independent intervals; isolate each expensive non-small rule.
    ranges = []
    start = 0
    while start < len(doc['nodes']):
        if doc['nodes'][start]['raw_node']['t'] != 'small':
            end = start + 1
        else:
            end = start
            while end < min(start + 16, len(doc['nodes'])) and doc['nodes'][end]['raw_node']['t'] == 'small':
                end += 1
        ranges.append((start, end))
        start = end
    if [i for a, b in ranges for i in range(a, b)] != list(range(337)):
        raise ValueError('shard coverage')
    for a, b in ranges:
        name = f'Shard{a:03}_{b:03}'
        if doc['nodes'][a]['raw_node']['t'] == 'case':
            proof = (
                '  intro i hlo hhi\n  interval_cases i\n'
                f'  change MixedCaseTrimCandidate.CaseCheck Node1209Dense.nodes {a} _ _\n'
                '  unfold MixedCaseTrimCandidate.CaseCheck MixedCaseTrimCandidate.RefCheck '
                'MixedCaseTrimCandidate.row MixedCaseTrimCandidate.image Node1209Dense.nodes\n'
                '  constructor\n  · decide\n  · repeat\' rw [BankCase.check]\n    decide\n')
        else:
            proof = '  intro i hlo hhi\n  interval_cases i <;> decide\n'
        out[name + '.lean'] = (
            'import DenseData\n\nnamespace Node1190Min\n'
            'set_option maxRecDepth 100000\nset_option maxHeartbeats 100000000\n'
            f'theorem {name} : ∀ i, {a} ≤ i → i < {b} → '
            'MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := by\n'
            + proof +
            f'#print axioms {name}\nend Node1190Min\n')
    imports = ''.join(f'import Shard{a:03}_{b:03}\n' for a,b in ranges)
    valid = ['theorem valid : ∀ i < 337, MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := by\n',
             '  intro i hi\n']
    for a,b in ranges[:-1]:
        valid += [f'  by_cases h{b} : i < {b}\n',
                  f'  · exact Shard{a:03}_{b:03} i (by omega) h{b}\n']
    a,b = ranges[-1]
    valid += [f'  exact Shard{a:03}_{b:03} i (by omega) hi\n']
    lines = [imports + 'import Node1209SourceCandidate\n\n',
             '/- Candidate only: the proofs below have not been kernel checked.\n',
             '   Python archive correspondence is external to Lean. -/\n',
             'namespace Node1190Min\nset_option maxRecDepth 100000\nset_option maxHeartbeats 100000000\n',
             *valid,
             'theorem source_subset : (Node1209Dense.nodes 336).support ⊆ Node1209SourceCandidate.node.support := by\n  decide\n',
             'theorem source_bound : Extended.Bound ExtensionFirstArchive.source 258 := by\n',
             '  have hb := MixedCaseTrimCandidate.sound Node1209Dense.nodes 337 valid 336 (by decide)\n',
             '  have ht := Extended.bound_mono source_subset hb\n',
             '  change Extended.Bound Node1209SourceCandidate.node.support Node1209SourceCandidate.node.demand at ht\n',
             '  rw [Node1209SourceCandidate.support_identity, Node1209SourceCandidate.demand_identity] at ht\n  exact ht\n',
             '#print axioms valid\n#print axioms source_subset\n#print axioms source_bound\nend Node1190Min\n']
    out['Candidate.lean'] = ''.join(lines)
    contract = ['import Candidate\n\nnamespace Node1190Min\n']
    for a,b in ranges:
        name = f'Shard{a:03}_{b:03}'
        contract.append(f'example : ∀ i, {a} ≤ i → i < {b} → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := {name}\n')
    contract += ['example : ∀ i < 337, MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := valid\n',
                 'example : (Node1209Dense.nodes 336).support ⊆ Node1209SourceCandidate.node.support := source_subset\n',
                 'example : Extended.Bound ExtensionFirstArchive.source 258 := source_bound\n',
                 'end Node1190Min\n']
    out['ExactContract.lean'] = ''.join(contract)
    return out

def check(bank):
    expected = files(bank)
    if {p.name for p in OUT.iterdir() if p.suffix in ('.json','.lean')} != set(expected): raise ValueError('inventory')
    for name, text in expected.items():
        if (OUT/name).read_bytes() != text.encode(): raise ValueError('byte mismatch: '+name)

def main():
    p=argparse.ArgumentParser(); p.add_argument('--check',action='store_true'); a=p.parse_args()
    bank=archive_prefix.load_bank()
    if not a.check:
        OUT.mkdir(parents=True,exist_ok=True)
        for name,text in files(bank).items(): (OUT/name).write_bytes(text.encode())
    check(bank)
    doc=extract(bank)
    print('PASS:',len(doc['nodes']),'nodes;',sum(len(n['references']) for n in doc['nodes']),'reference occurrences;',dict(collections.Counter(n['raw_node']['t'] for n in doc['nodes'])))
    print('Archive byte digest checked; Lean candidate unverified; Python transcription is external.')
if __name__=='__main__': main()
