#!/usr/bin/env python3
"""Python-only preflight for the actual node 1209 pack (not a Lean proof).

Re-extract the pinned bank, bind the literal Lean candidate byte-for-byte, and
check every occurrence and capacity.  This is a diagnostic for later Lean
shards, not an axiom gate or a substitute for their kernel verification.
"""
import collections
from pathlib import Path

import node1209_closure
import node1209_scope

ROOT = Path(__file__).resolve().parents[1]


def check(doc):
    nodes = doc['nodes']
    root = nodes[-1]
    raw = root['raw_node']
    if root['original'] != 1209 or raw['t'] != 'pack' or raw['D'] != 1001 or root['demand'] != 258:
        raise ValueError('wrong root, capacity, or demand')
    rows, refs = raw['rows'], root['references']
    if len(rows) != 510 or len(refs) != 510:
        raise ValueError('wrong occurrence count')
    support = root['support']
    if len(support) != 901 or support != sorted(set(support)):
        raise ValueError('wrong support inventory')
    loads = collections.Counter()
    objective = 0
    for (image, weight), ref in zip(rows, refs):
        if image != ref['image'] or type(weight) is not int or weight < 0:
            raise ValueError('row occurrence or weight mismatch')
        index = ref['dense_source']
        if type(index) is not int or not 0 <= index < len(nodes)-1:
            raise ValueError('invalid source index')
        source = nodes[index]
        if source['original'] != ref['original_source']:
            raise ValueError('source identity mismatch')
        m, d = ref['mul'], ref['div']
        if type(m) is not int or type(d) is not int or m <= 0 or d <= 0:
            raise ValueError('invalid scale')
        images = []
        for x in source['support']:
            q, rem = divmod(x*m, d)
            if rem:
                raise ValueError('nonintegral image')
            images.append(q)
        for x in set(images):
            loads[x] += weight
        objective += weight * source['demand']
    if set(loads) != set(support):
        raise ValueError('row image union differs from support')
    if any(v > 1001 for v in loads.values()):
        raise ValueError('capacity exceeded')
    if objective <= 1001 * (258 - 1):
        raise ValueError('strict rounding inequality failed')
    return {'rows': len(rows), 'vertices': len(support), 'max_load': max(loads.values()),
            'objective': objective, 'threshold': 1001 * (258 - 1)}


def main():
    # Both are independently re-generated from the SHA-256-pinned source.
    node1209_closure.verify()
    text, stats = node1209_scope.generate()
    if (ROOT / 'lean/Node1209SourceCandidate.lean').read_bytes() != text.encode('utf-8'):
        raise ValueError('Lean literal bytes differ from pinned replay')
    if stats['normalizer'] != 1:
        raise ValueError('unexpected root normalizer')
    import json
    print(json.dumps(check(node1209_closure.extract()), sort_keys=True))
    print('Python preflight only: no Lean pack validity or axiom gate has been run')


if __name__ == '__main__':
    main()
