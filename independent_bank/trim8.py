#!/usr/bin/env python3
"""Pinned node-8 trim transcription; archive correspondence is external to Lean."""
import hashlib
from math import gcd
from pathlib import Path
import sys
import archive_prefix
import case7_translation
from bank_interpreter import edges, interpret
from verify_bank import small_only

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'lean/ArchiveTrim8.lean'
TEMPLATE = ROOT / 'independent_bank/trim8.lean.template'
STAGED_SHA256 = '5d829ca71756c3b0e799fdad0f16d44cb3632c343605db0e3a21ebbfee16fedc'

def translate(bank):
    try:
        case7 = case7_translation.translate(bank)
        if case7_translation.render(case7) != case7_translation.TARGET.read_text():
            raise ValueError('case 7 data differs')
        if archive_prefix.render_prefix(bank, 4) != archive_prefix.TARGET.read_text():
            raise ValueError('small prefix differs')
        if hashlib.sha256((ROOT / 'lean/ArchiveCase7Staged.lean').read_bytes()).hexdigest() != STAGED_SHA256:
            raise ValueError('case 7 proof bytes differ')
        nodes, images = bank['nodes'], bank['images']
        if nodes[8] != {'t': 'trim', 'ref': 7} or type(nodes[8]['ref']) is not int:
            raise ValueError('unsupported trim node')
        image = images[7]
        if type(image) is not list or len(image) != 3 or any(type(x) is not int for x in image) or image != [7, 1, 1]:
            raise ValueError('unsupported trim image')
        out = interpret(nodes[:9], images, small_only)
        source, demand = out[7]
        active = sorted({v for edge in edges(source) for v in edge})
        if not active or gcd(*active) != 1 or tuple(active) != out[8][0] or out[8][1] != demand:
            raise ValueError('normalization or demand mismatch')
        return {'support': active, 'demand': demand,
                'removed': sorted(set(source) - set(active)), 'image': image}
    except (KeyError, IndexError, TypeError, ValueError) as exc:
        raise ValueError('node 8 translation rejected: ' + str(exc)) from exc

def render(bank):
    data = translate(bank)
    return TEMPLATE.read_text().replace('@SUPPORT@', ', '.join(map(str, data['support']))).replace('@DEMAND@', str(data['demand']))

def main():
    result = render(archive_prefix.load_bank())
    if sys.argv[1:] == ['--write']:
        TARGET.write_text(result)
    elif not sys.argv[1:]:
        if TARGET.read_text() != result:
            raise ValueError('generated source differs')
        print('node 8 transcription matches pinned bank')
    else:
        raise ValueError('usage: trim8.py [--write]')

if __name__ == '__main__': main()
