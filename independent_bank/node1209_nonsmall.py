#!/usr/bin/env python3
"""Generate literal dense-DAG case/trim checker candidates, not semantic assumptions."""
import sys
from pathlib import Path
import node1209_closure as closure
import node1209_dense as dense

OUT = closure.ROOT / 'audit/node1209-nonsmall'
EXPECTED = ((4, 4, 'case'), (5, 5, 'trim'), (7, 7, 'case'),
            (8, 8, 'trim'), (14, 14, 'case'), (15, 15, 'trim'),
            (374, 1190, 'case'))

def generate(doc):
    actual = tuple((i, n['original'], n['raw_node']['t'])
                   for i, n in enumerate(doc['nodes'])
                   if n['raw_node']['t'] in ('case', 'trim'))
    if actual != EXPECTED:
        raise ValueError('case/trim inventory changed')
    files = {}
    for i, original, kind in EXPECTED:
        name = f'Node1209NonSmall{i:03}'
        text = f'''import Dense

/- Original node {original}, {kind}; direct check on the actual dense DAG.
   This declaration assumes neither checker validity nor predecessor bounds. -/
namespace {name}
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000

theorem check : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes {i} := by
  decide

-- Explicit exact-type gate, independent of the axiom gate below.
example : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes {i} := check
#print axioms check
end {name}
'''
        files[name + '.lean'] = text.encode()
    return files

def check_files(expected, actual):
    if actual != expected:
        raise ValueError('non-small generated inventory or bytes mismatch')

def main():
    closure.verify()
    doc = closure.extract()
    if dense.OUT.read_bytes() != dense.generate(doc).encode():
        raise ValueError('dense bytes mismatch')
    files = generate(doc)
    if sys.argv[1:] == ['--write']:
        OUT.mkdir(parents=True, exist_ok=True)
        for name, content in files.items():
            (OUT / name).write_bytes(content)
    elif sys.argv[1:] == ['--check']:
        check_files(files, {p.name: p.read_bytes() for p in OUT.glob('*.lean')})
    else:
        raise SystemExit('use --write or --check')
    print('PASS: 4 case, 3 trim; byte correspondence is Python evidence only')

if __name__ == '__main__':
    main()
