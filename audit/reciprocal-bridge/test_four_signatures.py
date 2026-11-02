#!/usr/bin/env python3
"""Ensure each reviewed ascription rejects a deliberately changed type."""
from pathlib import Path
import subprocess
import sys

path = Path(sys.argv[1])
text = path.read_text()
mutations = [
    ('∀ n ≤ 500000, chainSol_0 n', '∀ n ≤ 500001, chainSol_0 n'),
    ('FourExternal.active_1097 71)', 'FourExternal.active_1097 72)'),
    ('FourExternal.active_1107 102)', 'FourExternal.active_1107 103)'),
    ('FourExternal.active_1112 124)', 'FourExternal.active_1112 125)'),
    ('FourExternal.active_1114 125)', 'FourExternal.active_1114 126)'),
]
for old, new in mutations:
    if text.count(old) != 1:
        raise RuntimeError('signature mutation anchor is not unique: ' + old)
    mutant = path.with_name('FourSignatureMutant.lean')
    if mutant.exists():
        raise RuntimeError('refusing preexisting mutant file')
    try:
        mutant.write_text(text.replace(old, new))
        result = subprocess.run(['lean', '-j', '1', str(mutant)], text=True, capture_output=True)
        output = result.stdout + result.stderr
        if result.returncode == 0 or 'type mismatch' not in output:
            raise RuntimeError('mutation did not fail with type mismatch: ' + old + '\n' + output)
        print('rejected signature mutation:', old, flush=True)
    finally:
        mutant.unlink(missing_ok=True)
