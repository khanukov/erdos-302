import json,itertools,collections,zipfile
from fractions import Fraction
from pathlib import Path
archive = Path(__file__).resolve().parents[1] / 'input/erdos302_boundary_certificates_publication.zip'
with zipfile.ZipFile(archive) as z:
    candidates = [name for name in z.namelist() if name.endswith('/certificate.json') and name.count('/') == 1]
    assert len(candidates) == 1
    c = json.loads(z.read(candidates[0]))
tables={}
for t in c['tables']:
 s=t['support']; b=t['boundary']; n=len(s)
 edges=[z for z in itertools.combinations(s,3) if z[1]*z[2]==z[0]*(z[1]+z[2])]
 assert set(map(tuple,t['edges']))==set(edges)
 covers=[set(z for j,z in enumerate(s) if m>>j&1) for m in range(1<<n)]
 covers=[x for x in covers if all(x.intersection(e) for e in edges)]
 for j,cell in enumerate(t['cells']):
  bc={v for k,v in enumerate(b) if j>>k&1}; opts=[x for x in covers if x.intersection(b)==bc]
  k=min((len(x-set(b)) for x in opts),default=None)
  assert k==cell['lower']
  if k is not None:
   w={v for q,v in enumerate(s) if cell['witness']>>q&1}; assert w in opts and len(w-set(b))==k
 tables[t['id']]=(s,b,edges,covers)
 print('table',t['id'],'edges',len(edges),'costs',[v['lower'] for v in t['cells']])
for row in c['inequalities']:
 s,b,e,covs=tables[row['table']]; gates={g['id']:g['vertices'] for g in c['gates']}
 for x in covs:
  lhs=row['interior_coefficient']*len(x-set(b))+sum(q*(v in x) for v,q in zip(b,row['boundary_coefficients']))+sum(q*all(v in x for v in gates[g]) for g,q in row['gate_terms'])
  assert lhs>=row['rhs']
for item in c['strict_relaxation_examples']:
 row=next(q for q in c['inequalities'] if q['id']==item['inequality']); s,b,edges,_=tables[row['table']]; vals=list(map(lambda z:Fraction(*z),item['point'])); checked=0
 for m in range(1<<len(s)):
  u={v for i,v in enumerate(s) if m>>i&1}; ee=[set(e) for e in edges if set(e)<=u]
  tau=min(len(z) for k in range(len(u)+1) for z in itertools.combinations(u,k) if all(set(z)&e for e in ee))
  assert sum(vals[i] for i,v in enumerate(s) if v in u)>=tau; checked+=1
 lhs=sum((row['boundary_coefficients'][b.index(v)] if v in b else row['interior_coefficient'])*vals[j] for j,v in enumerate(s))
 assert lhs==Fraction(*item['expected_lhs']) and lhs<row['rhs']
 print('separation',row['id'],'constraints',checked,'lhs',lhs)
s,b,e,covs=tables['t4']; print('t4 edges',e); print('t4 witnesses',[(j,[v for i,v in enumerate(s) if t['witness']>>i&1] if t['witness'] is not None else None) for j,t in enumerate(next(t for t in c['tables'] if t['id']=='t4')['cells'])]); print('t4 covers',len(covs))
for p in range(4,1001):
 a,b,c,d,e,f,g,h,i=2*(p-1),2*p,2*(p+1),2*p*(p-1),2*p*p,2*p*(p+1),p*(p*p-1),2*p*p*(p-1),2*p*p*(p+1)
 assert a<b<c<d<e<f<g<h<i
 assert all(y*z==x*(y+z) for x,y,z in [(a,b,d),(b,c,f),(d,e,h),(d,f,g),(e,f,i),(g,h,i)])
print('parametric numeric regressions p=4..1000 passed')
