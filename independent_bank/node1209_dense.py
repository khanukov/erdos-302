#!/usr/bin/env python3
"""Generate a candidate dense MixedDag and transport the standalone small checks.

Python performs all archive translation and is not part of Lean's kernel proof.
Only the pinned extraction path is used when writing/checking artifacts.
"""
import argparse
from pathlib import Path
import node1209_closure as closure

OUT = closure.OUT / 'Dense.lean'

def finset(xs):
    return '{' + ', '.join(str(x) for x in xs) + '}' if xs else '∅'

def generate(doc):
    nodes = doc['nodes']
    if len(nodes) != 376:
        raise ValueError('node inventory')
    lines = ['import MixedCaseTrimCandidate\n'] + [f'import Small{i:02}\n' for i in range(23)]
    lines += ['\nnamespace Node1209Dense\n', 'set_option maxRecDepth 16384\n', 'set_option maxHeartbeats 16000000\n',
              'def nodes : ℕ → MixedDag.Node MixedCaseTrimCandidate.Payload\n']
    small = []
    for i, n in enumerate(nodes):
        raw, refs = n['raw_node'], n['references']
        ids = closure.references(raw)
        if len(ids) != len(refs) or ids != [r['image'] for r in refs]:
            raise ValueError('reference occurrence mismatch')
        for r in refs:
            j = r['dense_source']
            if type(j) is not int or not 0 <= j < i or nodes[j]['original'] != r['original_source']:
                raise ValueError('external or non-backward reference')
        def ref(r):
            return f"⟨{r['dense_source']}, {r['mul']}, {r['div']}⟩"
        t = raw['t']
        if t == 'small':
            rule = '.small'
            small.append((i, n['original']))
        elif t == 'trim':
            rule = f'.extra (.trimRule {ref(refs[0])})'
        elif t == 'case':
            if raw['root'] != 0 or len(raw['tree']) != 1 or raw['tree'][0][0] != 'dual':
                raise ValueError('unsupported case tree')
            _, denom, weights = raw['tree'][0]
            target = set(n['support'])
            rows = []
            for pos, weight in weights:
                if type(pos) is not int or not 0 <= pos < len(refs):
                    raise ValueError('bad dual occurrence')
                r = refs[pos]; src = nodes[r['dense_source']]
                if r['div'] <= 0 or any(x * r['mul'] % r['div'] for x in src['support']):
                    raise ValueError('nonintegral image')
                image = {x * r['mul'] // r['div'] for x in src['support']}
                residual = src['demand'] - len(image - target)
                rows.append(f"(({finset(sorted(image & target))}, ({residual} : ℤ)), ({weight} : ℤ))")
            rule = '.extra (.caseRule [' + ', '.join(map(ref, refs)) + '] (.dual [' + ', '.join(rows) + f'] {denom}))'
        elif t == 'pack':
            if len(raw['rows']) != len(refs):
                raise ValueError('pack occurrence mismatch')
            rows = [f"⟨{r['dense_source']}, {r['mul']}, {r['div']}, {row[1]}⟩" for row,r in zip(raw['rows'], refs)]
            rule = f".pack {len(rows)} ![" + ', '.join(rows) + f"] {raw['D']}"
        else:
            raise ValueError('unsupported or external rule')
        lines.append(f"  | {i} => ⟨{finset(n['support'])}, {n['demand']}, {rule}⟩\n")
    if len(small) != 368:
        raise ValueError('small inventory')
    lines.append('  | _ => ⟨∅, 0, .small⟩\n\n')
    for i, original in small:
        lines += [f'theorem check{i} : MixedDag.Check MixedCaseTrimCandidate.extraCheck nodes {i} := by\n',
                  f'  exact Node1209Small.node{original}\n', f'#print axioms check{i}\n']
    lines.append('end Node1209Dense\n')
    return ''.join(lines)

def main():
    p = argparse.ArgumentParser(); p.add_argument('--check', action='store_true'); args = p.parse_args()
    text = generate(closure.extract())
    if args.check:
        if OUT.read_bytes() != text.encode(): raise ValueError('dense bytes mismatch')
    else:
        OUT.write_text(text)
    print('PASS dense generation (Python conversion trusted, not kernel provenance)')

if __name__ == '__main__': main()
