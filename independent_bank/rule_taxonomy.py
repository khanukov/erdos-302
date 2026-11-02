#!/usr/bin/env python3
"""Fail-closed structural taxonomy of the pinned bank; not a proof checker."""
import collections
import hashlib
import json
import lzma
from pathlib import Path
from archive_seed import SOURCE, SHA256
from replay_inventory import inventory, need, parse_json, index


def analyze(bank):
    # Reuse the structural inventory's complete node/image schema, row and
    # strictly-backward-at-use checks. Extensions are irrelevant here.
    inv = inventory(bank, [])
    nodes, images = bank['nodes'], bank['images']
    kinds = collections.Counter()
    tree_kinds = collections.Counter()
    uses = collections.Counter()
    distances = []
    case_edges = 0
    for i, n in enumerate(nodes):
        t = n['t']; kinds[t] += 1
        if t in ('pack', 'qpack'):
            refs = [r[0] for r in n['rows']]
        elif t == 'trim': refs = [n['ref']]
        elif t == 'case': refs = n['cs']
        else: refs = []
        uses[t] += len(refs)
        for j in refs:
            source = images[j][0]
            index(source, i, 'non-backward reference')
            distances.append(i - source)
        if t != 'case': continue
        tree, cs, root = n['tree'], n['cs'], n['root']
        need(type(tree) is list and tree, 'empty case tree')
        need(type(root) is int and root == len(tree)-1, 'case root')
        reached = set()
        children = []
        for j, z in enumerate(tree):
            need(type(z) is list and z and type(z[0]) is str, 'tree row')
            tag = z[0]; tree_kinds[tag] += 1
            need(tag in {'budget', 'row', 'force', 'split', 'dual'}, 'unknown tree rule')
            need(len(z) == {'budget': 1, 'row': 2, 'force': 3, 'split': 4, 'dual': 3}[tag], 'tree arity')
            ch = []
            if tag in ('row', 'force'): index(z[1], len(cs), 'constraint reference')
            if tag == 'force': ch = [index(z[2], j, 'force child')]
            if tag == 'split':
                need(type(z[1]) is int and z[1] > 0, 'split vertex')
                ch = [index(z[2], j, 'split child'), index(z[3], j, 'split child')]
            if tag == 'dual':
                need(type(z[1]) is int and z[1] > 0 and type(z[2]) is list, 'dual shape')
                seen = set()
                for pair in z[2]:
                    need(type(pair) is list and len(pair) == 2, 'dual pair')
                    k = index(pair[0], len(cs), 'dual constraint')
                    need(k not in seen and type(pair[1]) is int and pair[1] > 0, 'dual weight')
                    seen.add(k)
            children.append(ch); case_edges += len(ch)
        todo = [root]
        while todo:
            j = todo.pop()
            if j not in reached:
                reached.add(j); todo.extend(children[j])
        need(len(reached) == len(tree), 'unreachable case tree node')
    return {'node_count': inv['node_count'], 'image_count': inv['image_count'],
            'node_rules': dict(sorted(kinds.items())), 'case_tree_rules': dict(sorted(tree_kinds.items())),
            'case_tree_edges': case_edges, 'image_uses_by_rule': dict(sorted(uses.items())),
            'image_use_count': len(distances), 'max_backward_distance': max(distances, default=0)}


def load():
    raw = SOURCE.read_bytes()
    need(hashlib.sha256(raw).hexdigest() == SHA256, 'bank SHA-256 mismatch')
    return parse_json(lzma.decompress(raw))


if __name__ == '__main__':
    result = analyze(load())
    result['bank_sha256'] = SHA256
    print(json.dumps(result, indent=2, sort_keys=True))
