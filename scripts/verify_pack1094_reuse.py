#!/usr/bin/env python3
"""Admit only the original first-attempt run with all successful producers."""
import json
import sys
from collections import Counter

SHA = '5201645d256bdbecb248833993ee475dee11c069'

def validate_run(run, jobs):
    expected = dict(id=41347502663, head_sha=SHA, run_attempt=1,
                    event='workflow_dispatch', path='.github/workflows/pack-node1094-scale.yml')
    if any(run.get(k) != v for k, v in expected.items()):
        raise ValueError('original run identity mismatch')
    required = {'upstream'} | {f'shard ({i})' for i in range(88)}
    counts = Counter(j['name'] for j in jobs)
    if any(counts[n] != 1 for n in required):
        raise ValueError('missing or duplicate producer job')
    if any(j['status'] != 'completed' or j['conclusion'] != 'success' for j in jobs if j['name'] in required):
        raise ValueError('producer job not successful')
    assembly = [j for j in jobs if j['name'] == 'assembly']
    if len(assembly) != 1:
        raise ValueError('missing or duplicate original assembly job')
    print('Original assembly status:', assembly[0]['status'], assembly[0]['conclusion'])

if __name__ == '__main__':
    try:
        run = json.load(open(sys.argv[1]))
        page = json.load(open(sys.argv[2]))
        if page['total_count'] != len(page['jobs']):
            raise ValueError('incomplete jobs page')
        validate_run(run, page['jobs'])
    except (OSError, ValueError, KeyError, IndexError) as exc:
        raise SystemExit(str(exc))
