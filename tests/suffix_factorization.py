"""Small finite reference model, not an archive proof."""
from math import gcd, isqrt, prod

def raw_cell_count(n, a, b, prefix):
    div = lambda x, y: x // y if y else 0  # Lean Nat.div by zero
    return sum(div(n, b) < m <= div(n, a) and gcd(m, prod(prefix)) == 1
               for m in range(n + 1))

def raw_pair_count(n, a, b, prefix, suffix):
    def is_prime(p):
        return p >= 2 and all(p % d for d in range(2, isqrt(p) + 1))
    def rough(q, primes):
        return all(q % p for p in primes if is_prime(p))
    def smooth(t):
        return all(t % p != 0 or p in suffix for p in range(2, t + 1) if is_prime(p))
    return sum(rough(q, set(prefix + suffix)) and smooth(t)
               and a <= n // (q * t) < b
               for q in range(1, n + 1) for t in range(1, n // q + 1))

def validate(prefix, suffix):
    values = prefix + suffix
    if len(set(values)) != len(values) or any(
        p < 2 or any(p % d == 0 for d in range(2, isqrt(p) + 1)) for p in values
    ):
        raise ValueError('prime lists must be disjoint and distinct')

def split(m, suffix):
    validate([], suffix)
    if m <= 0:
        raise ValueError('positive input required')
    q, t = m, 1
    for p in suffix:
        while q % p == 0:
            q //= p
            t *= p
    return q, t

def cell_count(n, a, b, prefix):
    validate(prefix, [])
    if n < 0 or a <= 0 or b <= 0:
        raise ValueError('invalid bound')
    return sum(n // b < m <= n // a and gcd(m, prod(prefix)) == 1
               for m in range(1, n + 1))

def multiplicities(n, a, b, prefix, suffix):
    validate(prefix, suffix)
    if n < 0 or a <= 0 or b <= 0:
        raise ValueError('invalid bound')
    all_product = prod(prefix + suffix)
    result = {}
    for q in range(1, n + 1):
        if gcd(q, all_product) != 1:
            continue
        result[q] = sum(split(t, suffix)[0] == 1 and a <= n // (q * t) < b
                        for t in range(1, n // q + 1))
    return result
