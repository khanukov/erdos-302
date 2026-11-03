#!/usr/bin/env python3
"""Check exact source-level first-nine correspondence, not a Lean theorem.

The two producers use distinct payload types: the full one wraps ordinary case
and trim rules in `.ordinary`. Only that one syntactic wrapper is removed.
"""
import pathlib
import re
import sys

import first_shard
import mixed_full_producer
import verify_bank
from bank_interpreter import need

ROOT = pathlib.Path(__file__).resolve().parents[1]
ARM = re.compile(r'^  \| (\d+) => (.+)$', re.MULTILINE)


def load_inputs():
    bank, intervals = verify_bank.load_archive(ROOT / 'input/erdos302_boundary_certificates_publication.zip')
    full = mixed_full_producer.render(bank, intervals)
    return full, (ROOT / 'audit/shard-aggregation/FirstRealData.lean').read_text(encoding='utf8')


def arms(text):
    pairs = ARM.findall(text)
    need(len({int(i) for i, _ in pairs}) == len(pairs), 'duplicate arm')
    return {int(i): v for i, v in pairs}


def unwrap(value):
    for kind in ('caseRule', 'trimRule'):
        old = f'.extra (.ordinary (.{kind} '
        if old in value:
            need(value.count(old) == 1 and value.endswith(')⟩'), 'invalid wrapper')
            return value.replace(old, f'.extra (.{kind} ', 1)[:-2] + '⟩'
    need('.ordinary' not in value, 'unexpected ordinary payload')
    return value


def check(full, first, shard=None):
    source, bounded = arms(full), arms(first)
    need(set(source) == set(range(4106)), 'full inventory mismatch')
    need(set(bounded) == set(range(9)), 'first inventory mismatch')
    for i in range(9):
        need(unwrap(source[i]) == bounded[i], f'first source mismatch: {i}')
    if shard is not None:
        local = arms(shard)
        for i in range(9):
            need(local.get(i) == source[i], f'local source mismatch: {i}')


def main():
    need(len(sys.argv) == 2, 'expected generated FullLocal0000.lean path')
    full, first = load_inputs()
    need(first == first_shard.generate(), 'first data is not regenerated exact source')
    proof = (ROOT / 'audit/shard-aggregation/FirstRealShard.lean').read_text(encoding='utf8')
    need(proof == first_shard.generate_proof(), 'first proof is not regenerated exact source')
    shard = pathlib.Path(sys.argv[1]).read_text(encoding='utf8')
    check(full, first, shard)
    print('first nine full-source, local and bounded arms agree after ordinary-wrapper translation')
    print('Source-byte comparison only; Lean provenance and local-check transfer are not established.')


if __name__ == '__main__':
    main()
