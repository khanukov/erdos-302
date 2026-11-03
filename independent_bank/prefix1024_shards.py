#!/usr/bin/env python3
"""Reproducibly transcribe and check the first 1024 actual bank nodes.

The generated Lean checks literals; correspondence with archive bytes is a
Python check, not a theorem in Lean. Nodes outside 0..1023 are explicit defaults.
"""
import argparse
import pathlib
import re

import archive_prefix
import mixed_lean_producer
import mixed_prefix_export

OUT = pathlib.Path(__file__).resolve().parents[1] / 'audit/shard-aggregation'
RANGES = tuple((i, i + 16) for i in range(0, 1024, 16))


def generate():
    doc = mixed_prefix_export.export(archive_prefix.load_bank())
    rendered = mixed_lean_producer.render(doc)
    rows = re.findall(r'^  \| (\d+) => (.+)$', rendered, re.MULTILINE)
    if len(rows) != 1091 or any(int(i) != n for n, (i, _) in enumerate(rows)):
        raise ValueError('unexpected rendered node inventory')
    result = {}
    result['ActualPrefix1024Data.lean'] = (
        'import MixedCaseTrimCandidate\n\n'
        '/- Generated actual nodes 0..1023; archive correspondence is not a Lean theorem. -/\n'
        'namespace ActualPrefix1024Data\nopen MixedCaseTrimCandidate\n'
        'def nodes : ℕ → MixedDag.Node Payload\n' +
        ''.join(f'  | {i} => {row}\n' for i, row in rows[:1024]) +
        '  | _ => ⟨∅, 0, .small⟩\nend ActualPrefix1024Data\n')
    for shard, (start, end) in enumerate(RANGES):
        parts = ['import ActualPrefix1024Data\n', 'namespace ActualPrefix1024\n',
                 'open ActualPrefix1024Data MixedCaseTrimCandidate\n',
                 'set_option maxRecDepth 4096\nset_option maxHeartbeats 4000000\n']
        for i in range(start, end):
            kind = doc['nodes'][i]['kind']
            if kind == 'case_placeholder':
                proof = ('by\n  change CaseCheck nodes ' + str(i) + ' _ _\n'
                         '  unfold CaseCheck RefCheck row image nodes\n'
                         "  constructor\n  · decide\n  · repeat' rw [BankCase.check]\n    decide")
            elif kind == 'trim_placeholder':
                proof = (f'by\n  change TrimCheck nodes {i} _\n'
                         '  unfold TrimCheck RefCheck image nodes UpperBridge.OrderedEdge\n'
                         '  decide')
            elif kind in ('basic', 'pack'):
                proof = 'by decide'
            else:
                raise ValueError(f'unsupported shard rule {kind}')
            if kind == 'case_placeholder':
                parts.append('set_option maxRecDepth 16384 in\n')
            parts.append(f'theorem check{i} : MixedDag.Check extraCheck nodes {i} := {proof}\n')
        parts.extend(f'#print axioms check{i}\n' for i in range(start, end))
        parts.append('end ActualPrefix1024\n')
        result[f'ActualPrefix1024Checks{shard}.lean'] = ''.join(parts)
    lines = ['import ShardAggregation\n',
             *(f'import ActualPrefix1024Checks{i}\n' for i in range(len(RANGES))),
             '\nnamespace ActualPrefix1024\nopen ActualPrefix1024Data MixedCaseTrimCandidate\n']
    for shard, (start, end) in enumerate(RANGES):
        lines.extend(['set_option maxHeartbeats 4000000 in\n',
                      f'theorem segment{shard} : ShardAggregation.Segment '
                      f'(MixedDag.Check extraCheck nodes) ({start}) ({end}) := by\n',
                      '  intro i lo hi\n  interval_cases i <;> first | ',
                      ' | '.join(f'exact check{i}' for i in range(start, end)), '\n',
                      f'#print axioms segment{shard}\n'])
    chain = 'ShardAggregation.Chain.empty 0'
    for shard in range(len(RANGES)):
        chain = f'ShardAggregation.Chain.append ({chain}) segment{shard}'
    lines.extend(['set_option maxHeartbeats 4000000 in\n',
             'theorem checked : ∀ i < 1024, MixedDag.Check extraCheck nodes i := by\n',
             f'  exact ShardAggregation.prefix_sound ({chain})\n',
             'theorem sound : ∀ i < 1024, Extended.Bound (nodes i).support (nodes i).demand :=\n',
             '  MixedCaseTrimCandidate.sound nodes 1024 checked\n',
             '#print axioms checked\n#print axioms sound\nend ActualPrefix1024\n'])
    result['ActualPrefix1024Sound.lean'] = ''.join(lines)
    # Representative segment is independently compilable without assuming a prefix.
    start, end = 256, 272
    result['ActualPrefix1024Representative.lean'] = (
        'import ShardAggregation\nimport ActualPrefix1024Checks16\n'
        'namespace ActualPrefix1024\nopen ActualPrefix1024Data MixedCaseTrimCandidate\n'
        'set_option maxHeartbeats 4000000 in\n'
        'theorem representative : ShardAggregation.Segment (MixedDag.Check extraCheck nodes) 256 272 := by\n'
        '  intro i lo hi\n  interval_cases i <;> first | ' +
        ' | '.join(f'exact check{i}' for i in range(start, end)) +
        '\n#print axioms representative\nend ActualPrefix1024\n')
    return result


def verify_bytes(name, data):
    expected = generate()
    if name not in expected or data != expected[name].encode('utf-8'):
        raise ValueError(f'{name}: generated bytes differ')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    for name, text in generate().items():
        path = OUT / name
        expected = text.encode('utf-8')
        if args.check:
            if path.read_bytes() != expected:
                raise SystemExit(f'{name}: generated bytes differ')
        else:
            path.write_bytes(expected)
    print('actual prefix 0..1023: generated bytes ' + ('match' if args.check else 'written'))


if __name__ == '__main__':
    main()
