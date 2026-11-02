"""Data-only diagnostic, not a Lean replay, for archive nodes through 1090."""
from collections import Counter
from math import gcd
from pathlib import Path
import hashlib, json, lzma
from bank_interpreter import interpret, edges
from verify_bank import small_only

PATH = Path(__file__).resolve().parents[1] / 'audit/source/erdos302_boundary_certificates/baseline/bank.json.xz'
SHA = '5c1a1fa4edcc1a0bc7ac3fc9cd3bc7fca4eedad6cb689b6540436ca35ed89034'

def main():
    data = PATH.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    bank = json.loads(lzma.decompress(data))
    nodes, images = bank['nodes'], bank['images']
    out = interpret(nodes[:1091], images, small_only)
    counts = Counter()
    for idx, n in enumerate(nodes[:1091]):
        counts[n['t']] += 1
        if n['t'] not in ('case', 'trim'): continue
        if n['t'] == 'trim':
            src, mul, div = images[n['ref']]
            im = {x*mul//div for x in out[src][0]}
            active = {x for e in edges(im) for x in e}
            g = gcd(*active)
            # Scaling the reference by 1/g puts it in normalized target coordinates.
            normim = {x//g for x in im} if all(x % g == 0 for x in im) else None
            assert normim is not None and set(out[idx][0]) <= normim
            assert all(set(e) <= set(out[idx][0]) for e in edges(normim))
            print('trim', idx, 'source', src, 'normalizer', g, 'normalized-image-integral', normim is not None,
                  'subset', normim is not None and set(out[idx][0]) <= normim,
                  'edge-preserved', normim is not None and all(set(e) <= set(out[idx][0]) for e in edges(normim)))
            continue
        T = set(n['v']); g = gcd(*T); rows=[]
        for j in n['cs']:
            src,m,d = images[j]; im={x*m//d for x in out[src][0]}
            rows.append((im, out[src][1], im & T, out[src][1]-len(im-T)))
        outside=[(j,len(u-T),r) for j,(u,r,_,_) in enumerate(rows) if u-T]
        stats=Counter(); failures=[]
        def walk(j,O,Z):
            z=n['tree'][j]; free=T-O-Z; kind=z[0]; stats[kind]+=1
            if kind == 'dual':
                d, entries=z[1:]; residuals=[]; loads=Counter(); obj=0; rawobj=0
                for p,w in entries:
                    u,r,v,s=rows[p]; res=s-len(v&O); residuals.append(res)
                    obj += w*res; rawobj += w*(r-len(u&O))
                    for x in v&free: loads[x]+=w
                failures.append((j, len(entries), min(residuals,default=0), sum(x<=0 for x in residuals), obj, d*(n['r']-1-len(O)), max(loads.values(),default=0), d, rawobj))
            elif kind=='force':
                p,child=z[1:]; walk(child,O|(rows[p][2]&free),Z)
            elif kind=='split':
                x,a,b=z[1:]; walk(a,O,Z|{x}); walk(b,O|{x},Z)
        walk(n['root'],set(),set())
        assert g == 1 and not outside, (idx, g, outside)
        assert all(minres > 0 and nonpositive == 0 and obj > budget and load <= d
                   for _, _, minres, nonpositive, obj, budget, load, d, _ in failures)
        print('case',idx,'normalizer',g,'refs',len(rows),'outside',len(outside),'outside-vertices',sum(x[1] for x in outside),'outside-details',outside,'tree-visits',dict(stats),'duals (index,entries,minres,nonpositive,obj,budget,maxload,D,rawobj)', failures)
    print('prefix node counts', dict(counts))
    assert counts['case'] == 7 and counts['trim'] == 3

if __name__ == '__main__': main()
