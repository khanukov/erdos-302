#!/usr/bin/env python3
"""Generate the first nine mixed nodes; deterministic transcription, not a proof of input provenance."""
import argparse
import pathlib
import re
import sys

import archive_prefix
import mixed_prefix_export
import mixed_lean_producer

OUT = pathlib.Path(__file__).resolve().parents[1] / 'audit/shard-aggregation/FirstRealData.lean'
PROOF_OUT = OUT.with_name('FirstRealShard.lean')


def generate_proof():
    lines = ['import FirstRealData', '',
             '/-! Candidate closed checks for the nine literal nodes; compilation required. -/',
             'namespace FirstRealShard', 'open FirstRealData MixedCaseTrimCandidate', '',
             'set_option maxRecDepth 4096', 'set_option maxHeartbeats 4000000', '']
    for i in range(9):
        header = f'theorem check{i} : MixedDag.Check extraCheck nodes {i} := by'
        if i in (4, 7):
            lines.extend([header, f'  change CaseCheck nodes {i} _ _',
                          '  unfold CaseCheck RefCheck row image nodes',
                          '  simp only [BankCase.check] <;> decide', ''])
        elif i in (5, 8):
            lines.extend([header, f'  change TrimCheck nodes {i} _',
                          '  unfold TrimCheck RefCheck image nodes UpperBridge.OrderedEdge',
                          '  decide', ''])
        else:
            lines.append(header + ' decide')
            if i in (3, 6):
                lines.append('')
    lines.extend(['theorem checked : ∀ i < 9, MixedDag.Check extraCheck nodes i := by',
                  '  intro i hi',
                  '  interval_cases i <;> first | ' + ' | '.join(f'exact check{i}' for i in range(9)),
                  '', 'theorem bound8 : Extended.Bound (nodes 8).support (nodes 8).demand :=',
                  '  MixedCaseTrimCandidate.sound nodes 9 checked 8 (by decide)', ''])
    lines.extend(f'#print axioms check{i}' for i in range(9))
    lines.extend(['#print axioms checked', '#print axioms bound8', 'end FirstRealShard', ''])
    return '\n'.join(lines)

def generate():
    doc = mixed_prefix_export.export(archive_prefix.load_bank())
    rendered = mixed_lean_producer.render(doc)
    rows = re.findall(r'^  \| (\d+) => (.+)$', rendered, re.MULTILINE)
    if len(rows) != 1091 or any(int(i) != n for n, (i, _) in enumerate(rows)):
        raise ValueError('unexpected rendered node inventory')
    selected = rows[:9]
    return ('import MixedCaseTrimCandidate\n\n'
            '/- Generated literals only. Archive-to-Lean correspondence is not proved. -/\n'
            'namespace FirstRealData\nopen MixedCaseTrimCandidate\n'
            'def nodes : ℕ → MixedDag.Node Payload\n' +
            ''.join(f'  | {i} => {row}\n' for i, row in selected) +
            '  | _ => ⟨∅, 0, .small⟩\nend FirstRealData\n')

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--check', action='store_true')
    args = p.parse_args()
    data = generate()
    proof = generate_proof()
    if args.check:
        if OUT.read_text(encoding='utf-8') != data:
            raise SystemExit('generated shard differs')
        if PROOF_OUT.read_text(encoding='utf-8') != proof:
            raise SystemExit('generated proof differs')
        print('first nine nodes and proof match deterministic generators')
    else:
        OUT.write_text(data, encoding='utf-8')
        PROOF_OUT.write_text(proof, encoding='utf-8')

if __name__ == '__main__':
    main()
