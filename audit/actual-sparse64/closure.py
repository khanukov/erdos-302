#!/usr/bin/env python3
"""Validate and stage the complete, explicitly inventoried aggregate closure."""
import importlib.util
import re
import shutil
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location('base_closure', ROOT / 'audit/extension-ci/sparse_mathlib_closure.py')
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)
spec = importlib.util.spec_from_file_location('generator', ROOT / 'audit/actual-sparse64/generate.py')
gen = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gen)

def inventory():
    generated = gen.generate()
    actual = gen.generated_inventory()
    if actual != set(generated) or any(p.read_bytes() != s.encode() for p, s in generated.items()):
        raise ValueError('generated inventory or bytes mismatch')
    vertices = sorted(p.stem for p in generated if p.name.startswith('Vertex'))
    if len(vertices) != 64:
        raise ValueError('expected exactly 64 vertices')
    modules = dict(base.MODULES)
    modules.update({'ExtensionBoundaryData': ['ExtensionSeedCandidate'],
                    'SparseBoundaryShards': ['SparseBoundary'],
                    'SparseBoundaryFast': ['SparseBoundaryShards'],
                    'ActualSparse64.Data': ['SparseBoundaryShards'],
                    'ActualSparse64.FastSample': ['SparseBoundaryFast', 'ActualSparse64.Data']})
    # Diagnose independent computations before spending time on vertex proofs.
    for stage in ('Outside', 'Subsets', 'SourceEq', 'TargetEq', 'DeleteEq'):
        text = generated[gen.OUT / (stage + '.lean')]
        modules['ActualSparse64.' + stage] = [line.split()[1] for line in text.splitlines() if line.startswith('import ')]
    for vertex in vertices:
        modules['ActualSparse64.' + vertex] = ['ActualSparse64.FastSample']
    for stage in ('Coverage', 'Checked', 'All'):
        text = generated[gen.OUT / (stage + '.lean')]
        modules['ActualSparse64.' + stage] = [line.split()[1] for line in text.splitlines() if line.startswith('import ')]
    modules['FirstExtensionBridge'] = ['ActualSparse64.All']
    return modules, vertices

def stage(root, dest):
    modules, vertices = inventory()
    generated = gen.generate()
    for original, expected in generated.items():
        candidate = root / original.relative_to(ROOT)
        if candidate.read_bytes() != expected.encode():
            raise ValueError(f'generated source bytes mismatch: {candidate}')
    seen = set()
    for name, imports in modules.items():
        path = root / 'lean' / (name.replace('.', '/') + '.lean')
        text = path.read_text()
        found = []
        for line in text.splitlines():
            if re.match(r'^\s*(?:public\s+|meta\s+)?import\b', line):
                m = re.fullmatch(r'import ([A-Za-z][A-Za-z0-9_.]*)', line)
                if not m: raise ValueError(f'{name}: unsupported import {line}')
                found.append(m.group(1))
        if found != imports: raise ValueError(f'{name}: imports mismatch')
        if any(x not in seen and x not in base.EXTERNAL for x in found): raise ValueError(f'{name}: dependency order')
        if re.search(r'\b(?:sorry|admit|native_decide)\b', text): raise ValueError(f'{name}: forbidden token')
        seen.add(name)
    reached = set()
    def visit(name):
        if name in reached: return
        reached.add(name)
        for dep in modules[name]:
            if dep in modules: visit(dep)
    visit('FirstExtensionBridge')
    if reached != set(modules): raise ValueError('disconnected inventory')
    dest.mkdir(parents=True, exist_ok=True)
    if any(dest.iterdir()): raise ValueError('destination must be empty')
    for name in modules:
        rel = Path(name.replace('.', '/') + '.lean')
        out = dest / rel
        out.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(root / 'lean' / rel, out)
    files = {p.relative_to(dest).as_posix() for p in dest.rglob('*.lean')}
    if files != {x.replace('.', '/') + '.lean' for x in modules}: raise ValueError('staged inventory mismatch')
    print(f'PASS exact connected source closure: {len(modules)} modules, {len(vertices)} vertices')
    return modules, vertices

if __name__ == '__main__':
    if len(sys.argv) != 2: raise SystemExit('usage: closure.py DEST')
    try: stage(ROOT, Path(sys.argv[1]))
    except (ValueError, OSError) as e: raise SystemExit(f'FAIL: {e}')
