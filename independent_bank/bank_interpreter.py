"""Independent executable checker; leaf callback is a TRUSTED assumption, not a proof."""
from fractions import Fraction
from math import gcd
from itertools import combinations

class CheckError(ValueError): pass

def need(p, msg):
    if not p: raise CheckError(msg)

def nat(x, lo=0): return type(x) is int and x >= lo

def edges(s):
    vs=set(s)
    for b,c in combinations(sorted(vs),2):
        a,r=divmod(b*c,b+c)
        if not r and a in vs: yield (a,b,c)

def interpret(nodes, images, leaf):
    """Return normalized (support,demand); caller must establish every leaf Bound."""
    out=[]
    def image(j, idx):
        need(nat(j) and j<len(images), 'image index')
        row=images[j]; need(type(row) is list and len(row)==3,'image shape')
        i,m,d=row
        need(nat(i) and i<idx and nat(m,1) and nat(d,1) and gcd(m,d)==1,'image reference/scale')
        s,k=out[i]; need(all(v*m%d==0 for v in s),'nonintegral scale')
        return tuple(v*m//d for v in s),k
    for idx,n in enumerate(nodes):
        need(type(n) is dict and type(n.get('t')) is str,'node')
        typ=n['t']
        if typ in ('pack','qpack'):
            need(set(n)==({'t','D','rows'} if typ=='pack' else {'t','rows'}),'pack fields')
            cap=n['D'] if typ=='pack' else 1
            need(nat(cap,1) and type(n['rows']) is list and n['rows'],'capacity/rows')
            load={}; obj=Fraction(); seen=set()
            for row in n['rows']:
                need(type(row) is list and len(row)==(2 if typ=='pack' else 3),'row')
                j=row[0]; need(nat(j) and j not in seen and all(nat(w,1) for w in row[1:]),'row weight')
                seen.add(j); s,r=image(j,idx); w=Fraction(row[1],row[2]) if typ=='qpack' else Fraction(row[1]); obj+=w*r
                for v in s: load[v]=load.get(v,Fraction())+w
            need(load and max(load.values())<=cap,'overload')
            ratio=obj/cap; k=-(-ratio.numerator//ratio.denominator); s=sorted(load)
        elif typ=='trim':
            need(set(n)=={'t','ref'},'trim fields'); t,k=image(n['ref'],idx)
            s=sorted({v for e in edges(t) for v in e}); need(s,'empty trim')
        elif typ=='case':
            need(set(n)=={'t','v','r','cs','tree','root'},'case fields')
            s=n['v']; k=n['r']; need(type(s) is list and s==sorted(set(s)) and all(nat(v,1) for v in s) and nat(k,1) and k<=len(s),'case support')
            need(type(n['cs']) is list and type(n['tree']) is list and n['tree'] and nat(n['root']) and n['root']==len(n['tree'])-1,'case shape')
            T=set(s); cs=[]
            for j in n['cs']:
                u,r=image(j,idx); u=set(u); cs.append((u&T,r-len(u-T)))
            tree=n['tree']; visited=set()
            def walk(j,ones,zeros):
                need(nat(j) and j<len(tree),'tree index'); visited.add(j)
                z=tree[j]; need(type(z) is list and z,'tree shape'); free=T-ones-zeros; budget=k-1-len(ones)
                def con(i):
                    need(nat(i) and i<len(cs),'constraint index'); return cs[i]
                def child(i): need(nat(i) and i<j,'tree cycle'); return i
                if z[0]=='budget': need(len(z)==1 and budget<0,'budget')
                elif z[0]=='row':
                    need(len(z)==2,'row shape'); u,r=con(z[1]); need(r-len(u&ones)>len(u&free),'row contradiction')
                elif z[0]=='force':
                    need(len(z)==3,'force shape'); u,r=con(z[1]); f=u&free
                    need(r-len(u&ones)==len(f)>0,'force'); walk(child(z[2]),ones|f,zeros)
                elif z[0]=='split':
                    need(len(z)==4 and z[1] in free,'split'); x=z[1]
                    walk(child(z[2]),ones,zeros|{x}); walk(child(z[3]),ones|{x},zeros)
                elif z[0]=='dual':
                    need(len(z)==3 and nat(z[1],1) and type(z[2]) is list,'dual'); d=z[1]; loads={}; obj=0; seen=set()
                    for pair in z[2]:
                        need(type(pair) is list and len(pair)==2,'dual pair'); i,w=pair
                        need(nat(i) and i not in seen and nat(w,1),'dual weight'); seen.add(i)
                        u,r=con(i); res=r-len(u&ones); need(res>0,'dual residual'); obj+=res*w
                        for v in u&free: loads[v]=loads.get(v,0)+w
                    need(max(loads.values(),default=0)<=d and obj>d*budget,'dual contradiction')
                else: raise CheckError('tree kind')
            walk(n['root'],set(),set()); need(visited==set(range(len(tree))),'unreachable tree')
        else:
            value=leaf(idx,n); need(type(value) in (tuple,list) and len(value)==2,'unproved leaf'); s,k=value
        need(type(s) in (list,tuple) and s and all(nat(v,1) for v in s) and len(s)==len(set(s)),'support')
        s=sorted(s); g=gcd(*s); s=tuple(v//g for v in s)
        need(nat(k,1) and k<=len(s),'demand'); out.append((s,k))
    return out
