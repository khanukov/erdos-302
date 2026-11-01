#!/usr/bin/env python3
import hashlib,json,lzma,pathlib,re
import generator
R=pathlib.Path(__file__).resolve().parent
old=json.loads((R.parent/'upper-small-std/coverage.json').read_text())
m=json.loads((R/'coverage.json').read_text())
raw=generator.SOURCE.read_bytes(); nodes=json.loads(lzma.decompress(raw))['nodes']
assert hashlib.sha256(raw).hexdigest()==old['source_sha256']==m['source_sha256']
assert hashlib.sha256((R/'Checker.lean').read_bytes()).hexdigest()==old['checker_sha256']==m['checker_sha256']
target=set(old['unverified_indices']); assert len(target)==207 and m['requested_count']==207
seen=set(); verified=set(); failed=[]
for ch in m['chunks']:
    ids=ch['indices']; assert 1<=len(ids)<=5 and len(ids)==len(set(ids)) and not set(ids)&seen and set(ids)<=target
    seen.update(ids)
    p=R/'generated'/(ch['chunk']+'.lean'); log=(R/'generated'/(ch['chunk']+'.log')).read_text()
    assert hashlib.sha256(p.read_bytes()).hexdigest()==ch['sha256']
    expected='import Checker\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\nnamespace Archive\nopen SmallStd\n'+''.join(generator.theorem(i,nodes[i]) for i in ids)+'end Archive\n'
    assert p.read_text()==expected
    ok=ch['returncode']==0 and 'error:' not in log and 'sorryAx' not in log and 'TIMEOUT' not in log
    for i in ids:
        ok &= f"'Archive.bank_node_{i}' does not depend on any axioms" in log or f"'Archive.bank_node_{i}' depends on axioms: [propext]" in log
    assert bool(ok)==ch['success']
    if ok: verified.update(ids)
    else: failed.append((ch['chunk'],ids,ch['returncode']))
assert verified==set(m['checked_indices']) and target-verified==set(m['unverified_indices'])
print('verified',len(verified),'/',len(target),'attempted',len(seen),'failed chunks',failed,'unverified',len(target-verified))
