#!/usr/bin/env python3
"""Fail closed on local module inventory and unsupported import syntax."""
import pathlib
import re
import sys

root = pathlib.Path(sys.argv[1]).resolve()
dirs = [root / 'lean', root / 'audit/ledger-candidate/lean']
sources = {}
for directory in dirs:
    for path in directory.rglob('*.lean'):
        module = '.'.join(path.relative_to(directory).with_suffix('').parts)
        if module in sources:
            raise SystemExit(f'duplicate module {module}')
        sources[module] = path

def inventory(name):
    lines = (root / 'audit/multiplicity-ci' / name).read_text().splitlines()
    if len(lines) != len(set(lines)) or any(not x for x in lines):
        raise SystemExit(f'invalid inventory {name}')
    return set(lines)

expected = inventory('included.txt')
excluded = inventory('excluded.txt')
if expected & excluded or expected | excluded != set(sources):
    raise SystemExit('source inventory mismatch')
seen = set()
ordered = []
def visit(module):
    if module.split('.')[0] in {'Mathlib', 'Lean', 'Std'}:
        return
    if module in seen:
        return
    if module not in sources:
        raise SystemExit(f'unresolved import {module}')
    seen.add(module)
    for line in sources[module].read_text().splitlines():
        if re.match(r'^\s*import\b', line):
            match = re.fullmatch(r'import ([A-Za-z_][A-Za-z0-9_\'.]*(?: +[A-Za-z_][A-Za-z0-9_\'.]*)*)\s*', line)
            if not match:
                raise SystemExit(f'unsupported import syntax: {module}: {line}')
            for dep in match.group(1).split():
                visit(dep)
    ordered.append(module)
visit('RenewalMultiplicityCandidateTests')
if seen != expected:
    raise SystemExit(f'closure mismatch: missing={sorted(expected-seen)} extra={sorted(seen-expected)}')
if (root / 'audit/multiplicity-ci/build-order.txt').read_text().splitlines() != ordered:
    raise SystemExit('build order does not match source closure')
print(f'verified {len(seen)} included, {len(excluded)} excluded modules')
