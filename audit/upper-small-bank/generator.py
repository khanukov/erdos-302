#!/usr/bin/env python3
"""Generate literal source-indexed Lean proofs; source is parsed as JSON only."""
import itertools, json, lzma, hashlib, pathlib, subprocess, time, shutil, os, sys
ROOT = pathlib.Path(__file__).resolve().parent
SOURCE = pathlib.Path('/root/erdos-302-independent-audit/source/erdos302_boundary_certificates/baseline/bank.json.xz')
PROJECT = pathlib.Path('/root/erdos-302-independent-audit/lower-rebuild/project')
BANK = '/root/erdos-302-independent-audit/upper-bank'

def validate(n):
    if set(n) != {'t','v','r'} or n['t'] != 'small' or type(n['v']) is not list or not n['v'] or any(type(x) is not int or x <= 0 for x in n['v']) or sorted(set(n['v'])) != n['v'] or type(n['r']) is not int or n['r'] < 0:
        raise ValueError('invalid small node: ' + repr(n))

def edges(v):
    return [(a,b,c) for a,b,c in itertools.combinations(v,3) if b*c == a*(b+c)]

def fs(v): return '{' + ', '.join(map(str,v)) + '}'

def theorem(i,n):
    validate(n)
    es=edges(n['v'])
    if not es: raise ValueError('no edges in source node '+str(i))
    e=', '.join(fs(x) for x in es)
    lines=[f'theorem bank_node_{i} : ∀ S : Finset ℕ,',f"    UpperBridge.OrderedCover ({fs(n['v'])} : Finset ℕ) S → {n['r']} ≤ S.card := by",f'  apply UpperBank.ordered_sound (E := {{{e}}})','  · decide','  · intro e he','    simp only [Finset.mem_insert, Finset.mem_singleton] at he']
    if len(es)==1: lines += ['    subst e']
    else: lines += ['    rcases he with ' + ' | '.join('rfl' for _ in es)]
    for a,b,c in es:
        lines += [f'    · exact ⟨{a}, {b}, {c}, by unfold UpperBridge.OrderedEdge; decide, rfl⟩' if len(es)>1 else f'    exact ⟨{a}, {b}, {c}, by unfold UpperBridge.OrderedEdge; decide, rfl⟩']
    lines += [f'#print axioms bank_node_{i}']
    return '\n'.join(lines)+'\n'

def main():
    import argparse
    ap=argparse.ArgumentParser(); ap.add_argument('--seconds',type=int,default=600); ap.add_argument('--chunk',type=int,default=20); ap.add_argument('--timeout',type=int,default=90); args=ap.parse_args()
    if args.seconds<=0 or args.chunk<=0 or args.timeout<=0: raise ValueError('limits must be positive')
    raw=SOURCE.read_bytes(); obj=json.loads(lzma.decompress(raw)); nodes=obj['nodes']
    if obj['schema']!='erdos302-standalone-finite-proof-bank-v1' or len(nodes)!=4106: raise ValueError('unexpected source')
    small=[(i,n) for i,n in enumerate(nodes) if n.get('t')=='small']
    if len(small)!=3528: raise ValueError('unexpected small count')
    for _,n in small: validate(n)
    # Prioritize cheap instances and preserve source indices in every theorem.
    small.sort(key=lambda x:(len(x[1]['v']),x[0]))
    out=ROOT/'generated'; out.mkdir(exist_ok=True)
    for p in out.glob('*'): p.unlink()
    results=[]; start=time.monotonic(); compiled=[]
    env=os.environ.copy(); env['LEAN_PATH']=BANK+':'+str(PROJECT/'.lake/build/lib/lean')
    for k in range(0,len(small),args.chunk):
        if time.monotonic()-start>=args.seconds or shutil.disk_usage(ROOT).free < 3*1024**3: break
        batch=small[k:k+args.chunk]; name=f'Chunk{k//args.chunk:04d}'; path=out/(name+'.lean')
        path.write_text('import UpperBank\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\nnamespace BaselineSmall\n'+''.join(theorem(i,n) for i,n in batch)+'end BaselineSmall\n')
        remaining=max(1,int(args.seconds-(time.monotonic()-start))); timeout=min(args.timeout,remaining)
        p=subprocess.Popen(['lake','env','lean',str(path)],cwd=PROJECT,env=env,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,start_new_session=True)
        try:
            log,_=p.communicate(timeout=timeout)
            success=p.returncode==0
        except subprocess.TimeoutExpired:
            import signal
            os.killpg(p.pid,signal.SIGKILL)
            log,_=p.communicate()
            log+='\nTIMEOUT\n'; success=False
        (out/(name+'.log')).write_text(log)
        # Require a successful axiom query for each exact generated declaration.
        for i,n in batch:
            if f"'BaselineSmall.bank_node_{i}' depends on axioms:" not in log and f"'BaselineSmall.bank_node_{i}' does not depend on any axioms" not in log: success=False
        if 'sorryAx' in log or 'error:' in log: success=False
        ids=[i for i,_ in batch]; results.append({'chunk':name,'indices':ids,'success':success,'source_sha256':hashlib.sha256(path.read_bytes()).hexdigest()})
        if success: compiled.extend(ids)
        print(name, 'PASS' if success else 'FAIL',len(ids), 'total',len(compiled),flush=True)
    source_ids={i for i,_ in small}; compiled_set=set(compiled)
    if len(compiled)!=len(compiled_set) or not compiled_set <= source_ids: raise ValueError('coverage mismatch')
    manifest={'source_sha256':hashlib.sha256(raw).hexdigest(),'source_nodes':len(nodes),'source_small':len(small),'compiled_count':len(compiled),'compiled_indices':sorted(compiled),'uncompiled_indices':sorted(source_ids-compiled_set),'chunks':results,'complete':compiled_set==source_ids,'note':'Only successful whole chunks with all axiom queries are counted.'}
    (ROOT/'coverage.json').write_text(json.dumps(manifest,indent=2)+'\n')
    print('COVERAGE',len(compiled),'/',len(small),flush=True)
    return 0 if manifest['complete'] else 2
if __name__=='__main__': sys.exit(main())
