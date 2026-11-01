#!/usr/bin/env python3
"""Check recorded correspondence, hashes, per-declaration axioms and exit status."""
import hashlib,json,lzma,pathlib,re
import generator
R=pathlib.Path(__file__).resolve().parent
m=json.loads((R/'coverage.json').read_text()); raw=generator.SOURCE.read_bytes(); nodes=json.loads(lzma.decompress(raw))['nodes']
assert hashlib.sha256(raw).hexdigest()==m['source_sha256']
assert hashlib.sha256((R/'Checker.lean').read_bytes()).hexdigest()==m['checker_sha256']
prior=set(json.loads((R.parent/'upper-small-bank/coverage.json').read_text())['compiled_indices'])|{4022}
assert prior==set(m['prior_indices']) and len(prior)==1901
small={i for i,n in enumerate(nodes) if n.get('t')=='small'}; target=small-prior
assert len(target)==m['requested_count']==1627
seen=set(); verified=set()
for ch in m['chunks']:
    ids=ch['indices']; assert not (set(ids)&seen); seen.update(ids); assert set(ids)<=target
    p=R/'generated'/(ch['chunk']+'.lean'); log=(R/'generated'/(ch['chunk']+'.log')).read_text()
    assert hashlib.sha256(p.read_bytes()).hexdigest()==ch['sha256']
    text=p.read_text(); expected='import Checker\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\nnamespace Archive\nopen SmallStd\n'+''.join(generator.theorem(i,nodes[i]) for i in ids)+'end Archive\n'
    assert text==expected
    if ch['success']:
        assert ch['returncode']==0 and 'error:' not in log and 'sorryAx' not in log
        for i in ids:
            assert f"'Archive.bank_node_{i}' does not depend on any axioms" in log or f"'Archive.bank_node_{i}' depends on axioms: [propext]" in log
        verified.update(ids)
assert verified==set(m['checked_indices']) and target-verified==set(m['unverified_indices'])
print('source-index and recorded-log verification:',len(verified),'/',len(target),'unverified',len(target-verified))
