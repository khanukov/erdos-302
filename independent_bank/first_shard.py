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
    if args.check:
        if OUT.read_text(encoding='utf-8') != data:
            raise SystemExit('generated shard differs')
        print('first nine nodes match deterministic generator')
    else:
        OUT.write_text(data, encoding='utf-8')

if __name__ == '__main__':
    main()
