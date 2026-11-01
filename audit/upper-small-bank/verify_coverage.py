#!/usr/bin/env python3
"""Fail-closed independent comparison of successful chunk statements with source JSON."""
import collections, hashlib, json, lzma, pathlib, re, sys
P=pathlib.Path(__file__).resolve().parent
SOURCE=pathlib.Path('/root/erdos-302-independent-audit/source/erdos302_boundary_certificates/baseline/bank.json.xz')
def require(condition, message):
    if not condition: raise ValueError(message)
def main():
    raw=SOURCE.read_bytes(); source=json.loads(lzma.decompress(raw)); nodes=source['nodes']; m=json.loads((P/'coverage.json').read_text())
    require(hashlib.sha256(raw).hexdigest()==m['source_sha256'], 'source hash mismatch')
    require(len(nodes)==4106 and m['source_small']==3528, 'wrong source counts')
    expected={i for i,n in enumerate(nodes) if n.get('t')=='small'}
    require(len(expected)==3528, 'wrong small-node count')
    got=[]
    for chunk in m['chunks']:
        if not chunk['success']: continue
        path=P/'generated'/(chunk['chunk']+'.lean'); log=(P/'generated'/(chunk['chunk']+'.log')).read_text(); text=path.read_text()
        require(hashlib.sha256(path.read_bytes()).hexdigest()==chunk['source_sha256'], 'chunk source hash mismatch')
        require('error:' not in log and 'sorryAx' not in log and 'TIMEOUT' not in log, 'bad Lean log')
        matches=re.findall(r'theorem bank_node_(\d+) : ∀ S : Finset ℕ,\s*UpperBridge\.OrderedCover \(\{([^}]*)\} : Finset ℕ\) S → (\d+) ≤ S\.card := by',text)
        ids=[]
        for ident, vertices, bound in matches:
            i=int(ident); require(i in expected, 'not source small node')
            n=nodes[i]; v=[int(x.strip()) for x in vertices.split(',')]
            require(v==n['v'] and int(bound)==n['r'], f'source mismatch node {i}')
            query=f"'BaselineSmall.bank_node_{i}' depends on axioms: [propext, Classical.choice, Quot.sound]"
            require(log.count(query)==1, f'axiom query mismatch node {i}')
            require(text.count(f'#print axioms bank_node_{i}\n')==1, f'axiom command missing node {i}')
            ids.append(i)
        require(ids==chunk['indices'], 'chunk index mismatch')
        require(len(re.findall(r'^theorem bank_node_',text,re.M))==len(ids), 'unparsed theorem')
        got.extend(ids)
    require(len(got)==len(set(got)), 'duplicate theorem')
    require(sorted(got)==m['compiled_indices'] and len(got)==m['compiled_count'], 'compiled coverage mismatch')
    require(sorted(expected-set(got))==m['uncompiled_indices'], 'uncompiled coverage mismatch')
    require(m['complete']==(set(got)==expected), 'complete flag mismatch')
    print(f'Verified source-indexed coverage: {len(got)}/{len(expected)}; remaining {len(expected)-len(got)}')
    print('Axioms for every counted theorem: propext, Classical.choice, Quot.sound')
    return 0 if m['complete'] else 2
if __name__=='__main__': sys.exit(main())
