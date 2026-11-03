"""Check the literal boundary witness; this does not establish archive provenance.

Enumerate using the source minus target, not U: U omits unhit edges.
"""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]


def outside_edges(source, outside):
    """All ordered reciprocal edges in source meeting outside (set semantics)."""
    edges = set()
    for v in outside:
        for x in source:
            # v=a or v=b, with the other of a,b equal to x.
            for a, b in ((v, x), (x, v)):
                if 0 < a < b:
                    num, den = a*b, b-a
                    c, rem = divmod(num, den)
                    if not rem and b < c and c in source:
                        edges.add((a,b,c))
            # v=c and x=a. This case is essential.
            a, c = x, v
            if 0 < a < c:
                num, den = a*c, c-a
                b, rem = divmod(num, den)
                if not rem and a < b < c and b in source:
                    edges.add((a,b,c))
    return edges


def boundary(source, target, deletion):
    if not target <= source or not deletion <= source - target:
        return False
    return all(any(v in deletion for v in edge)
               for edge in outside_edges(source, source - target))


def read_witness():
    text = (ROOT / 'lean' / 'ExtensionBoundaryData.lean').read_text()
    def literal(name):
        match = re.search(r'\bdef\s+' + re.escape(name) + r'\s*:\s*Finset\s+ℕ\s*:=\s*\{([^}]*)\}', text, re.S)
        if not match:
            raise ValueError('missing literal ' + name)
        body = match.group(1)
        if not re.fullmatch(r'[\d,\s]*', body):
            raise ValueError('nonliteral data in ' + name)
        numbers = [int(x) for x in re.findall(r'\d+', body)]
        if len(numbers) != len(set(numbers)):
            raise ValueError('duplicate vertex in ' + name)
        return set(numbers)
    return tuple(literal(name) for name in ('source','target','firstDelete'))


if __name__ == '__main__':
    s,t,u = read_witness()
    edges = outside_edges(s,s-t)
    result = boundary(s,t,u)
    print(f'source={len(s)} target={len(t)} outside={len(s-t)} deletion={len(u)} edges={len(edges)} boundary={result}')
    print('Literal-only computation; no archive provenance or Lean kernel proof asserted.')
    raise SystemExit(0 if result else 1)
