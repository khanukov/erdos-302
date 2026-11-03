#!/usr/bin/env python3
"""Gate exactly the reports emitted by the sparse bridge and its proof inputs."""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'mathlib-bridge-ci'))
from check_axioms import check

REPORTS = {
    'SparseTriple': {'SparseTriple.candidates_iff', 'SparseTriple.enumerated_iff'},
    'SparseBoundary': {'SparseBoundary.check_iff', 'SparseBoundary.candidates_iff_outside', 'SparseBoundary.boundary_iff'},
    'SparseBoundaryMathlib': {'SparseBoundaryMathlib.list_boundary_iff', 'SparseBoundaryMathlib.check_iff_boundary'},
    'ExtensionSeedCandidate': {'ExtensionSeedCandidate.positive_example', 'ExtensionSeedCandidate.pair_boundary_sound', 'ExtensionSeedCandidate.seed', 'ExtensionSeedCandidate.scaled_seed'},
}

def gate(module, text):
    expected = REPORTS[module]
    names = re.findall(r"'([^']+)'\s+(?:does not depend on any axioms|depends on axioms:)", text)
    if len(names) != len(expected) or set(names) != expected:
        raise ValueError(f'{module}: axiom report inventory mismatch: {names!r}')
    check(text, sorted(expected))

if __name__ == '__main__':
    try:
        if len(sys.argv) != 3: raise ValueError('usage: sparse_axioms.py MODULE LOG')
        gate(sys.argv[1], Path(sys.argv[2]).read_text())
    except (KeyError, ValueError, OSError) as e:
        raise SystemExit(f'FAIL: {e}')
    print('PASS exact axiom inventory:', sys.argv[1])
