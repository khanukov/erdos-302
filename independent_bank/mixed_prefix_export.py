#!/usr/bin/env python3
"""Export a finite, data-only mixed prefix; no Lean constructors are asserted."""
import collections
import json
import sys
from math import gcd

import archive_prefix
from bank_interpreter import interpret, need
from verify_bank import small_only

COUNT = 1091
EXPECTED = {'basic': 1080, 'case_placeholder': 7, 'trim_placeholder': 3, 'pack': 1}


def export(bank):
    need(type(bank) is dict and set(bank) == {'schema', 'nodes', 'images', 'roots'}, 'bank fields')
    need(bank['schema'] == 'erdos302-standalone-finite-proof-bank-v1', 'bank schema')
    nodes, images = bank['nodes'], bank['images']
    need(type(nodes) is list and len(nodes) >= COUNT and type(images) is list, 'prefix coverage')
    prefix = nodes[:COUNT]
    kinds = {'small': 'basic', 'case': 'case_placeholder', 'trim': 'trim_placeholder', 'qpack': 'pack'}
    for i, node in enumerate(prefix):
        need(type(node) is dict and type(node.get('t')) is str and node['t'] in kinds, f'unsupported node {i}')
    need(dict(collections.Counter(kinds[n['t']] for n in prefix)) == EXPECTED, 'prefix taxonomy coverage')
    # This independently evaluates the source semantics, including backward edges and
    # case trees. Its output is transcription data, not a proof or Lean replay.
    evaluated = interpret(prefix, images, small_only)
    result = []
    for i, (node, (support, demand)) in enumerate(zip(prefix, evaluated)):
        kind = kinds[node['t']]
        def reference(j):
            src, mul, div = images[j]
            return {'image': j, 'source': src, 'mul': mul, 'div': div}
        item = {'id': i, 'kind': kind, 'support': list(support), 'demand': demand}
        if kind == 'basic':
            item['archive'] = node
        elif kind == 'pack':
            item['archive_type'] = node['t']
            item['rows'] = [dict(reference(j), numerator=num, denominator=den) for j, num, den in node['rows']]
            # Interpret normalizes the union of image supports by this gcd.
            vertices = [v * r['mul'] // r['div'] for r in item['rows'] for v in evaluated[r['source']][0]]
            item['normalizer'] = gcd(*vertices)
        else:
            item['archive'] = node
            indices = node['cs'] if kind == 'case_placeholder' else [node['ref']]
            item['references'] = [reference(j) for j in indices]
        result.append(item)
    return {'format': 'erdos302-mixed-prefix-data-v1', 'count': COUNT, 'counts': EXPECTED, 'nodes': result}


def render(bank):
    return _serialize(export(bank))


def _serialize(doc):
    return json.dumps(doc, sort_keys=True, separators=(',', ':'), ensure_ascii=True) + '\n'


def main():
    if sys.argv[1:]:
        raise SystemExit('usage: python independent_bank/mixed_prefix_export.py > output.json')
    doc = export(archive_prefix.load_bank())
    doc['source_sha256'] = archive_prefix.SHA256
    sys.stdout.write(_serialize(doc))


if __name__ == '__main__':
    main()
