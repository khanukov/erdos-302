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


def bounded_occurrences(divisors, n):
    """Mirror Lean's bounded list, including zero-argument dummy entries.

    Each tuple is (level, exponent choices, argument); positions are identities.
    """
    if any(p <= 1 for p in divisors) or n < 0:
        raise ValueError('divisors must exceed one and n must be nonnegative')
    def visit(levels, m):
        if levels == 0:
            return []
        j = levels - 1
        out = []
        for k in range(m):
            arg = m // divisors[j] ** k
            out.extend((level, (k,) + choices, x)
                       for level, choices, x in visit(j, arg))
            out.append((j, (k,), arg))
        return out
    return visit(len(divisors), n)
