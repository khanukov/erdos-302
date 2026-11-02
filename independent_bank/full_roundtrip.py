"""Independent structural transcription check; not a Lean proof or provenance theorem."""
import math
import re

import mixed_full_export
import mixed_full_producer
import verify_bank


def require(ok, message):
    if not ok:
        raise ValueError(message)


def validate_bytes(expected, actual):
    require(actual == expected, 'artifact bytes differ from authenticated regeneration')


def check(bank, intervals, text):
    # Authentication belongs to the Python checker, not to the generated Lean.
    path = verify_bank.Path(__file__).resolve().parents[1] / 'input/erdos302_boundary_certificates_publication.zip'
    pinned_bank, pinned_intervals = verify_bank.load_archive(path)
    require(bank == pinned_bank and intervals == pinned_intervals, 'input is not pinned archive')
    validate_bytes(mixed_full_producer.render(pinned_bank, pinned_intervals), text)
    doc = mixed_full_export.export(pinned_bank, pinned_intervals)
    nodes = doc['nodes']
    header = 'def nodes : ℕ → MixedDag.Node Payload\n'
    footer = '\n  | _ => ⟨∅, 0, .small⟩\n'
    require(text.count(header) == 1 and text.count(footer) == 1, 'definition boundaries')
    lines = text.split(header, 1)[1].split(footer, 1)[0].splitlines()
    require(len(lines) == len(nodes) == 4106, 'arm count')
    references = outside = 0
    def fs(xs):
        return '{' + ', '.join(map(str, xs)) + '}' if xs else '∅'
    for i, (node, line) in enumerate(zip(nodes, lines)):
        require(node['id'] == i, 'node order')
        refs = node.get('references', [])
        references += len(refs)
        typ = node['kind']
        support = node['support']
        if typ == 'small': rule = '.small'
        elif typ == 'externalActive': rule = '.extra (.external)'
        else:
            def image(r):
                vals = nodes[r['source']]['support']
                require(all(v * r['mul'] % r['div'] == 0 for v in vals), 'nonintegral image')
                return [v * r['mul'] // r['div'] for v in vals]
            if typ in ('pack', 'qpack'):
                norm = math.gcd(*(v for r in refs for v in image(r)))
                require(norm == node['normalizer'], 'pack normalizer')
            elif typ == 'case': norm = math.gcd(*node['archive']['v'])
            elif typ == 'trim':
                vals = image(refs[0])
                kept = {x for a in vals for b in vals for c in vals
                        if a < b < c and a*b + a*c == b*c for x in (a,b,c)}
                require(bool(kept), 'empty trim')
                norm = math.gcd(*kept)
                require(sorted(x // norm for x in kept) == support, 'trim support')
            else: raise ValueError('unknown node')
            def ref(r):
                require(all(v % norm == 0 for v in image(r)), 'scale')
                return f'⟨{r["source"]}, {r["mul"]}, {r["div"] * norm}⟩'
            if typ in ('pack', 'qpack'):
                rows = node['archive']['rows']
                denominator = math.lcm(*(r[2] for r in rows)) if typ == 'qpack' else 1
                weights = [r[1] * (denominator // r[2] if typ == 'qpack' else 1) for r in rows]
                capacity = (node['archive']['D'] if typ == 'pack' else 1) * denominator
                entries = [ref(r)[:-1] + f', {w}⟩' for r,w in zip(refs, weights, strict=True)]
                rule = f'.pack {len(entries)} ![' + ', '.join(entries) + f'] {capacity}'
            elif typ == 'trim': rule = f'.extra (.ordinary (.trimRule {ref(refs[0])}))'
            else:
                constraints = []
                for r in refs:
                    img = {v // norm for v in image(r)}
                    removed = img - set(support)
                    outside += bool(removed)
                    residual = nodes[r['source']]['demand'] - len(removed)
                    signed = str(residual) if residual >= 0 else f'({residual})'
                    constraints.append(f'({fs(sorted(img & set(support)))}, {signed})')
                archive = node['archive']
                # Build every reachable occurrence, including repeated subtrees.
                def tree(j):
                    z = archive['tree'][j]
                    if z[0] == 'budget': return '.budget'
                    if z[0] == 'row': return '.row ' + constraints[z[1]]
                    if z[0] == 'force': return f'.force {constraints[z[1]]} ({tree(z[2])})'
                    if z[0] == 'split':
                        require(z[1] % norm == 0, 'split scale')
                        return f'.split {z[1] // norm} ({tree(z[2])}) ({tree(z[3])})'
                    if z[0] == 'dual':
                        return '.dual [' + ', '.join(f'({constraints[k]}, {w})' for k,w in z[2]) + f'] {z[1]}'
                    raise ValueError('unknown tree')
                rule = '.extra (.ordinary (.caseRule [' + ', '.join(ref(r) for r in refs) + f'] ({tree(archive["root"])})))'
        require(line == f'  | {i} => ⟨{fs(support)}, {node["demand"]}, {rule}⟩', f'arm {i}')
    require(references == 623846, 'reference count')
    return {'arms': len(lines), 'references': references, 'outside': outside}
