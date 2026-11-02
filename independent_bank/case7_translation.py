"""Fail-closed transcription of archive case 7; not a Lean archive proof."""
import json
from pathlib import Path
import sys

import archive_prefix
from bank_interpreter import interpret
from case_translation import render as render_case4
from verify_bank import small_only

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'lean/ArchiveCase7.lean'
EXPECTED_CASE = {'t': 'case', 'v': [2,3,4,5,6,7,8,10,12,14,15,16,20,21,24,28,30],
                 'r': 4, 'cs': [4,0,5,6],
                 'tree': [['dual',100000000,[[0,100000000],[1,100000000],
                                                   [2,100000000],[3,100000000]]]], 'root': 0}
EXPECTED_IMAGES = [[0,1,1], [2,1,1], [0,5,1], [6,1,1]]
EXPECTED_SOURCES = [{'t':'small','v':[2,3,6],'r':1},
                    {'t':'small','v':[4,5,20],'r':1},
                    {'t':'small','v':[12,21,28],'r':1}]

def translate_pinned_dual(bank, index, expected_case, expected_images, expected_sources, source_indices):
    """Transcribe a pinned single-dual case; output must still be kernel checked."""
    try:
        nodes, images = bank['nodes'], bank['images']
        n = nodes[index]
        # JSON comparison rejects bool/int equivalence, extra keys, and reordered fields in lists.
        actual = [n, [images[i] for i in expected_case['cs']], [nodes[i] for i in source_indices]]
        expected = [expected_case, expected_images, expected_sources]
        canonical = lambda x: json.dumps(x, sort_keys=True, separators=(',', ':'), allow_nan=False)
        if canonical(actual) != canonical(expected):
            raise ValueError('case 7 or referenced image/source differs from pinned input')
        # Check complete dependency prefix; small_only is a computational oracle, not a proof.
        if (n['t'] != 'case' or len(n['tree']) != 1 or n['root'] != 0
                or n['tree'][0][0] != 'dual'
                or sorted(set(row[0] for row in expected_images)) != sorted(source_indices)
                or any(source.get('t') != 'small' for source in expected_sources)):
            raise ValueError('unsupported tree or incomplete source pin')
        out = interpret(nodes[:index+1], images, small_only)
        target, demand = out[index]
        if list(target) != n['v'] or demand != n['r']:
            raise ValueError('normalized target mismatch')
        rows = []
        for j in n['cs']:
            source, m, d = images[j]
            support, r = out[source]
            image = {v*m//d for v in support}
            rows.append((sorted(image & set(target)), r-len(image-set(target))))
        return {'support':list(target), 'demand':demand, 'rows':rows,
                'image_refs':[(j,*images[j]) for j in n['cs']],
                'source_nodes':[(i,list(out[i][0]),out[i][1]) for i in source_indices],
                'entries':[(i,w) for i,w in n['tree'][0][2]],
                'denominator':n['tree'][0][1]}
    except (KeyError, IndexError, TypeError) as exc:
        raise ValueError('malformed bank') from exc

def translate(bank):
    return translate_pinned_dual(bank, 7, EXPECTED_CASE, EXPECTED_IMAGES,
                                 EXPECTED_SOURCES, [0, 2, 6])

def render(data):
    return (render_case4(data).replace('archive node 4', 'archive node 7')
            .replace('ArchiveCase4', 'ArchiveCase7'))

def main():
    result = render(translate(archive_prefix.load_bank()))
    if sys.argv[1:] == ['--write']:
        TARGET.write_text(result)
    elif not sys.argv[1:]:
        if TARGET.read_text() != result:
            raise ValueError('case 7 Lean transcription differs')
        print('case 7 source matches pinned archive transcription')
    else:
        raise ValueError('usage: case7_translation.py [--write]')

if __name__ == '__main__':
    main()
