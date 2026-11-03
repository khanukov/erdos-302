#!/usr/bin/env python3
"""Split generated Small modules into bounded four-theorem modules for CI."""
import re
from pathlib import Path


def split(text, name):
    header, body = text.split('theorem node', 1)
    blocks = re.findall(r'(theorem node\d+ :[^\n]+\n#print axioms node\d+\n)', 'theorem node' + body)
    if len(blocks) != 16 or ''.join(blocks) + 'end Node1209Small\n' != 'theorem node' + body:
        raise ValueError(f'unexpected small module {name}')
    files = {}
    for i in range(4):
        files[f'{name}Part{i}.lean'] = header + ''.join(blocks[4*i:4*i+4]) + 'end Node1209Small\n'
    files[f'{name}.lean'] = ''.join(f'import {name}Part{i}\n' for i in range(4))
    return files


def main():
    for i in range(23):
        name = f'Small{i:02}'
        for path, text in split(Path(f'{name}.lean').read_text(), name).items():
            Path(path).write_text(text)


if __name__ == '__main__':
    main()
