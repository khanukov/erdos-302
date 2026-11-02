#!/usr/bin/env python3
"""Dependency-first source rebuild; run under `lake env` in upstream/lean."""
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import time

ROOT = Path.cwd()
TARGETS = {'pilot': 'Erdos302ReflectiveChainData19FC', 'full': 'Erdos302ReflectiveChainTopFC'}
ALLOWED = {'propext', 'Classical.choice', 'Quot.sound'}


# Only these roots belong to the separately pinned Lean/Lake environment. All
# other imports must resolve to source in ROOT, never to an ambient olean.
EXTERNAL_ROOTS = {'Mathlib', 'Lean', 'Init', 'Std', 'Batteries', 'Aesop', 'Qq',
                  'ProofWidgets', 'Plausible', 'LeanSearchClient', 'ImportGraph', 'Cli'}
MODULE = re.compile(r'[A-Za-z_][A-Za-z_0-9\']*(?:\.[A-Za-z_][A-Za-z_0-9\']*)*\Z')


def imports(file):
    """Read the Lean header; reject unsupported import syntax, don't guess it.

    Comments (including nested block comments) may occur between header tokens.
    Import names must be on the same line as `import`; other forms fail closed.
    """
    depth = 0
    result = []
    for line in file.read_text().splitlines():
        clean = []
        i = 0
        while i < len(line):
            pair = line[i:i+2]
            if pair == '/-':
                if not depth:
                    clean.append(' ')
                depth += 1
                i += 2
            elif depth and pair == '-/':
                depth -= 1
                i += 2
            elif depth:
                i += 1
            elif pair == '--':
                break
            else:
                clean.append(line[i])
                i += 1
        text = ''.join(clean).strip()
        if not text:
            continue
        if text == 'prelude':
            continue
        words = text.split()
        if words[0] == 'import':
            if len(words) == 1 or any(not MODULE.fullmatch(w) for w in words[1:]):
                raise ValueError(f'unsupported import in {file}: {text}')
            for name in words[1:]:
                if name in result:
                    raise ValueError(f'duplicate import {name} in {file}')
                result.append(name)
        elif re.search(r'\bimport\b', text):
            raise ValueError(f'unsupported header import in {file}: {text}')
        elif result and line[:1].isspace() and all(MODULE.fullmatch(w) for w in words):
            raise ValueError(f'unsupported possible import continuation in {file}: {text}')
        else:
            break
    if depth:
        raise ValueError(f'unterminated header comment in {file}')
    return result


def closure(target, external_imports=None):
    seen, active, order = set(), set(), []
    def visit(name):
        if name.split('.')[0] in EXTERNAL_ROOTS:
            if external_imports is not None:
                external_imports.add(name)
            return
        file = ROOT / (name.replace('.', '/') + '.lean')
        if not file.is_file():
            raise ValueError(f'missing source for import: {name}')
        if name in active:
            raise ValueError('import cycle: ' + name)
        if name in seen:
            return
        active.add(name)
        for dep in imports(file):
            visit(dep)
        active.remove(name)
        seen.add(name)
        order.append(name)
    visit(target)
    return order


def check_inventory(actual, expected):
    if len(actual) != len(set(actual)) or len(expected) != len(set(expected)):
        raise ValueError('duplicate module in inventory')
    if set(actual) != set(expected):
        raise ValueError(f'inventory mismatch: missing={sorted(set(expected)-set(actual))} '
                         f'extra={sorted(set(actual)-set(expected))}')


def audited_full_closure():
    inventory = json.loads((Path(__file__).resolve().parents[2] / 'audit/full-reflective/upstream-inventory.json').read_text())
    if inventory['upstream_commit'] != '9447ceb28138949b2fb32442cec506a6f53104f9' or inventory['target'] != TARGETS['full']:
        raise ValueError('inventory provenance mismatch')
    external = set()
    order = closure(TARGETS['full'], external)
    check_inventory(order, inventory['modules'])
    check_inventory(list(external), inventory['external_imports'])
    return order


def run(scope, logdir, plan=False):
    target = TARGETS[scope]
    order = audited_full_closure() if scope == 'full' else closure(target)
    expected = {'pilot': 8, 'full': 235}[scope]
    if len(order) != expected or target not in order:
        raise RuntimeError(f'unexpected closure: {len(order)} (expected {expected})')
    print(f'scope={scope} target={target} local_source_closure={len(order)}', flush=True)
    if plan:
        print('\n'.join(order))
        return
    logdir.mkdir(parents=True, exist_ok=True)
    out = logdir / 'fresh-oleans'
    if out.exists():
        raise RuntimeError('refusing preexisting object directory')
    out.mkdir()
    env = os.environ.copy()
    env['LEAN_PATH'] = str(out.resolve()) + os.pathsep + env.get('LEAN_PATH', '')
    for num, module in enumerate(order, 1):
        dest = out / (module.replace('.', '/') + '.olean')
        dest.parent.mkdir(parents=True, exist_ok=True)
        start = time.monotonic()
        print(f'BUILD {num}/{len(order)} {module}', flush=True)
        result = subprocess.run(['lean', '-j', '1', '-o', str(dest), module.replace('.', '/') + '.lean'], env=env)
        print(f'EXIT {result.returncode} seconds={time.monotonic()-start:.2f}', flush=True)
        if result.returncode or not dest.is_file() or not dest.stat().st_size:
            raise RuntimeError('failed build: ' + module)
    names = (['Erdos302ReflectiveChain.check_19', 'Erdos302ReflectiveChain.I_19_end',
              'Erdos302Reflective.levelCheck_sound'] if scope == 'pilot' else
             [f'Erdos302ReflectiveChain.chain_{i}' for i in range(20)])
    audit = ROOT / 'KitamuraCIAxioms.lean'
    if audit.exists():
        raise RuntimeError('refusing preexisting axiom query')
    audit.write_text('import ' + target + '\n' + ''.join(f'#check {n}\n#print axioms {n}\n' for n in names))
    (logdir / 'Axioms.lean').write_text(audit.read_text())
    p = subprocess.run(['lean', '-j', '1', audit.name], env=env, text=True, capture_output=True)
    text = p.stdout + p.stderr
    (logdir / 'axioms.log').write_text(text)
    print(text, flush=True)
    if p.returncode:
        raise RuntimeError('axiom query failed')
    for name in names:
        pat = r"'" + re.escape(name) + r"' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)"
        matches = list(re.finditer(pat, text))
        if len(matches) != 1:
            raise RuntimeError('missing or duplicate axiom result: ' + name)
        axioms = {x.strip() for x in (matches[0].group(1) or '').split(',') if x.strip()}
        if not axioms <= ALLOWED:
            raise RuntimeError(f'forbidden axiom for {name}: {axioms - ALLOWED}')
    print(f'SUCCESS scope={scope} rebuilt={len(order)} audited={len(names)}', flush=True)


if __name__ == '__main__':
    if len(sys.argv) not in (3, 4) or sys.argv[1] not in TARGETS or (len(sys.argv) == 4 and sys.argv[3] != '--plan'):
        raise SystemExit('usage: build_chain.py pilot|full LOGDIR [--plan]')
    run(sys.argv[1], Path(sys.argv[2]), len(sys.argv) == 4)
