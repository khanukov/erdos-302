"""Data-only independent reconstruction; Python checks are not Lean proofs."""
from array import array
from fractions import Fraction
import hashlib
import io
import json
import lzma
from pathlib import Path
import sys
import zipfile

from bank_interpreter import edges, nat, need
from verify_bank import HASH, PREFIX, PRIMES, verify, unique_object

X = 500000

def ranks(limit):
    need(nat(limit, 1), 'rank limit')
    rem = list(range(limit+1)); result = [-1]*(limit+1)
    for i,p in enumerate(PRIMES):
        for n in range(p, limit+1, p):
            while rem[n] % p == 0: rem[n] //= p
            result[n] = i
    for n in range(1, limit+1):
        if rem[n] != 1: result[n] = 100
    return result

def seeds(witnesses, rank, level, limit):
    need(nat(level) and level < len(PRIMES) and nat(limit,1) and len(rank)>limit, 'seed dimensions')
    out = array('I', [0])*(limit+1)
    for s,k in witnesses:
        need(type(s) in (tuple,list) and s and all(nat(v,1) and v<=limit for v in s) and list(s)==sorted(set(s)) and nat(k,1) and k<=len(s), 'witness')
        allowed = [v for v in s if rank[v] <= level]
        d = k - sum(v%2==0 and rank[v]>level for v in s) - len(allowed)
        need(d<=0, 'projection empty bound')
        for v in allowed:
            d += 1
            if d>out[v]: out[v]=d
    return out

def extensions(rows, results):
    need(type(rows) is list, 'extensions list')
    limit = max(s[-1] for s,k in results); rank = ranks(limit)
    out=[]; seen=set(); cache={}
    for row in rows:
        need(type(row) is dict and set(row)=={'source_node','prime_level','delete','threshold','required','old','outside','outside_edges'}, 'extension fields')
        i,lev=row['source_node'],row['prime_level']
        need(nat(i) and i<len(results) and nat(lev) and lev<20 and (i,lev) not in seen, 'extension origin')
        seen.add((i,lev)); s,k=results[i]; ss=set(s)
        need(all(rank[v]<=19 for v in s), 'extension smoothness')
        t=tuple(v for v in s if rank[v]<=lev); tt=set(t); delete=row['delete']
        need(type(delete) is list and all(nat(v,1) for v in delete) and delete==sorted(set(delete)) and set(delete)<=ss-tt, 'extension delete')
        if i not in cache: cache[i]=list(edges(s))
        es=cache[i]; uu=set(delete)
        need(all(set(e)<=tt or not set(e).isdisjoint(uu) for e in es), 'extension uncovered edge')
        r=k-len(uu)
        need(nat(row['required'],1) and row['required']==r and r<=len(t) and nat(row['threshold'],1) and row['threshold']==s[-1], 'extension result')
        need(nat(row['old']) and nat(row['outside']) and row['outside']==len(ss-tt), 'extension metadata')
        outside_edges={tuple(v for v in e if v not in tt) for e in es if not set(e)<=tt}
        need(nat(row['outside_edges']) and row['outside_edges']==len(outside_edges), 'extension edge count')
        out.append((t,r))
    return out

def renew_level(oldparent, parent, seed, prime, intervals):
    need(type(prime) is int and prime>=2 and len(oldparent)==len(parent)==len(seed) and len(seed)>1, 'dimensions')
    limit=len(seed)-1; diff=array('i',[0])*(limit+2)
    for a,b in intervals:
        need(nat(a,1) and nat(b,1) and a<b, 'interval')
        if a<=limit: diff[a]+=1
        if b<=limit: diff[b]-=1
    old=array('I',[0])*(limit+1); new=array('I',[0])*(limit+1); cells=[]; iv=0; last=0; start=1
    for n in range(1,limit+1):
        iv+=diff[n]; need(iv>=0, 'negative old correction')
        old[n]=oldparent[n]+old[n//prime]+iv
        rec=parent[n]+new[n//prime]
        new[n]=max(rec,new[n-1],old[n],seed[n]); c=new[n]-rec
        if c!=last:
            if last: cells.append([start,n,last])
            start=n; last=c
    if last: cells.append([start,limit+1,last])
    return old,new,cells

def table_hash(a):
    b=array('I',a); need(b.itemsize==4, 'u32 unavailable')
    if sys.byteorder!='little': b.byteswap()
    return hashlib.sha256(b.tobytes()).hexdigest()

def load_inputs(path):
    raw=Path(path).read_bytes(); need(hashlib.sha256(raw).hexdigest()==HASH, 'archive digest')
    with zipfile.ZipFile(io.BytesIO(raw)) as z:
        names=z.namelist()
        def member(name):
            key=PREFIX+name; need(names.count(key)==1, 'archive member'); return z.read(key)
        def parse(data):
            return json.loads(data, object_pairs_hook=unique_object, parse_constant=lambda _: (_ for _ in ()).throw(ValueError('nonfinite')))
        return (parse(lzma.decompress(member('bank.json.xz'))),
                parse(member('upstream_intervals.json')), parse(member('extensions.json')),
                parse(member('VERIFIED_REPORT.json')))

def main():
    path=Path(__file__).resolve().parents[1]/'input/erdos302_boundary_certificates_publication.zip'
    bank,intervals,rows,report=load_inputs(path)
    results=verify(bank,intervals); ext=extensions(rows,results)
    need(len(ext)==515 and len(results)==4106, 'witness counts')
    ws=results+ext; rank=ranks(X); old=array('I',[0])*(X+1); parent=array('I',[0])*(X+1)
    levels=report['levels']; need(type(levels) is list and len(levels)==20, 'report levels')
    rho=Fraction(1); gain=Fraction(); error=0
    for lev,(p,interval,expected) in enumerate(zip(PRIMES,reversed(intervals['intervals']),levels)):
        seed=seeds(ws,rank,lev,X); old,new,cells=renew_level(old,parent,seed,p,interval)
        digest=table_hash(new); heights=sum(c[2] for c in cells)
        j=sum((h*(Fraction(1,a)-Fraction(1,b)) for a,b,h in cells),Fraction())
        need(expected['prime']==p and expected['cells']==cells and expected['table_sha256']==digest and expected['height_sum']==heights and expected['correction_cells']==len(cells) and expected['J']==[j.numerator,j.denominator] and expected['rho']==[rho.numerator,rho.denominator], f'report mismatch level {lev+1}')
        print(f'{lev+1:2} prime={p:2} seed_nonzero={sum(v>0 for v in seed)} cells={len(cells)} sha256={digest}',flush=True)
        gain+=rho*j; error+=2**(lev+1)*heights; rho*=Fraction(p-1,p); parent=new
    upper=1-gain
    need(report['exact_upper']==[upper.numerator,upper.denominator] and report['finite_error']==error, 'global arithmetic')
    print(f'PASS nodes={len(results)} extensions={len(ext)} error={error} upper={upper}')
    print('CONDITIONAL: external old-profile bounds assumed; no Lean proof, archive-to-Lean correspondence or infinite tail established.')

if __name__=='__main__': main()
