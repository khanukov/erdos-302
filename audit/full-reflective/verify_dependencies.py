#!/usr/bin/env python3
"""Check every materialized integration dependency against its manifest lock."""
import json
from pathlib import Path
import re
import subprocess
import sys


def verify(root):
    manifest = json.loads((root / 'lake-manifest.json').read_text())
    if manifest['packagesDir'] != '.lake/packages':
        raise ValueError('unexpected packages directory')
    packages = manifest['packages']
    if not isinstance(packages, list) or not packages:
        raise ValueError('empty package inventory')
    seen = set()
    for package in packages:
        name, rev = package['name'], package['rev']
        if not isinstance(name, str) or not re.fullmatch(r'[A-Za-z0-9_-]+', name) or name in seen:
            raise ValueError(f'invalid or duplicate package name: {name!r}')
        seen.add(name)
        if package['type'] != 'git' or not isinstance(rev, str) or not re.fullmatch(r'[0-9a-f]{40}', rev):
            raise ValueError(f'invalid git lock for {name}')
        path = root / '.lake/packages' / name
        def git(*args):
            return subprocess.check_output(['git', '-C', str(path), *args], text=True).strip()
        if Path(git('rev-parse', '--show-toplevel')).resolve() != path.resolve():
            raise ValueError(f'{name}: not a package repository')
        got = git('rev-parse', 'HEAD')
        if got != rev:
            raise ValueError(f'{name}: expected {rev}, got {got}')
        subprocess.run(['git', '-C', str(path), 'diff', '--quiet', 'HEAD', '--'], check=True)
        print(name, got, flush=True)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: verify_dependencies.py PROJECT_ROOT')
    verify(Path(sys.argv[1]).resolve())
