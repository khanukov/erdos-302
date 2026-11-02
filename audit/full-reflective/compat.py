#!/usr/bin/env python3
"""Apply the one reviewed 4.27 -> 4.33 rename to an exact staged file."""
import hashlib
from pathlib import Path
import sys

ORIGINAL_SHA256 = '8a2114568a3b5af0e2345b31b4d8d83a45cd051582b4173d3138fae37d5b78d8'
TRANSFORMED_SHA256 = '4fa3fc96cea57888d23e08e5de3a5acf0f62c80f38cac0d7f2e33891af78a394'
OLD = b'Finset.sum_inter_add_sum_diff'
NEW = b'Finset.sum_inter_add_sum_sdiff'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main(root):
    leaf = root / 'Erdos302ReflectiveLeafFC.lean'
    original = leaf.read_bytes()
    if digest(original) != ORIGINAL_SHA256 or original.count(OLD) != 4:
        raise ValueError('unexpected upstream leaf bytes or occurrence count')
    transformed = original.replace(OLD, NEW)
    if digest(transformed) != TRANSFORMED_SHA256:
        raise ValueError('unexpected transformed leaf bytes')
    leaf.write_bytes(transformed)
    if digest(leaf.read_bytes()) != TRANSFORMED_SHA256:
        raise ValueError('staged leaf write verification failed')
    print(f'Erdos302ReflectiveLeafFC.lean original_sha256={ORIGINAL_SHA256} transformed_sha256={TRANSFORMED_SHA256} replacements=4')


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: compat.py STAGED_ROOT')
    main(Path(sys.argv[1]))
