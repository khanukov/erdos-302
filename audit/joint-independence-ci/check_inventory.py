#!/usr/bin/env python3
"""Check the exact local source domain and recursive imports of the test root."""
import pathlib
import re
import sys

EXTERNAL = {'Mathlib', 'Lean', 'Std'}
IMPORT = re.compile(r"import ([A-Za-z_][A-Za-z0-9_'.]*(?: +[A-Za-z_][A-Za-z0-9_'.]*)*)\s*")


def compute(root, target='JointIndependenceCandidateTests'):
    sources = {}
    for directory in (root / 'lean', root / 'audit/ledger-candidate/lean'):
        if not directory.is_dir():
            raise ValueError(f'missing source directory: {directory}')
        for path in directory.rglob('*.lean'):
            name = '.'.join(path.relative_to(directory).with_suffix('').parts)
            if name in sources:
                raise ValueError(f'duplicate module: {name}')
            sources[name] = path
    seen, active, order = set(), set(), []

    def visit(name):
        if name.split('.')[0] in EXTERNAL:
            return
        if name in active:
            raise ValueError(f'import cycle: {name}')
        if name in seen:
            return
        if name not in sources:
            raise ValueError(f'unresolved import: {name}')
        active.add(name)
        for line in sources[name].read_text().splitlines():
            if re.match(r'^\s*import\b', line):
                match = IMPORT.fullmatch(line)
                if not match:
                    raise ValueError(f'unsupported import syntax in {name}: {line}')
                for dep in match.group(1).split():
                    visit(dep)
        active.remove(name)
        seen.add(name)
        order.append(name)
    visit(target)
    return seen, set(sources) - seen, order


def inventory(path):
    lines = path.read_text().splitlines()
    if not lines or len(lines) != len(set(lines)) or any(not line or line != line.strip() for line in lines):
        raise ValueError(f'invalid inventory: {path}')
    return lines


def check(root):
    included, excluded, order = compute(root)
    directory = root / 'audit/joint-independence-ci'
    expected = inventory(directory / 'included.txt')
    omitted = inventory(directory / 'excluded.txt')
    ordered = inventory(directory / 'build-order.txt')
    if set(expected) != included or set(omitted) != excluded:
        raise ValueError('source inventory or closure mismatch')
    if ordered != order:
        raise ValueError('build order mismatch')
    print(f'verified {len(included)} included and {len(excluded)} excluded modules')


if __name__ == '__main__':
    try:
        check(pathlib.Path(sys.argv[1]).resolve())
    except (ValueError, OSError, IndexError) as exc:
        raise SystemExit(str(exc))
