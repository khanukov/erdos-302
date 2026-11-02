"""Finite reference model; this is not a formal proof or archive verification."""

def values(primes, d, limit):
    if any(p <= 1 for p in primes):
        raise ValueError('divisors must exceed one')
    rows = [[0] * (limit + 1)]
    for j, p in enumerate(primes):
        row = [0] * (limit + 1)
        for n in range(1, limit + 1):
            row[n] = rows[-1][n] + row[n // p] + d(j, n)
        rows.append(row)
    return rows


def occurrences(primes, n):
    if any(p <= 1 for p in primes):
        raise ValueError('divisors must exceed one')
    def visit(level, m, factor):
        if level < 0 or m == 0:
            return []
        out = []
        p = primes[level]
        while m:
            out.append((level, factor))
            out.extend(visit(level - 1, m, factor))
            m //= p
            factor *= p
        return out
    return visit(len(primes)-1, n, 1)


def hcover(heights, multiplicities, counts):
    if len(heights) != len(multiplicities) or len(counts) != len(heights):
        raise ValueError('cell count mismatch')
    if any(x < 0 for x in heights + counts) or any(x < 0 for row in multiplicities for x in row):
        raise ValueError('negative data')
    if any(sum(row) != count for row, count in zip(multiplicities, counts)):
        raise ValueError('per-cell matching fails')
    return sum(h * count for h, count in zip(heights, counts))
