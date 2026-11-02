#!/usr/bin/env python3
"""Transcribe the interpreted archive prefix into candidate Lean data, not a proof."""
import math
import sys
from fractions import Fraction
from functools import reduce

import archive_prefix
import mixed_prefix_export


def require(ok, message):
    if not ok:
        raise ValueError(message)


def reference_count(doc):
    return sum(len(n.get('references', n.get('rows', []))) for n in doc['nodes'])


def fs(xs):
    return '{' + ', '.join(map(str, xs)) + '}' if xs else '∅'


def render(doc):
    require(doc.get('format') == 'erdos302-mixed-prefix-data-v1', 'format')
    nodes = doc['nodes']
    require(doc['count'] == len(nodes) == 1091, 'count')
    require(reference_count(doc) == 371, 'reference occurrence count')
    lines = []
    for i, n in enumerate(nodes):
        require(n['id'] == i, 'node order')
        s, k = n['support'], n['demand']
        require(type(s) is list and s == sorted(set(s)) and s and all(type(v) is int and v > 0 for v in s), 'support')
        require(type(k) is int and 0 < k <= len(s), 'demand')
        kind = n['kind']
        refs = n.get('references', n.get('rows', []))
        def image(r, normalizer=1):
            j, m, d = r['source'], r['mul'], r['div'] * normalizer
            require(all(type(v) is int for v in (j, m, d)) and 0 <= j < i and m > 0 and d > 0, 'invalid backward reference')
            require(all(v*m % d == 0 for v in nodes[j]['support']), 'nonintegral image')
            return [v*m//d for v in nodes[j]['support']]
        def ref(r, normalizer=1):
            image(r, normalizer)
            return f'⟨{r["source"]}, {r["mul"]}, {r["div"] * normalizer}⟩'
        if kind == 'basic':
            require(n['archive'].get('t') == 'small', 'unsupported basic')
            rule = '.small'
        elif kind == 'pack':
            require(n.get('archive_type') == 'qpack' and refs, 'unsupported pack')
            norm = n['normalizer']
            require(type(norm) is int and norm > 0, 'normalizer')
            denominator = math.lcm(*(r['denominator'] for r in refs))
            rows = []
            for r in refs:
                image(r, norm)
                w = Fraction(r['numerator'], r['denominator']) * denominator
                require(w.denominator == 1 and w > 0, 'weight')
                rows.append(f'⟨{r["source"]}, {r["mul"]}, {r["div"]*norm}, {w.numerator}⟩')
            rule = f'.pack {len(rows)} ![' + ', '.join(rows) + f'] {denominator}'
        elif kind == 'trim_placeholder':
            require(n['archive'].get('t') == 'trim' and len(refs) == 1 and n['archive']['ref'] == refs[0]['image'], 'trim fields')
            # Recover normalization from the represented source image.
            raw = image(refs[0]); edges = [(a,b,c) for a in raw for b in raw for c in raw if a < b < c and a*b+a*c == b*c]
            kept = sorted({v for edge in edges for v in edge})
            require(kept, 'empty trim')
            norm = reduce(math.gcd, kept)
            require([v//norm for v in kept] == s, 'trim support mismatch')
            rule = f'.extra (.trimRule {ref(refs[0], norm)})'
        elif kind == 'case_placeholder':
            a = n['archive']
            require(a.get('t') == 'case' and [r['image'] for r in refs] == a['cs'], 'case references')
            norm = reduce(math.gcd, a['v'])
            require([v//norm for v in a['v']] == s and a['r'] == k, 'case support')
            constraints = []
            for r in refs:
                im = image(r, norm)
                require(set(im) <= set(s), 'candidate case requires image subset')
                constraints.append(f'({fs(im)}, {nodes[r["source"]]["demand"]})')
            trees = a['tree']
            require(a['root'] == len(trees)-1 and trees, 'case root')
            def tree(j):
                require(type(j) is int and 0 <= j < len(trees), 'tree reference')
                z = trees[j]; tag = z[0]
                def child(x):
                    require(type(x) is int and 0 <= x < j, 'tree backward reference')
                    return tree(x)
                def con(x):
                    require(type(x) is int and 0 <= x < len(constraints), 'constraint index')
                    return constraints[x]
                if tag == 'budget' and len(z) == 1: return '.budget'
                if tag == 'row' and len(z) == 2: return f'.row {con(z[1])}'
                if tag == 'force' and len(z) == 3: return f'.force {con(z[1])} ({child(z[2])})'
                if tag == 'split' and len(z) == 4:
                    require(type(z[1]) is int and z[1] % norm == 0, 'split normalization')
                    return f'.split {z[1]//norm} ({child(z[2])}) ({child(z[3])})'
                if tag == 'dual' and len(z) == 3:
                    require(type(z[1]) is int and z[1] > 0, 'dual denominator')
                    entries = []
                    for index, weight in z[2]:
                        require(type(weight) is int and weight > 0, 'dual weight')
                        entries.append(f'({con(index)}, {weight})')
                    return '.dual [' + ', '.join(entries) + f'] {z[1]}'
                raise ValueError('unsupported tree rule')
            rule = '.extra (.caseRule [' + ', '.join(ref(r, norm) for r in refs) + f'] ({tree(a["root"])}))'
        else:
            raise ValueError('unsupported rule')
        lines.append(f'⟨{fs(s)}, {k}, {rule}⟩')
    out = ['import MixedCaseTrimCandidate', '', '/- Generated candidate data; NOT COMPILED. No archive provenance is established by render. The theorem below is conditional on prefixTarget. -/',
           'namespace MixedPrefixGenerated', 'open MixedCaseTrimCandidate',
           'def nodes : ℕ → MixedDag.Node Payload', '  | 0 => ' + lines[0]]
    out.extend(f'  | {i} => {lines[i]}' for i in range(1, 1091))
    out.append('  | _ => ⟨∅, 0, .small⟩')
    out.extend(['', '/- Exact checker obligation: no claim that it has been discharged. -/',
                'def prefixTarget : Prop := ∀ i < 1091, MixedDag.Check extraCheck nodes i',
                '', 'theorem prefix_target (checked : prefixTarget) :',
                '    Extended.Bound (nodes 1090).support (nodes 1090).demand := by',
                '  exact MixedCaseTrimCandidate.sound nodes 1091 checked 1090 (by decide)',
                '', 'end MixedPrefixGenerated', ''])
    return '\n'.join(out)


def main():
    if sys.argv[1:]:
        raise SystemExit('usage: python independent_bank/mixed_lean_producer.py > lean/MixedPrefixGenerated.lean')
    doc = mixed_prefix_export.export(archive_prefix.load_bank())
    sys.stdout.write(f'/- CLI loaded pinned archive SHA-256 {archive_prefix.SHA256}; transcription is not a provenance proof. -/\n')
    sys.stdout.write(render(doc))


if __name__ == '__main__':
    main()
