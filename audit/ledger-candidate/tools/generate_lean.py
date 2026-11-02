#!/usr/bin/env python3
"""Transcribe canonical exporter JSON into Lean literals; NOT a proof of fidelity."""
import argparse
import json
from pathlib import Path

def render(data):
    levels = data['levels']
    parts = ['-- Generated from ledger.json; Python transcription is outside Lean trust.\nimport LedgerChecker\n\nnamespace ArchiveLedger\n']
    for i, level in enumerate(levels):
        cells = ',\n'.join(f'  ⟨{a}, {b}, {h}⟩' for a,b,h in level['cells'])
        parts.append(f'def cells{i} : List Cell := [\n{cells}\n]\n')
    parts.append('def ledger : List Level := [\n' + ',\n'.join(f'  ⟨{x["prime"]}, cells{i}⟩' for i,x in enumerate(levels)) + '\n]\n')
    parts.append('''-- Candidate kernel replay; this declaration is NOT verified until hosted compilation succeeds.
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem archive_check : check ledger = true := by decide

theorem archive_valid : Valid ledger := of_decide_eq_true archive_check

theorem archive_arithmetic : Arithmetic ledger := check_sound archive_check

#print axioms archive_check
#print axioms archive_valid
#print axioms archive_arithmetic
end ArchiveLedger
''')
    return ''.join(parts)

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('json'); ap.add_argument('output'); args=ap.parse_args()
    Path(args.output).write_text(render(json.loads(Path(args.json).read_text())), encoding='utf-8')
if __name__ == '__main__': main()
