#!/usr/bin/env python3
"""Generate and kernel-check source-indexed certificates; never execute archive code."""
import argparse, hashlib, itertools, json, lzma, os, pathlib, resource, shutil, signal, subprocess, time
ROOT = pathlib.Path(__file__).resolve().parent
BASE = ROOT.parent
SOURCE = BASE/'source/erdos302_boundary_certificates/baseline/bank.json.xz'

def edges(v):
    return [(i,j,k) for i,j,k in itertools.combinations(range(len(v)),3) if v[j]*v[k] == v[i]*(v[j]+v[k])]

def theorem(i,n):
    v=n['v']; es=edges(v)
    if not es: raise ValueError(f'no edges in node {i}')
    return f"theorem bank_node_{i} : Checked {v} {es} {n['r']} := by decide\n#print axioms bank_node_{i}\n"

def main():
    p=argparse.ArgumentParser(); p.add_argument('--seconds',type=int,default=900);p.add_argument('--timeout',type=int,default=90);p.add_argument('--chunk',type=int,default=20);p.add_argument('--mem-gib',type=int,default=5); a=p.parse_args()
    if min(a.seconds,a.timeout,a.chunk,a.mem_gib)<=0: raise ValueError('positive limits required')
    raw=SOURCE.read_bytes(); obj=json.loads(lzma.decompress(raw)); nodes=obj['nodes']
    if obj['schema']!='erdos302-standalone-finite-proof-bank-v1' or len(nodes)!=4106: raise ValueError('source mismatch')
    small=[]
    for i,n in enumerate(nodes):
        if n.get('t')!='small': continue
        v=n['v']; r=n['r']
        if set(n)!={'t','v','r'} or not v or any(type(x)!=int or x<=0 for x in v) or v!=sorted(set(v)) or type(r)!=int or r<0: raise ValueError(f'bad node {i}')
        small.append((i,n))
    if len(small)!=3528: raise ValueError('unexpected count')
    prior=set(json.loads((BASE/'upper-small-bank/coverage.json').read_text())['compiled_indices']) | {4022}
    if len(prior)!=1901 or not prior <= {i for i,_ in small}: raise ValueError('prior mismatch')
    old=json.loads((BASE/'upper-small-std/coverage.json').read_text())
    assert hashlib.sha256(raw).hexdigest()==old['source_sha256']
    assert hashlib.sha256((ROOT/'Checker.lean').read_bytes()).hexdigest()==old['checker_sha256']
    wanted=old['unverified_indices']; assert len(wanted)==207 and len(set(wanted))==207
    assert set(wanted)==({i for i,_ in small}-prior-set(old['checked_indices']))
    remaining=[x for x in small if x[0] in set(wanted)]
    assert {i for i,_ in remaining}==set(wanted) and all(len(n['v'])==9 for _,n in remaining)
    remaining.sort(key=lambda z:z[0])
    out=ROOT/'generated';out.mkdir(exist_ok=True)
    if list(out.iterdir()): raise RuntimeError('generated directory not empty; preserve prior evidence')
    results=[]; checked=[]; start=time.monotonic(); env=dict(os.environ,LEAN_PATH=str(ROOT))
    for k in range(0,len(remaining),a.chunk):
        if time.monotonic()-start>=a.seconds or shutil.disk_usage(ROOT).free < 3*1024**3: break
        batch=remaining[k:k+a.chunk]; name=f'Chunk{k//a.chunk:04d}'; path=out/(name+'.lean')
        path.write_text('import Checker\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\nnamespace Archive\nopen SmallStd\n'+''.join(theorem(i,n) for i,n in batch)+'end Archive\n')
        def limits(): resource.setrlimit(resource.RLIMIT_AS,(a.mem_gib*1024**3,a.mem_gib*1024**3))
        proc=subprocess.Popen(['lean','+leanprover/lean4:v4.27.0',str(path)],cwd=ROOT,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,start_new_session=True,preexec_fn=limits)
        try: log,_=proc.communicate(timeout=min(a.timeout,max(1,a.seconds-(time.monotonic()-start))))
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid,signal.SIGKILL); log,_=proc.communicate(); log+='\nTIMEOUT\n'
        (out/(name+'.log')).write_text(log)
        ok=proc.returncode==0 and 'error:' not in log and 'sorryAx' not in log
        for i,_ in batch:
            ok &= f"'Archive.bank_node_{i}' does not depend on any axioms" in log or f"'Archive.bank_node_{i}' depends on axioms: [propext]" in log
        ids=[i for i,_ in batch];results.append({'chunk':name,'indices':ids,'success':bool(ok),'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'returncode':proc.returncode})
        if ok: checked+=ids
        print(name,'PASS' if ok else 'FAIL',len(ids),'total',len(checked),flush=True)
        manifest={'source_sha256':hashlib.sha256(raw).hexdigest(),'checker_sha256':hashlib.sha256((ROOT/'Checker.lean').read_bytes()).hexdigest(),'prior_indices':sorted(prior),'requested_count':len(remaining),'checked_indices':sorted(checked),'unverified_indices':sorted({i for i,_ in remaining}-set(checked)),'chunks':results}
        (ROOT/'coverage.json').write_text(json.dumps(manifest,indent=2)+'\n')
    print('COVERAGE',len(checked),'/',len(remaining),flush=True)
    return 0 if len(checked)==len(remaining) else 2
if __name__=='__main__': raise SystemExit(main())
