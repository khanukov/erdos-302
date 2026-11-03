#!/usr/bin/env python3
"""Replay the exact 1209 ancestry and generate its literal bridge, not a Lean proof."""
import collections, copy, math
from pathlib import Path
import archive_prefix
from bank_interpreter import interpret
from verify_bank import small_only

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / 'lean/Node1209SourceCandidate.lean'

def generate():
    bank = archive_prefix.load_bank()
    nodes, images = bank['nodes'], bank['images']
    seen, pending = set(), [1209]
    def refs(n):
        t=n['t']
        if t in ('pack','qpack'): return [r[0] for r in n['rows']]
        if t=='case': return n['cs']
        if t=='trim': return [n['ref']]
        if t in ('small','externalActive'): return []
        raise ValueError('unsupported rule')
    while pending:
        i=pending.pop()
        if i in seen: continue
        seen.add(i)
        for j in refs(nodes[i]):
            source=images[j][0]
            if not 0 <= source < i: raise ValueError('non-backward reference')
            pending.append(source)
    order=sorted(seen); remap={v:i for i,v in enumerate(order)}
    assert len(order)==376 and collections.Counter(nodes[i]['t'] for i in order)=={'small':368,'case':4,'trim':3,'pack':1}
    assert not any(nodes[i]['t']=='externalActive' for i in order)
    # Replay exactly the induced DAG, preserving every reference occurrence.
    short=[]; im=[]
    for i in order:
        n=copy.deepcopy(nodes[i])
        def add(j):
            source,m,d=images[j]; im.append([remap[source],m,d]); return len(im)-1
        t=n['t']
        if t in ('pack','qpack'):
            for row in n['rows']: row[0]=add(row[0])
        elif t=='case': n['cs']=[add(j) for j in n['cs']]
        elif t=='trim': n['ref']=add(n['ref'])
        short.append(n)
    assert len(im)==1056
    vals=interpret(short,im,small_only)
    support,demand=vals[remap[1209]]
    assert len(support)==901 and demand==258
    root=nodes[1209]; assert root['t']=='pack' and root['D']==1001
    raw=[]
    for image_id,weight in root['rows']:
        source,m,d=images[image_id]
        for x in vals[remap[source]][0]:
            assert x*m%d==0
            raw.append(x*m//d)
    norm=math.gcd(*raw)
    assert sorted({v//norm for v in raw})==list(support)
    rows=[]
    for image_id,w in root['rows']:
        j,m,d=images[image_id]
        assert all(x*m%(d*norm)==0 for x in vals[remap[j]][0])
        rows.append(f'⟨{j}, {m}, {d*norm}, {w}⟩')
    literal='{'+', '.join(map(str,support))+'}'
    text='''import FirstExtensionBridge
import MixedCaseTrimCandidate

/- Candidate only: literal derived by Python replay of pinned bank ancestry;
   the archive-to-Lean correspondence is not a kernel theorem. -/
namespace Node1209SourceCandidate
open MixedCaseTrimCandidate
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000

def node : MixedDag.Node Payload :=
  ⟨'''+literal+', 258, .pack '+str(len(rows))+' !['+', '.join(rows)+'''] 1001⟩

/-- This checks the two independently transcribed Lean supports, not ZIP provenance. -/
theorem support_identity : node.support = ExtensionFirstArchive.source := by
  decide

theorem demand_identity : node.demand = 258 := by rfl

/-- The missing checker remains explicit, and applies to the genuine mixed DAG. -/
theorem source_of_checked_prefix (nodes : ℕ → MixedDag.Node Payload)
    (valid : ∀ i < 1210, MixedDag.Check extraCheck nodes i)
    (identity : nodes 1209 = node) :
    Extended.Bound ExtensionFirstArchive.source 258 := by
  have h := MixedCaseTrimCandidate.sound nodes 1210 valid 1209 (by decide)
  rw [identity, support_identity, demand_identity] at h
  exact h

#print axioms support_identity
#print axioms demand_identity
#print axioms source_of_checked_prefix
end Node1209SourceCandidate
'''
    stats={'nodes':len(order),'reference_occurrences':len(im),'rules':dict(collections.Counter(nodes[i]['t'] for i in order)), 'before256':sum(i<256 for i in order), 'from256to1023':sum(256<=i<1024 for i in order), 'from1024':sum(i>=1024 for i in order), 'non_small':[(i,nodes[i]['t']) for i in order if nodes[i]['t']!='small'], 'root_rows':len(rows),'normalizer':norm}
    return text,stats

if __name__=='__main__':
    import json,sys
    text,stats=generate()
    if sys.argv[1:]==['--write']: OUTPUT.write_text(text)
    elif sys.argv[1:]==['--check']:
        if OUTPUT.read_text()!=text: raise SystemExit('mismatch')
    else: raise SystemExit('use --write or --check')
    print(json.dumps(stats,sort_keys=True))
