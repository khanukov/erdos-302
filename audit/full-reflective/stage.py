#!/usr/bin/env python3
"""Stage only the exact source closure; no upstream oleans are copied."""
import importlib.util
import os
from pathlib import Path
import shutil
import sys

source, dest, helper = map(lambda s: Path(s).resolve(), sys.argv[1:])
if dest.exists():
    raise SystemExit('destination exists')
os.chdir(source)
spec = importlib.util.spec_from_file_location('chain', helper)
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
order = mod.audited_full_closure()
if len(order) != 235 or order[-1] != mod.TARGETS['full']:
    raise SystemExit('unexpected upstream closure')
dest.mkdir(parents=True)
for name in order:
    rel = Path(name.replace('.', '/') + '.lean')
    target = dest / rel
    target.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(source / rel, target)
(dest / 'closure.txt').write_text('\n'.join(order) + '\n')
print(f'staged {len(order)} source files to {dest}')
