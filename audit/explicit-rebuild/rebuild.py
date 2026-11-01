import os, json, hashlib, shutil, re, subprocess, time, sys
from pathlib import Path
W=Path('/root/erdos-302-independent-audit/explicit-rebuild'); S=W/'sources'; O=W/'objects'; P=Path('/root/erdos-302-independent-audit/lower-rebuild/project')
manifest=json.loads(Path('/root/erdos302-explicit-lower/final-threshold-candidate/source_manifest.json').read_text())['files']
extra=[Path('/root/erdos302-explicit-lower/stronger-endpoint/StrongerEndpoint.lean'),Path('/root/erdos302-explicit-lower/stronger-endpoint/StrongerLiminf.lean')]
S.mkdir(exist_ok=True); O.mkdir(exist_ok=True)
mods={}; hashes={}
for src, expected in [(Path(p),h) for p,h in manifest.items()]+[(p,hashlib.sha256(p.read_bytes()).hexdigest()) for p in extra]:
 data=src.read_bytes(); actual=hashlib.sha256(data).hexdigest()
 if actual!=expected: raise Exception(f'hash mismatch {src}')
 rel=Path('Erdos302Lower')/src.name if '/lower-lean/' in str(src) else Path(src.name)
 if str(rel) in mods: raise Exception(f'duplicate {rel}')
 dst=S/rel; dst.parent.mkdir(parents=True,exist_ok=True); dst.write_bytes(data); mods[str(rel.with_suffix('')).replace('/','.')]=dst
 hashes[str(src)]={'sha256':actual,'copy':str(dst)}
(W/'source-hashes.json').write_text(json.dumps(hashes,indent=2)+'\n')
order=[]; visiting=set(); seen=set()
def visit(mod):
 if mod in seen:return
 if mod in visiting:raise Exception('cycle '+mod)
 visiting.add(mod)
 for dep in re.findall(r'^import\s+([A-Za-z0-9_.]+)',mods[mod].read_text(),re.M):
  if dep in mods:visit(dep)
 visiting.remove(mod);seen.add(mod);order.append(mod)
visit('LiminfAdapter'); baseline=set(seen)
visit('StrongerLiminf')
print('closure',len(baseline),'total',len(order),'missing',set(mods)-seen,flush=True)
if len(baseline)!=62 or len(order)!=64:raise Exception('unexpected closure')
path=subprocess.check_output(['/root/.elan/bin/lake','env','printenv','LEAN_PATH'],cwd=P,text=True).strip().split(':')
# Exclude prior project build to ensure all three local modules come from this build.
path=[x for x in path if x != str(P/'.lake/build/lib/lean')]
env=os.environ.copy();env['LEAN_PATH']=':'.join([str(O)]+path)
(W/'build-order.txt').write_text('\n'.join(order)+'\n');(W/'lean-path.txt').write_text(env['LEAN_PATH']+'\n')
lean='/root/.elan/toolchains/leanprover--lean4---v4.33.0-rc1/bin/lean'
for i,m in enumerate(order,1):
 if shutil.disk_usage(W).free < 3_000_000_000: raise Exception('disk guard below 3GB')
 target=O/Path(m.replace('.','/')+'.olean');target.parent.mkdir(parents=True,exist_ok=True)
 print(f'BUILD {i}/{len(order)} {m}',flush=True);start=time.monotonic()
 try:r=subprocess.run([lean,'-R',str(S),'-o',str(target),str(mods[m])],cwd=S,env=env,timeout=600)
 except subprocess.TimeoutExpired:print('TIMEOUT',m,flush=True);sys.exit(124)
 print(f'END {m} exit={r.returncode} seconds={time.monotonic()-start:.1f}',flush=True)
 if r.returncode:sys.exit(r.returncode)
print('REBUILD_OK baseline=62 overlay=59 stronger=2',flush=True)
check=W/'Check.lean';check.write_text('import StrongerLiminf\n#check Erdos302StrongerEndpoint.f302_stronger_pointwise\n#print axioms Erdos302StrongerEndpoint.f302_stronger_pointwise\n#check Erdos302StrongerEndpoint.f302_stronger_lower_candidate\n#print axioms Erdos302StrongerEndpoint.f302_stronger_lower_candidate\n#check Erdos302StrongerEndpoint.f302_stronger_liminf_lower\n#print axioms Erdos302StrongerEndpoint.f302_stronger_liminf_lower\n#check Erdos302StrongerEndpoint.five_eighths_lt_stronger_liminf\n#print axioms Erdos302StrongerEndpoint.five_eighths_lt_stronger_liminf\n')
r=subprocess.run([lean,str(check)],cwd=W,env=env);sys.exit(r.returncode)
