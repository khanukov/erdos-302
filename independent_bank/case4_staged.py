#!/usr/bin/env python3
"""Gate the staged node-4 semantic proof on the pinned case transcription."""
from pathlib import Path
import sys

import archive_prefix
import case_translation

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'lean/ArchiveCase4Staged.lean'
TEMPLATE = ROOT / 'independent_bank/case4_staged.lean.template'
CASE = ROOT / 'lean/ArchiveCase4.lean'


def render(bank):
    data = case_translation.translate(bank)
    if case_translation.render(data) != CASE.read_text():
        raise ValueError('case 4 Lean transcription differs')
    return TEMPLATE.read_text()


def main():
    result = render(archive_prefix.load_bank())
    if sys.argv[1:] == ['--write']:
        TARGET.write_text(result)
    elif not sys.argv[1:]:
        if TARGET.read_text() != result:
            raise ValueError('staged Lean source differs')
        print('case 4 staged source matches pinned bank transcription')
    else:
        raise ValueError('usage: case4_staged.py [--write]')


if __name__ == '__main__':
    main()
