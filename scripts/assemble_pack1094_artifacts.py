#!/usr/bin/env python3
"""Fail closed on missing or unexpected batch artifacts before assembly."""
import re
import shutil
import sys
from pathlib import Path


def assemble(manifest, artifacts, destination):
    batches = manifest.read_text().splitlines()
    if len(batches) != 88:
        raise ValueError('expected exactly 88 batches')
    expected_dirs = {f'node1094-proof-batch-{i}' for i in range(88)}
    if {p.name for p in artifacts.iterdir()} != expected_dirs:
        raise ValueError('batch artifact directory set does not match 0..87')
    seen = set()
    files = []
    for i, line in enumerate(batches):
        vertices = line.split()
        if not vertices or any(not re.fullmatch(r'[1-9][0-9]*', v) for v in vertices):
            raise ValueError(f'invalid manifest batch {i}')
        names = {f'Pack1094Vertex{v}.olean' for v in vertices}
        if len(names) != len(vertices) or seen & names:
            raise ValueError('duplicate vertex')
        seen.update(names)
        names.add(f'Pack1094Batch{i:03}.olean')
        directory = artifacts / f'node1094-proof-batch-{i}'
        entries = list(directory.iterdir())
        if {p.name for p in entries} != names or any(not p.is_file() or p.is_symlink() for p in entries):
            raise ValueError(f'incomplete or unexpected files in batch {i}')
        files.extend(entries)
    for source in files:
        shutil.copyfile(source, destination / source.name)
    print(f'verified 88 batch artifacts and {len(seen)} vertex oleans')


if __name__ == '__main__':
    if len(sys.argv) != 4:
        raise SystemExit('usage: assemble_pack1094_artifacts.py MANIFEST ARTIFACTS DESTINATION')
    try:
        assemble(*(Path(arg) for arg in sys.argv[1:]))
    except (OSError, ValueError) as exc:
        raise SystemExit(str(exc))
