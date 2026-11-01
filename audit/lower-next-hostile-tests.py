from itertools import combinations

def triples(n):
    return [(a,b,c) for a in range(1,n+1) for b in range(a+1,n+1) for c in range(b+1,n+1) if b*c==a*(b+c)]

def free(A, ts):
    return all(not (a in A and b in A and c in A) for a,b,c in ts)

count=0
for n in range(0,19):
    ts=triples(n)
    O={x for x in range(1,n+1) if x%2 and 4*x<=n}
    assert 8*len(O)>=n-8
    band=[x for x in range(1,n+1) if (3*x>n and 2*x<n and x%2) or 2*x>=n]
    for k in range(len(band)+1):
        for subset in combinations(band,k):
            C=set(subset)
            if free(C,ts):
                assert not C&O
                assert free(C|O,ts), (n,C,O)
                count+=1
print('N=0..18; triple-free band carrier controls:',count,'passed')
print('Known relation 1/2 = 1/3 + 1/6:', (2,3,6) in triples(6))
assert (2,3,6) in triples(6)
