#!/usr/bin/env python3
"""Dependency-first source rebuild; run under `lake env` in upstream/lean."""
import os
from pathlib import Path
import re
import subprocess
import sys
import time

ROOT = Path.cwd()
TARGETS = {'pilot': 'Erdos302ReflectiveChainData19FC', 'full': 'Erdos302ReflectiveChainTopFC'}
ALLOWED = {'propext', 'Classical.choice', 'Quot.sound'}


def closure(target):
    seen, active, order = set(), set(), []
    def visit(name):
        file = ROOT / (name.replace('.', '/') + '.lean')
        if not file.is_file():
            return
        if name in active:
            raise ValueError('import cycle: ' + name)
        if name in seen:
            return
        active.add(name)
        for line in file.read_text().splitlines():
            if line.startswith('import '):
                for dep in line.split()[1:]:
                    visit(dep)
        active.remove(name)
        seen.add(name)
        order.append(name)
    visit(target)
    return order


def run(scope, logdir, plan=False):
    target = TARGETS[scope]
    order = closure(target)
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
