#!/usr/bin/env python3
"""Gate the whole staged closure against its upstream and reviewed edits."""
import hashlib
import importlib.util
from pathlib import Path
import re
import sys

spec = importlib.util.spec_from_file_location('compat', Path(__file__).with_name('compat.py'))
compat = importlib.util.module_from_spec(spec)
spec.loader.exec_module(compat)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def verify(source, staged, transformations):
    names = (staged / 'closure.txt').read_text().splitlines()
    if not names or len(names) != len(set(names)) or any(not re.fullmatch(r'[A-Za-z_][A-Za-z_0-9]*(?:\.[A-Za-z_][A-Za-z_0-9]*)*', n) for n in names):
        raise ValueError('invalid closure inventory')
    paths = {n.replace('.', '/') + '.lean' for n in names}
    if not transformations.keys() <= paths:
        raise ValueError('transformation missing from closure')
    actual = {p.relative_to(staged).as_posix() for p in staged.rglob('*.lean')}
    if actual != paths:
        raise ValueError('staged source inventory mismatch')
    for name in sorted(paths):
        original = (source / name).read_bytes()
        result = (staged / name).read_bytes()
        if name in transformations:
            before, after = transformations[name]
            if sha(original) != before or sha(result) != after:
                raise ValueError('transformed source digest mismatch: ' + name)
        elif original != result:
            raise ValueError('unreviewed staged source change: ' + name)
    print(f'verified {len(paths)} staged source files, {len(transformations)} reviewed transformations')


def transformations():
    c = compat
    return {
        'Erdos302ReflectiveLeafFC.lean': (c.ORIGINAL_SHA256, c.TRANSFORMED_SHA256),
        'Erdos302RLGroup0027FC.lean': (c.GROUP_ORIGINAL_SHA256, c.GROUP_TRANSFORMED_SHA256),
        'Erdos302RLGroup0029FC.lean': (c.GROUP29_ORIGINAL_SHA256, c.GROUP29_TRANSFORMED_SHA256),
        'Erdos302RLGroup0030FC.lean': (c.GROUP30_ORIGINAL_SHA256, c.GROUP30_TRANSFORMED_SHA256),
        'Erdos302RLGroup0174FC.lean': (c.GROUP174_ORIGINAL_SHA256, c.GROUP174_TRANSFORMED_SHA256),
        'Erdos302RLGroup0175FC.lean': (c.GROUP175_ORIGINAL_SHA256, c.GROUP175_TRANSFORMED_SHA256),
    }


if __name__ == '__main__':
    if len(sys.argv) != 3:
        raise SystemExit('usage: verify_staged_hashes.py UPSTREAM_SOURCE STAGED')
    verify(Path(sys.argv[1]), Path(sys.argv[2]), transformations())
