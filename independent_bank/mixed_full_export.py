#!/usr/bin/env python3
"""Export all actual bank nodes as data; external leaf bounds remain assumptions.

This is not a Lean producer, a proof, or a byte-to-Lean provenance theorem.
"""
import collections
import copy
import json
import sys
from math import gcd, lcm

import verify_bank
from bank_interpreter import need


def export(bank, intervals):
    # Reject values that compare equal to integers (notably bool and float)
    # before the interpreter performs any set membership or equality tests.
    pending = [bank, intervals]
    while pending:
        value = pending.pop()
        if type(value) is dict:
            need(all(type(k) is str for k in value), 'non-string object key')
            pending.extend(value.values())
        elif type(value) is list:
            pending.extend(value)
        else:
            need(type(value) in (int, str), 'non-exact JSON scalar')
    evaluated = verify_bank.verify(bank, intervals)
    nodes, images = bank['nodes'], bank['images']
    result = []
    for i, (node, (support, demand)) in enumerate(zip(nodes, evaluated)):
        typ = node['t']
        item = {'id': i, 'kind': typ, 'support': list(support),
                'demand': demand, 'archive': copy.deepcopy(node)}
        if typ in ('pack', 'qpack'):
            indices = [r[0] for r in node['rows']]
        elif typ == 'case':
            indices = node['cs']
        elif typ == 'trim':
            indices = [node['ref']]
        else:
            indices = []
        refs = []
        for j in indices:
            source, mul, div = images[j]
            refs.append({'image': j, 'source': source, 'mul': mul, 'div': div})
        if refs:
            item['references'] = refs
        if typ in ('pack', 'qpack'):
            raw = [v*r['mul']//r['div'] for r in refs for v in evaluated[r['source']][0]]
            normalizer = gcd(*raw)
            denominator = lcm(*(row[2] for row in node['rows'])) if typ == 'qpack' else 1
            item['normalizer'] = normalizer
            item['capacity'] = (node['D'] if typ == 'pack' else 1) * denominator
            item['weights'] = [row[1] * (denominator // row[2] if typ == 'qpack' else 1)
                               for row in node['rows']]
        if typ == 'externalActive':
            item['assumed_external_bound'] = {'n': node['n'], 'demand': demand}
        result.append(item)
    need(len(result) == 4106, 'incomplete export')
    return {'format': 'erdos302-mixed-full-data-v1', 'count': len(result),
            'counts': dict(sorted(collections.Counter(n['kind'] for n in result).items())),
            'external_bounds_are_assumptions': True, 'nodes': result}


def main():
    if sys.argv[1:]:
        raise SystemExit('usage: python independent_bank/mixed_full_export.py > output.json')
    path = verify_bank.Path(__file__).resolve().parents[1] / 'input/erdos302_boundary_certificates_publication.zip'
    bank, intervals = verify_bank.load_archive(path)
    doc = export(bank, intervals)
    doc['source_archive_sha256'] = verify_bank.HASH
    print(json.dumps(doc, sort_keys=True, separators=(',', ':')))


if __name__ == '__main__':
    main()
