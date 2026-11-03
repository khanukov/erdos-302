#!/usr/bin/env python3
"""Split the authenticated final generated shard without altering its declarations."""
import re
import sys
from pathlib import Path

MARKER = re.compile(r'^def imageId(\d+) : ℕ :=', re.MULTILINE)
END = 'end Node1209Rows063\n'


def partition(original):
    matches = list(MARKER.finditer(original))
    if [int(m.group(1)) for m in matches] != list(range(504, 510)) or not original.endswith(END):
        raise ValueError('unexpected row63 inventory or end')
    header = original[:matches[0].start()]
    if 'namespace Node1209Rows063\n' not in header:
        raise ValueError('unexpected namespace')
    blocks = [original[m.start():matches[i + 1].start() if i + 1 < len(matches) else -len(END)]
              for i, m in enumerate(matches)]
    for i, block in zip(range(504, 510), blocks):
        for token in (f'theorem check{i} :', f'theorem bound{i} ',
                      f'#print axioms check{i}\n', f'#print axioms bound{i}\n'):
            if block.count(token) != 1:
                raise ValueError(f'bad declaration {token}')
    return {'504-508': header + ''.join(blocks[:5]) + END,
            '509': header + blocks[5] + END}


def reassemble(parts):
    first, second = parts['504-508'], parts['509']
    marker = MARKER.search(second)
    if not marker or first[:MARKER.search(first).start()] != second[:marker.start()]:
        raise ValueError('mismatched headers')
    return first[:-len(END)] + second[marker.start():]


if __name__ == '__main__':
    if len(sys.argv) != 4 or sys.argv[2] not in ('504-508', '509'):
        raise SystemExit('usage: node1209_row63_split.py ORIGINAL 504-508|509 OUTPUT')
    original = Path(sys.argv[1]).read_text()
    parts = partition(original)
    if reassemble(parts) != original:
        raise ValueError('partition does not reconstruct original')
    Path(sys.argv[3]).write_text(parts[sys.argv[2]])
