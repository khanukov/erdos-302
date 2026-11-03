#!/usr/bin/env python3
"""Sequentially compile the staged closure, gate names, and retain resource logs."""
import importlib.util
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
spec = importlib.util.spec_from_file_location('closure', HERE / 'closure.py')
closure = importlib.util.module_from_spec(spec)
spec.loader.exec_module(closure)
modules, vertices = closure.inventory()
project, logs = map(Path, sys.argv[1:])
axioms = ROOT / 'audit/mathlib-bridge-ci/check_axioms.py'

def run(name, contract=False):
    path = name.replace('.', '/')
    log = logs / (name + '.log')
    metrics = logs / (name + '.time')
    command = ['/usr/bin/time', '-v', '-o', str(metrics), 'timeout', '--kill-after=30s', '1200s', 'lean']
    if not contract:
        command += ['-o', str(project / (path + '.olean'))]
    command += [str(project / (path + '.lean'))]
    print('BUILD', name, flush=True)
    with log.open('w') as out:
        result = subprocess.run(command, stdout=out, stderr=subprocess.STDOUT, cwd=project)
    print('EXIT', name, result.returncode, flush=True)
    if result.returncode: raise SystemExit(f'FAILED {name}: exit {result.returncode}; see logs')
    return log

def gate(log, *names):
    subprocess.run([sys.executable, str(axioms), str(log), *names], check=True)

for name in modules:
    log = run(name)
    if name in ('ExtensionSeedCandidate', 'SparseTriple', 'SparseBoundary', 'SparseBoundaryMathlib'):
        subprocess.run([sys.executable, str(ROOT / 'audit/extension-ci/sparse_axioms.py'), name, str(log)], check=True)
    if name == 'SparseBoundaryFast':
        gate(log, 'SparseBoundaryFast.pairs_sound', 'SparseBoundaryFast.pairs_to_shard')
    if name == 'ActualSparse64.FastSample':
        gate(log, 'ActualSparse64.vertex118', 'ActualSparse64.shard118')
    if name.startswith('ActualSparse64.Vertex'):
        n = name.removeprefix('ActualSparse64.Vertex')
        gate(log, f'ActualSparse64.pair{n}_full', f'ActualSparse64.shard{n}_full')
    stage_gates = {'ActualSparse64.Outside': 'outside_eq', 'ActualSparse64.Coverage': 'all_shards',
                   'ActualSparse64.SourceEq': 'source_eq', 'ActualSparse64.TargetEq': 'target_eq',
                   'ActualSparse64.DeleteEq': 'delete_eq', 'ActualSparse64.All': 'boundary'}
    if name in stage_gates:
        gate(log, 'ActualSparse64.' + stage_gates[name])
log = run('Contract', contract=True)
gate(log, 'ActualSparse64.boundary')
print(f'PASS: {len(modules)} modules, {len(vertices)} vertex checks, aggregate and type contract', flush=True)
