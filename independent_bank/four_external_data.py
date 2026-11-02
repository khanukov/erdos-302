"""Independent finite enumeration of external-leaf supports; not a Lean proof."""
import json
from pathlib import Path
from itertools import combinations
import sys
sys.path.insert(0, str(Path(__file__).parent))
from verify_bank import load_archive, validate_data, PRIMES, EXTERNAL
from bank_interpreter import edges as archive_interpreter_edges

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'audit/reciprocal-bridge/FourExternalData.json'

def compute():
    bank, intervals = load_archive(ROOT/'input/erdos302_boundary_certificates_publication.zip')
    validate_data(bank, intervals)
    result = []
    for i, (n, demand) in EXTERNAL.items():
        def smooth(x):
            for p in PRIMES:
                while x % p == 0: x //= p
            return x == 1
        u = [x for x in range(1, n+1) if smooth(x)]
        us = set(u)
        # Independently scan ordered denominator pairs, checking product equality.
        es = [(a,b,c) for b,c in combinations(u,2)
              for a in [b*c//(b+c)]
              if a in us and a*(b+c)==b*c and 0<a<b<c]
        active = sorted(set().union(*map(set, es)))
        # Independent cubic-style scan over candidate a,b with c determined algebraically.
        es2 = set()
        for a,b in combinations(u,2):
            q,r = divmod(a*b,b-a)
            if not r and b<q and q in us: es2.add((a,b,q))
        assert set(es) == es2 == set(archive_interpreter_edges(u))
        assert all(v in us for v in active)
        assert active and set(es) and set(active) == {v for e in es2 for v in e}
        # Dropping any active point necessarily violates edge retention.
        assert all(any(v in e for e in es2) for v in active)
        result.append(dict(node=i,n=n,demand=demand,universe=u,edges=es,active=active))
    return result

def main():
    data=compute()
    text=json.dumps(data,indent=2)+'\n'
    if '--write' in sys.argv: OUT.write_text(text)
    else: assert OUT.read_text()==text, 'finite data differs; regenerate and review'
    for d in data:
        print(d['node'],d['n'],d['demand'],'universe',len(d['universe']),'edges',len(d['edges']),'active',len(d['active']))
    print('Two independent edge enumerations agree; mutations deleting an active vertex fail retention.')
    print('No Lean compilation or proof of archive transcription is claimed.')
if __name__ == '__main__': main()
