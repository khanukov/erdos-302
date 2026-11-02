#!/usr/bin/env python3
"""Transcribe the independently interpreted full bank to conditional Lean data."""
import sys
from math import gcd
from bank_interpreter import edges, need
import mixed_full_export
import verify_bank


def fs(values):
    return '{' + ', '.join(map(str, values)) + '}' if values else '∅'


def raw_image(ref, nodes):
    return [v * ref['mul'] // ref['div'] for v in nodes[ref['source']]['support']]


def case_constraint(image, support, demand):
    image, support = set(image), set(support)
    residual = demand - len(image - support)
    integer = str(residual) if residual >= 0 else f'({residual})'
    return f'({fs(sorted(image & support))}, {integer})'


def trim_normalizer(node, nodes):
    kept = sorted({v for edge in edges(raw_image(node['references'][0], nodes)) for v in edge})
    need(bool(kept), 'empty trim')
    return gcd(*kept)


def render(bank, intervals):
    # Do not trust a caller-supplied projection: reconstruct and check every field.
    doc = mixed_full_export.export(bank, intervals)
    nodes = doc['nodes']
    need(sum(len(n.get('references', [])) for n in nodes) == 623846, 'reference count')
    lines = []
    for n in nodes:
        i, kind, s, k, a = n['id'], n['kind'], n['support'], n['demand'], n['archive']
        refs = n.get('references', [])
        def ref(r, norm):
            need(all(v % norm == 0 for v in raw_image(r, nodes)), 'normalization')
            return f'⟨{r["source"]}, {r["mul"]}, {r["div"] * norm}⟩'
        if kind == 'small':
            rule = '.small'
        elif kind == 'externalActive':
            rule = '.extra (.external)'
        elif kind in ('pack', 'qpack'):
            norm = n['normalizer']
            rows = []
            for r, w in zip(refs, n['weights'], strict=True):
                ref(r, norm)
                rows.append(f'⟨{r["source"]}, {r["mul"]}, {r["div"] * norm}, {w}⟩')
            rule = f'.pack {len(rows)} ![' + ', '.join(rows) + f'] {n["capacity"]}'
        elif kind == 'trim':
            norm = trim_normalizer(n, nodes)
            need([v // norm for v in sorted({v for e in edges(raw_image(refs[0], nodes)) for v in e})] == s, 'trim support')
            rule = f'.extra (.ordinary (.trimRule {ref(refs[0], norm)}))'
        elif kind == 'case':
            norm = gcd(*a['v'])
            need([v // norm for v in a['v']] == s, 'case support')
            constraints = []
            for r in refs:
                ref(r, norm)
                image = {v // norm for v in raw_image(r, nodes)}
                constraints.append(case_constraint(image, s, nodes[r['source']]['demand']))
            tree_data = a['tree']
            def tree(j):
                z = tree_data[j]
                def con(x):
                    need(type(x) is int and 0 <= x < len(constraints), 'constraint index')
                    return constraints[x]
                def child(x):
                    need(type(x) is int and 0 <= x < j, 'tree reference')
                    return tree(x)
                if z[0] == 'budget' and len(z) == 1: return '.budget'
                if z[0] == 'row' and len(z) == 2: return f'.row {con(z[1])}'
                if z[0] == 'force' and len(z) == 3: return f'.force {con(z[1])} ({child(z[2])})'
                if z[0] == 'split' and len(z) == 4:
                    need(type(z[1]) is int and z[1] % norm == 0, 'split normalization')
                    return f'.split {z[1] // norm} ({child(z[2])}) ({child(z[3])})'
                if z[0] == 'dual' and len(z) == 3:
                    return '.dual [' + ', '.join(f'({con(j)}, {w})' for j, w in z[2]) + f'] {z[1]}'
                raise ValueError('unsupported tree rule')
            rule = '.extra (.ordinary (.caseRule [' + ', '.join(ref(r, norm) for r in refs) + f'] ({tree(a["root"])})))'
        else:
            raise ValueError('unsupported node')
        lines.append(f'  | {i} => ⟨{fs(s)}, {k}, {rule}⟩')
    header = '''import MixedCaseTrimCandidate

/- Generated candidate; NOT COMPILED. This is not a proof or provenance theorem.
External bounds are explicit assumptions. Case rows use BankCase.Residual semantics. -/
namespace MixedFullGenerated
inductive Payload where
  | ordinary (value : MixedCaseTrimCandidate.Payload)
  | external

def nodes : ℕ → MixedDag.Node Payload
'''
    footer = '''  | _ => ⟨∅, 0, .small⟩

def projection (ns : ℕ → MixedDag.Node Payload) : ℕ → MixedDag.Node MixedCaseTrimCandidate.Payload :=
  fun i => ⟨(ns i).support, (ns i).demand, .small⟩

def externalBounds : Prop :=
  ∀ i, i ∈ ([1097, 1107, 1112, 1114] : List ℕ) →
    Extended.Bound (nodes i).support (nodes i).demand

def extraCheck (ns : ℕ → MixedDag.Node Payload) (i : ℕ) (p : Payload) : Prop :=
  match p with
  | .ordinary e => MixedCaseTrimCandidate.extraCheck (projection ns) i e
  | .external => i ∈ ([1097, 1107, 1112, 1114] : List ℕ) ∧
      Extended.Bound (ns i).support (ns i).demand

/- This obligation has NOT been discharged; in particular it includes external bounds. -/
def fullTarget : Prop := ∀ i < 4106, MixedDag.Check extraCheck nodes i
end MixedFullGenerated
'''
    return header + '\n'.join(lines) + '\n' + footer


def main():
    if sys.argv[1:]:
        raise SystemExit('usage: python independent_bank/mixed_full_producer.py > MixedFullGenerated.lean')
    path = verify_bank.Path(__file__).resolve().parents[1] / 'input/erdos302_boundary_certificates_publication.zip'
    bank, intervals = verify_bank.load_archive(path)
    text = render(bank, intervals)
    sys.stdout.write(f'/- CLI loaded pinned archive SHA-256 {verify_bank.HASH}; not a provenance proof. -/\n')
    sys.stdout.write(text)


if __name__ == '__main__':
    main()
