"""Data-only conditional checker. No archive programs are imported or executed."""
import collections
import hashlib
import itertools
import json
import lzma
from pathlib import Path
import sys
import zipfile

from bank_interpreter import CheckError, edges, interpret, nat, need

HASH = '9396819eb36e25926d7ae8ee78b85c61cb898801f935fccfe72ebcad491bc196'
PREFIX = 'erdos302_boundary_certificates/baseline/'
PRIMES = (3,2,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71)
EXTERNAL = {1097:(420,71), 1107:(644,102), 1112:(806,124), 1114:(814,125)}
COUNTS = {'small':3528, 'pack':448, 'qpack':1, 'case':122, 'trim':3, 'externalActive':4}


def check_hash(data):
    need(hashlib.sha256(data).hexdigest() == HASH, 'archive SHA-256 mismatch')


def unique_object(pairs):
    out = {}
    for k, v in pairs:
        need(k not in out, 'duplicate JSON key')
        out[k] = v
    return out


def load_archive(path):
    data = Path(path).read_bytes()
    check_hash(data)
    from io import BytesIO
    with zipfile.ZipFile(BytesIO(data)) as z:
        names = z.namelist()
        def member(name):
            need(names.count(name) == 1, 'missing/duplicate archive member')
            return z.read(name)
        bank = json.loads(lzma.decompress(member(PREFIX+'bank.json.xz')), object_pairs_hook=unique_object)
        intervals = json.loads(member(PREFIX+'upstream_intervals.json'), object_pairs_hook=unique_object)
    return bank, intervals


def validate_data(bank, intervals):
    need(type(bank) is dict and set(bank)=={'schema','nodes','images','roots'}, 'bank fields')
    need(bank['schema']=='erdos302-standalone-finite-proof-bank-v1' and bank['roots']=={}, 'bank schema/roots')
    nodes, images = bank['nodes'], bank['images']
    need(type(nodes) is list and len(nodes)==4106 and type(images) is list and len(images)==25744, 'bank lengths')
    need(all(type(n) is dict and type(n.get('t')) is str for n in nodes), 'node schema')
    need(collections.Counter(n['t'] for n in nodes)==COUNTS, 'node counts')
    need(all(type(row) is list and len(row)==3 and nat(row[0]) and row[0]<len(nodes) and nat(row[1],1) and nat(row[2],1) for row in images), 'image schema')
    need({i:n.get('n') for i,n in enumerate(nodes) if n['t']=='externalActive'} == {i:v[0] for i,v in EXTERNAL.items()}, 'external identities')
    need(all(set(nodes[i])=={'t','n'} and type(nodes[i]['n']) is int for i in EXTERNAL), 'external fields')
    need(type(intervals) is dict and set(intervals)=={'commit','pivots','intervals'}, 'interval fields')
    need(intervals['commit']=='9447ceb28138949b2fb32442cec506a6f53104f9' and intervals['pivots']==list(reversed(PRIMES)), 'interval provenance')
    levels=intervals['intervals']
    need(type(levels) is list and len(levels)==len(PRIMES), 'interval levels')
    for rows in levels:
        need(type(rows) is list and all(type(row) is list and len(row)==2 and nat(row[0],1) and nat(row[1],1) and row[0]<row[1] for row in rows), 'interval row')


def small_only(i,n):
    need(type(n) is dict and n.get('t')=='small' and set(n)=={'t','v','r'}, 'unsupported leaf')
    s,k=n['v'],n['r']
    need(type(s) is list and 3<=len(s)<=9 and all(nat(x,1) for x in s) and s==sorted(set(s)) and nat(k,1) and k<=3, 'small syntax')
    ee=list(edges(s))
    need(bool(ee) and all(any(set(c).isdisjoint(e) for e in ee) for c in itertools.combinations(s,k-1)), 'small demand')
    return s,k


def verify(bank, intervals):
    validate_data(bank, intervals)
    X=max(n for n,_ in EXTERNAL.values())
    profile=[0]*(X+1)
    for p, rows in zip(PRIMES, reversed(intervals['intervals'])):
        diff=[0]*(X+2)
        for a,b in rows:
            if a<=X: diff[a]+=1
            if b<=X: diff[b]-=1
        curr=[0]*(X+1); c=0
        for n in range(1,X+1):
            c+=diff[n]; curr[n]=profile[n]+curr[n//p]+c
        profile=curr
    def leaf(i,n):
        if n['t']=='small': return small_only(i,n)
        need(i in EXTERNAL and n['t']=='externalActive', 'unsupported leaf')
        N, expected=EXTERNAL[i]
        need(profile[N]==expected, 'external profile mismatch')
        def smooth(v):
            for p in PRIMES:
                while v%p==0: v//=p
            return v==1
        s=[v for v in range(1,N+1) if smooth(v)]
        return sorted({v for e in edges(s) for v in e}), expected
    results=interpret(bank['nodes'],bank['images'],leaf)
    need(len(results)==4106, 'incomplete interpretation')
    return results


def main():
    archive=Path(__file__).resolve().parents[1]/'input/erdos302_boundary_certificates_publication.zip'
    bank, intervals=load_archive(archive)
    results=verify(bank, intervals)
    print('Archive SHA-256:', HASH)
    print('Node types:', COUNTS, 'images:',len(bank['images']))
    print('Conditionally interpreted nodes:',len(results))
    print('ASSUMED external bounds (node, n, demand):', [(i,n,k) for i,(n,k) in EXTERNAL.items()])
    print('Not a Lean proof; old-profile bounds, extension/renewal, and final upper bound are not verified.')

if __name__=='__main__':
    try:
        main()
    except (CheckError, ValueError, OSError, zipfile.BadZipFile, lzma.LZMAError) as exc:
        print('REJECTED:', exc, file=sys.stderr)
        sys.exit(1)
