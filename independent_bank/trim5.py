#!/usr/bin/env python3
"""Reify only pinned prefix node 5; reject unsupported or altered inputs."""
from pathlib import Path
from math import gcd
import sys
import archive_prefix
import case4_staged
from bank_interpreter import edges, interpret
from verify_bank import small_only

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'lean/ArchiveTrim5.lean'
TEMPLATE = ROOT / 'independent_bank/trim5.lean.template'

def translate(bank):
    try:
        staged = case4_staged.render(bank)  # validates transitive case data
        if staged != case4_staged.TARGET.read_text():
            raise ValueError('case 4 staged proof transcription mismatch')
        if archive_prefix.render_prefix(bank, 4) != (ROOT / 'lean/ArchiveSmallPrefix.lean').read_text():
            raise ValueError('small prefix transcription mismatch')
        nodes, images = bank['nodes'], bank['images']
        if nodes[5] != {'t': 'trim', 'ref': 3} or type(nodes[5]['ref']) is not int:
            raise ValueError('unsupported trim node')
        image = images[3]
        if type(image) is not list or len(image) != 3 or any(type(x) is not int for x in image) or image != [4,1,1]:
            raise ValueError('unsupported trim image')
        out = interpret(nodes[:6], images, small_only)
        source, demand = out[4]
        active = sorted({v for edge in edges(source) for v in edge})
        if not active or gcd(*active) != 1 or tuple(active) != out[5][0] or out[5][1] != demand:
            raise ValueError('normalization or demand mismatch')
        return {'support': active, 'demand': demand, 'removed': sorted(set(source)-set(active)), 'image': image}
    except (KeyError, IndexError, TypeError, ValueError) as exc:
        raise ValueError('node 5 translation rejected: ' + str(exc)) from exc

def render(bank):
    d = translate(bank)
    vals = ', '.join(map(str, d['support']))
    return TEMPLATE.read_text().replace('@SUPPORT@', vals).replace('@DEMAND@', str(d['demand']))

def main():
    result = render(archive_prefix.load_bank())
    args = sys.argv[1:]
    if args == ['--write']:
        import os, tempfile
        fd, name = tempfile.mkstemp(dir=TARGET.parent, prefix='.trim5-')
        try:
            with os.fdopen(fd, 'w') as f: f.write(result)
            os.replace(name, TARGET)
        finally:
            if os.path.exists(name): os.unlink(name)
    elif not args:
        if TARGET.read_text() != result: raise ValueError('generated source differs')
        print('node 5 transcription matches pinned bank')
    else:
        raise ValueError('usage: trim5.py [--write]')

if __name__ == '__main__': main()
