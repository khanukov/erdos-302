import json,re,bisect
from pathlib import Path
p=Path('/root/erdos-302-independent-audit'); d=json.loads((p/'source/erdos302_boundary_certificates/baseline/upstream_intervals.json').read_text()); piv=d['pivots']; X=500000
parent=[0]*(X+1); summaries=[]
for i in range(19,-1,-1):
 s=(p/f'kitamura/lean/Erdos302ReflectiveChainData{i:02d}FC.lean').read_text(); m=re.search(rf'def TL_{i} : LTree := treeOfPairs \(unpackPairChunks 20 \[(.*?)\]\)',s); assert m, i
 chunks=re.findall(r'\((\d+),\s*(0x[0-9a-f]+)\)',m.group(1)); pairs=[]; mask=(1<<20)-1
 for k,x in chunks:
  z=int(x,16)
  for _ in range(int(k)):
   pairs.append((z&mask,(z>>20)&mask));z>>=40
  assert z==0
 assert all(pairs[j][0]<pairs[j+1][0] for j in range(len(pairs)-1))
 diff=[0]*(X+2)
 for a,b in d['intervals'][i]: diff[a]+=1; diff[b]-=1
 cur=[0]*(X+1); a=0; pos=0; value=0; mism=0; samples={}
 for n in range(X+1):
  a+=diff[n]
  if n: cur[n]=parent[n]+cur[n//piv[i]]+a
  while pos<len(pairs) and pairs[pos][0]<=n: value=pairs[pos][1];pos+=1
  if value!=cur[n]: mism+=1
  if i==0 and n in (420,644,806,814): samples[n]=cur[n]
 summaries.append((i,len(pairs),mism,samples)); parent=cur
print('level,keycount,mismatches,samples:',summaries)
assert all(x[2]==0 for x in summaries)
