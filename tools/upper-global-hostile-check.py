import json, math, itertools
from fractions import Fraction as F
from functools import lru_cache
from pathlib import Path
B=Path('/root/erdos-302-independent-audit/source/erdos302_boundary_certificates/baseline')
r=json.loads((B/'VERIFIED_REPORT.json').read_text()); claim=json.loads((B/'claim.json').read_text())
pr=[3,2,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71]
rho=F(1); G=F(0); E=0; count=0
for j,(p,L) in enumerate(zip(pr,r['levels'])):
 assert L['prime']==p and F(*L['rho'])==rho
 end=0; s=0; integral=F(0)
 for a,b,h in L['cells']:
  assert 1<=a<b<=500001 and a>=end and h>0
  integral+=h*(F(1,a)-F(1,b)); s+=h; end=b; count+=1
 assert integral==F(*L['J']) and s==L['height_sum']
 G+=rho*integral; E+=2**(j+1)*s; rho*=F(p-1,p)
assert 1-G==F(*claim['exact_upper'])==F(*r['exact_upper'])
assert E==claim['finite_error']==r['finite_error']
assert 1-G<F(*claim['headline'])
print('REPORT arithmetic cells',count,'error',E,'exact headline gap',F(*claim['headline'])-(1-G))
# Direct equation enumeration, with no imported archive code.
M=12
edges=[(a,b,c) for a in range(1,M+1) for b in range(a+1,M+1) for c in range(b+1,M+1) if b*c==a*(b+c)]
@lru_cache(None)
def tau(V):
 es=[e for e in edges if all(v in V for v in e)]
 if not es:return 0
 return 1+min(tau(V-{v}) for v in es[0])
def smooth(v,ps):
 for p in ps:
  while v%p==0:v//=p
 return v==1
checks=0
for bits in range(1<<M):
 S=frozenset(i+1 for i in range(M) if bits>>i&1); k=tau(S)
 for ps in ((),(3,),(2,),(3,2),(3,2,5)):
  T=frozenset(v for v in S if smooth(v,ps)); U={v for v in S-T if v%2==0}
  assert all(set(e)<=T or set(e)&U for e in edges if set(e)<=S)
  assert tau(T)>=k-len(U)
  for n in (0,1,3,6,12):
   Tn=frozenset(v for v in T if v<=n)
   assert tau(Tn)>=k-len(U)-len(T-Tn); checks+=1
print('PROJECTION supports',1<<M,'edges',edges,'prefix_checks',checks)
# Tiny complete profiles through X, then zero-correction extension.
X=12; Nmax=200; primes=[3,2,5]; U=[[0]*(Nmax+1) for _ in range(4)]; cells=[]
for j,p in enumerate(primes,1):
 ds=[]
 for n in range(1,Nmax+1):
  base=U[j-1][n]+U[j][n//p]
  if n<=X:
   exact=tau(frozenset(v for v in range(1,n+1) if smooth(v,primes[:j])))
   U[j][n]=max(base,U[j][n-1],exact)
  else:U[j][n]=base
  ds.append(U[j][n]-base)
 assert all(d>=0 for d in ds)
 cells.append(ds[:X])
for N in range(1,Nmax+1):
 rough=lambda q,ps: all(q%p for p in ps)
 lhs=sum(U[3][N//q] for q in range(1,N+1) if rough(q,primes))
 rhs=sum(cells[j-1][N//q-1] for j in range(1,4) for q in range(1,N+1) if rough(q,primes[:j-1]) and N//q<=X)
 assert lhs==rhs,(N,lhs,rhs)
 # Check each singleton cell with exact endpoints and claimed error bound.
 for j,ds in enumerate(cells,1):
  rho=math.prod(F(p-1,p) for p in primes[:j-1])
  for n,h in enumerate(ds,1):
   if not h:continue
   actual=sum(1 for q in range(1,N+1) if rough(q,primes[:j-1]) and N//q==n)
   assert abs(F(actual)-rho*N*(F(1,n)-F(1,n+1)))<=2**j
print('RENEWAL identity and per-cell endpoints N=1..',Nmax,'cutoff',X,'positive singleton cells',sum(sum(x>0 for x in ds) for ds in cells))
# Independently compare full published cell expansion against block decomposition for small N.
for N in (1,2,3,6,11,12,50,100,250,1000):
 U=[[0]*(N+1) for _ in range(21)]
 for j,p in enumerate(pr,1):
  ds=[0]*(N+2)
  for a,b,h in r['levels'][j-1]['cells']:
   if a<=N: ds[a]+=h
   if b<=N: ds[b]-=h
  z=0
  for n in range(1,N+1):
   z+=ds[n]; U[j][n]=U[j-1][n]+U[j][n//p]+z
 lhs=sum(U[20][N//q] for q in range(1,N+1) if all(q%p for p in pr))
 rhs=0
 for j,L in enumerate(r['levels']):
  for q in range(1,N+1):
   if all(q%p for p in pr[:j]):
    t=N//q
    rhs+=sum(h for a,b,h in L['cells'] if a<=t<b)
 assert lhs==rhs
 assert F(lhs)>=G*N-E
print('PUBLISHED CELLS block vs expansion verified at 10 N, max 1000')
