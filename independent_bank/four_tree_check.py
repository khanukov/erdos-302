"""Check the first packed upstream TL_0 chunk and four predecessor queries.
Source path supplied explicitly; not a Lean proof of tree construction.
"""
import hashlib
import re
import sys
from pathlib import Path

src=Path(sys.argv[1]).read_bytes()
print('TL_0 source SHA256:',hashlib.sha256(src).hexdigest())
s=src.decode()
m=re.search(r'def TL_0\s*:.*?unpackPairChunks 20 \[\(256, (0x[0-9a-f]+)\)',s,re.S)
if not m: raise ValueError('unrecognized TL_0 first chunk')
x=int(m.group(1),16)
assert x >> (40*256)==0
pairs=[((x>>(40*i))&((1<<20)-1),(x>>(40*i+20))&((1<<20)-1)) for i in range(256)]
assert all(a[0]<b[0] for a,b in zip(pairs,pairs[1:]))
assert pairs[-1][0]>814
for n,v in [(420,71),(644,102),(806,124),(814,125)]:
    p=max((k,y) for k,y in pairs if k<=n)
    assert p[1]==v
    print('predecessor',n,'=',p)
print('Packed data only; source chain and Lean semantics unverified.')
