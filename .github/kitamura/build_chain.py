#!/usr/bin/env python3
"""Dependency-first source rebuild; run under `lake env` in upstream/lean."""
import argparse
import json
import os
from pathlib import Path
import re
import signal
import subprocess

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


def build_modules(order, out, logdir, env, workers):
    """Rebuild the verified local DAG; never release a dependent early."""
    if workers < 1:
        raise ValueError('workers must be positive')
    nodes = set(order)
    if len(nodes) != len(order):
        raise ValueError('duplicate module')
    deps = {}
    for module in order:
        names = imports(ROOT / (module.replace('.', '/') + '.lean'))
        local = {name for name in names if name.split('.')[0] not in EXTERNAL_ROOTS}
        if not local <= nodes:
            raise ValueError(f'missing closure dependencies for {module}: {local - nodes}')
        deps[module] = local
    pending = set(order)
    done = set()
    running = {}
    interrupted = []
    def request_stop(signum, _frame):
        # Do not raise inside Popen: its child must first be registered for cleanup.
        if not interrupted:
            interrupted.append(signum)
    previous = {sig: signal.signal(sig, request_stop) for sig in (signal.SIGTERM, signal.SIGINT)}
    try:
        while pending or running:
            if interrupted:
                raise SystemExit(128 + interrupted[0])
            # Polling observes completions only at this instant: a child can fail
            # immediately afterwards and before a new dispatch.
            for module, (proc, dest, logfile, start) in list(running.items()):
                code = proc.poll()
                if code is None:
                    continue
                logfile.close()
                del running[module]
                print(f'EXIT {module} {code} seconds={time.monotonic()-start:.2f}', flush=True)
                if code or not dest.is_file() or not dest.stat().st_size:
                    raise RuntimeError('failed build: ' + module)
                done.add(module)
            for module in order:
                if interrupted:
                    raise SystemExit(128 + interrupted[0])
                if len(running) >= workers:
                    break
                if module not in pending or not deps[module] <= done:
                    continue
                dest = out / (module.replace('.', '/') + '.olean')
                dest.parent.mkdir(parents=True, exist_ok=True)
                logfile = (logdir / (module + '.log')).open('x')
                start = time.monotonic()
                print(f'BUILD {module} log={logfile.name}', flush=True)
                try:
                    proc = subprocess.Popen(['lean', '-j', '1', '-o', str(dest), module.replace('.', '/') + '.lean'],
                                            env=env, stdout=logfile, stderr=subprocess.STDOUT,
                                            start_new_session=True)
                except BaseException:
                    logfile.close()
                    raise
                running[module] = (proc, dest, logfile, start)
                pending.remove(module)
            if pending and not running:
                raise RuntimeError('dependency cycle or unsatisfied dependencies')
            if running:
                time.sleep(0.05)
    finally:
        # Signal the whole session, give cooperative parents a chance to reap,
        # then kill remaining group members even if the leader already exited.
        for proc, _, _, _ in running.values():
            try:
                os.killpg(proc.pid, signal.SIGTERM)
            except ProcessLookupError:
                pass
        deadline = time.monotonic() + 0.5
        for proc, _, _, _ in running.values():
            try:
                proc.wait(timeout=max(0, deadline - time.monotonic()))
            except subprocess.TimeoutExpired:
                pass
        for proc, _, _, _ in running.values():
            try:
                os.killpg(proc.pid, signal.SIGKILL)
            except ProcessLookupError:
                pass
        for proc, _, logfile, _ in running.values():
            proc.wait()
            logfile.close()
        for sig, handler in previous.items():
            signal.signal(sig, handler)


def run(scope, logdir, plan=False, workers=None):
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
    if workers is not None:
        build_modules(order, out, logdir, env, workers)
    else:
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
    parser = argparse.ArgumentParser()
    parser.add_argument('scope', choices=TARGETS)
    parser.add_argument('logdir', type=Path)
    parser.add_argument('--plan', action='store_true')
    parser.add_argument('--bounded', action='store_true', help='enable dependency-aware scheduler')
    parser.add_argument('--workers', type=int, default=2, help='bounded scheduler limit (default: 2)')
    args = parser.parse_args()
    if args.workers < 1:
        parser.error('--workers must be positive')
    run(args.scope, args.logdir, args.plan, args.workers if args.bounded else None)
