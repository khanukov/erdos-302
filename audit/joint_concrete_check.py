#!/usr/bin/env python3
"""Independent finite computation for the literal Lean source, NOT a Lean proof.

Reads exactly one SHA-256 pinned Lean literal source (not an archive). This
checker is a trusted Python interpretation of the displayed Lean definitions;
it is not a kernel-checked bridge. Run from any working directory.
"""
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
PATH = ROOT / 'audit/ledger-candidate/lean/ArchiveLedger.lean'
DIGEST = '9df0178e0970bbb31eb209853e1dcc69193c3864abe25d1456b6a9cdb3e2457c'
PRIMES = (3, 2, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71)


def load_literal(raw):
    if sha256(raw).hexdigest() != DIGEST:
        raise ValueError('literal Lean source digest mismatch')
    text = raw.decode('utf-8')
    ledger = re.search(r'def ledger : List Level := \[([^]]*)\]', text)
    if not ledger:
        raise ValueError('missing ledger')
    pairs = re.findall(r'⟨(\d+), cells(\d+)⟩', ledger[1])
    if re.sub(r'⟨\d+, cells\d+⟩|[\s,]', '', ledger[1]) or pairs != [(str(p), str(i)) for i, p in enumerate(PRIMES)]:
        raise ValueError('unexpected ledger levels')
    levels = []
    for i in range(20):
        m = re.search(rf'^def cells{i} : List Cell := (.*)$', text, re.M)
        if not m:
            raise ValueError('missing level')
        if m[1] == '[]':
            levels.append([])
            continue
        names = m[1].split(' ++ ')
        if names != [f'cells{i}_chunk{k}' for k in range(len(names))]:
            raise ValueError('bad chunk sequence')
        cells = []
        for name in names:
            chunk = re.search(rf'^def {name} : List Cell := \[([^]]*)\]', text, re.M)
            if not chunk:
                raise ValueError('missing chunk')
            triples = re.findall(r'⟨(\d+),\s*(\d+),\s*(\d+)⟩', chunk[1])
            if re.sub(r'⟨\d+,\s*\d+,\s*\d+⟩|[\s,]', '', chunk[1]):
                raise ValueError('bad literal')
            cells.extend(tuple(map(int, x)) for x in triples)
        levels.append(cells)
    if sum(map(len, levels)) != 4705:
        raise ValueError('incorrect cell occurrence count')
    return levels


def require(condition, message):
    if not condition:
        raise ValueError(message)


def smooth(n, primes):
    require(n > 0, 'smooth input must be positive')
    for p in primes:
        while n % p == 0:
            n //= p
    return n == 1


def weight(levels, n, q):
    total = 0
    hits = []
    for i, cells in enumerate(levels):
        suffix = PRIMES[i:]
        for j, (a, b, h) in enumerate(cells):
            mult = sum(smooth(t, suffix) and a <= n // (q*t) < b
                       for t in range(1, n // q + 1))
            if mult:
                hits.append((i, j, a, b, h, mult))
                total += h * mult
    return total, hits


def graph(n, q):
    vertices = tuple(x for x in range(1, n // q + 1) if smooth(x, PRIMES))
    edges = tuple((a, b, c) for a, b, c in combinations(vertices, 3)
                  if b*c == a*(b+c))
    independent = [v for k in range(len(vertices)+1) for v in combinations(vertices, k)
                   if all(not set(e).issubset(v) for e in edges)]
    return vertices, edges, max(map(len, independent))


def main():
    prime_raw = (ROOT / 'audit/ledger-candidate/lean/LedgerChecker.lean').read_bytes()
    require(sha256(prime_raw).hexdigest() == '84c5f661dd141c80c61820aee749575f3bbe646f9f77bff2ad841281e5ff037d', 'prime source digest mismatch')
    require('def primes : List ℕ := [' + ', '.join(map(str, PRIMES)) + ']' in prime_raw.decode(), 'wrong prime literal')
    levels = load_literal(PATH.read_bytes())
    for n in range(1, 7):
        support = [q for q in range(1, n+1) if all(q % p for p in PRIMES)]
        for q in support:
            w, hits = weight(levels, n, q)
            vertices, edges, alpha = graph(n, q)
            require(alpha + w <= len(vertices), f'independence bound failed: {(n, q, w, alpha)}')
            if n < 6:
                require(w == 0, 'unexpected earlier positive weight')
            else:
                require((q, w, hits) == (1, 1, [(1, 0, 6, 24, 1, 1)]), 'wrong positive hit')
                require((vertices, edges, alpha) == ((1, 2, 3, 4, 5, 6), ((2, 3, 6),), 5), 'wrong graph')
                print(f'N=6 q=1 weight={w} hits={hits} vertices={vertices} edges={edges} alpha={alpha}')
        print(f'N={n} support={support} verified')
    print('20 levels / 4705 occurrences; source SHA-256=' + DIGEST)
    print('Computational result only; no Lean kernel proof or archive provenance claimed.')


if __name__ == '__main__':
    main()
