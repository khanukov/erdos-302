#!/usr/bin/env python3
"""Archive-derived small-node bridge checks; run from an overlay on erdos-302."""
import argparse, hashlib, itertools, json, lzma, os, re, subprocess, sys
from pathlib import Path

ROOT = Path(os.environ.get('ERDOS302_SOURCE_ROOT', Path(__file__).resolve().parents[2]))
SOURCE = ROOT / 'audit/source/erdos302_boundary_certificates/baseline/bank.json.xz'
SHA = '5c1a1fa4edcc1a0bc7ac3fc9cd3bc7fca4eedad6cb689b6540436ca35ed89034'
SHARDS = 32
CHUNK = 20

def require(ok, message):
    if not ok: raise ValueError(message)

def inventory():
    raw = SOURCE.read_bytes()
    require(hashlib.sha256(raw).hexdigest() == SHA, 'archive hash mismatch')
    obj = json.loads(lzma.decompress(raw)); nodes = obj['nodes']
    require(obj['schema'] == 'erdos302-standalone-finite-proof-bank-v1' and len(nodes) == 4106, 'archive schema/count')
    small = []
    for i, n in enumerate(nodes):
        if n.get('t') != 'small': continue
        v, r = n['v'], n['r']
        require(set(n) == {'t','v','r'} and type(v) is list and v and all(type(x) is int and x > 0 for x in v) and v == sorted(set(v)) and type(r) is int and r >= 0, f'invalid node {i}')
        small.append((i,n))
    require(len(small) == 3528, 'small-node count')
    return small

def shard(data, index):
    require(0 <= index < SHARDS, 'invalid shard')
    return [entry for entry in data if entry[0] % SHARDS == index]

def source_for(batch):
    lines = ['import Bridge\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\nnamespace Archive\nopen SmallStd\n']
    for i, n in batch:
        v, r = n['v'], n['r']
        edges = [(a,b,c) for a,b,c in itertools.combinations(range(len(v)),3) if v[b]*v[c] == v[a]*(v[b]+v[c])]
        require(bool(edges), f'node {i} has no edges')
        lines.append(f'''theorem bank_node_{i} : Checked {v} {edges} {r} := by decide
#print axioms bank_node_{i}
theorem nodup_{i} : (show List ℕ from {v}).Nodup := by decide
#print axioms nodup_{i}
theorem cover_{i} (S : Finset ℕ) (hc : UpperBridge.OrderedCover (show List ℕ from {v}).toFinset S) : {r} ≤ S.card := by
  exact SmallStd.cover_lower bank_node_{i} nodup_{i} S hc
#print axioms cover_{i}
theorem finite_{i} (A : Finset ℕ) (hsub : A ⊆ (show List ℕ from {v}).toFinset) (hfree : Erdos302Lower.NoUnitFractionTriple A) : A.card + {r} ≤ (show List ℕ from {v}).toFinset.card := by
  exact SmallStd.finite_card_bound bank_node_{i} nodup_{i} hsub hfree
#print axioms finite_{i}
''')
    return ''.join(lines) + 'end Archive\n'

def check_axioms(output, names):
    require(not any(x in output for x in ('error:', 'sorryAx', 'ofReduceBool')), 'Lean error or forbidden axiom')
    for name in names:
        lines = [x for x in output.splitlines() if x.startswith(f"'{name}' ")]
        require(len(lines) == 1, f'missing or duplicate axiom report: {name}')
        m = re.fullmatch(r"'[^']+' (?:does not depend on any axioms|depends on axioms: \[([^\]]*)\])", lines[0])
        require(m is not None, f'malformed axiom report: {lines[0]}')
        require(not m.group(1) or set(m.group(1).split(', ')) <= {'propext','Classical.choice','Quot.sound'}, f'forbidden axiom: {lines[0]}')

def run(args, project, env, names):
    p = subprocess.run(['lean', *args], cwd=project, env=env, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=1800)
    print(p.stdout, end='', flush=True)
    require(p.returncode == 0, f'Lean failed: {args}')
    check_axioms(p.stdout, names)

def lean_search_path(project, lake_path):
    require(bool(lake_path), 'empty Lake search path')
    # Built Lake modules must precede the source root. Otherwise Lean sees
    # Erdos302Lower/Defs.lean and looks for a nonexistent adjacent olean.
    return lake_path + ':' + str(project)


def main():
    ap = argparse.ArgumentParser(); g = ap.add_mutually_exclusive_group(required=True)
    g.add_argument('--check-only', action='store_true'); g.add_argument('--shard', type=int)
    ap.add_argument('--project', type=Path); args = ap.parse_args()
    data = inventory(); parts = [shard(data, i) for i in range(SHARDS)]
    flat = [i for p in parts for i,_ in p]
    require(all(parts) and len(flat) == len(set(flat)) == len(data) and set(flat) == {i for i,_ in data}, 'partition mismatch')
    for p in parts:
        for i in range(0, len(p), CHUNK): source_for(p[i:i+CHUNK])
    print(f'archive-derived coverage: {len(flat)} unique nodes; shard sizes {[len(x) for x in parts]}', flush=True)
    if args.check_only: return
    require(args.project is not None, '--project required'); project = args.project.resolve()
    selected = shard(data,args.shard)
    version = subprocess.check_output(['lean','--version'], text=True)
    require('4.33.0-rc1' in version, f'wrong Lean: {version}')
    lp = subprocess.check_output(['lake','env','printenv','LEAN_PATH'], cwd=project, text=True).strip()
    env = dict(os.environ, LEAN_PATH=lean_search_path(project, lp))
    modules = [('Checker', ['SmallStd.sound','SmallStd.edges_sound']), ('Sound', ['SmallStd.lower_bound']), ('UpperBridge', ['UpperBridge.finite_card_bound']), ('Bridge', ['SmallStd.mask_bit','SmallStd.mask_lt','SmallStd.checked_orderedEdge','SmallStd.cover_lower'])]
    for mod,names in modules:
        text = (project/(mod+'.lean')).read_text()
        require(not re.search(r'\b(sorry|native_decide|admit)\b', text), f'forbidden proof token in {mod}')
        run(['-o', mod+'.olean', mod+'.lean'], project, env, names)
    # Fresh axiom report for the final generic bridge, too.
    (project/'Axioms.lean').write_text('import Bridge\n#print axioms SmallStd.finite_card_bound\n')
    run(['Axioms.lean'], project, env, ['SmallStd.finite_card_bound'])
    for j in range(0,len(selected),CHUNK):
        batch = selected[j:j+CHUNK]; text = source_for(batch)
        require(not re.search(r'\b(sorry|native_decide|admit)\b',text),'forbidden generated token')
        (project/'Certificate.lean').write_text(text)
        names = [f'Archive.{prefix}_{i}' for i,_ in batch for prefix in ('bank_node','nodup','cover','finite')]
        print(f'shard {args.shard}: {j}/{len(selected)}',flush=True)
        run(['Certificate.lean'], project, env, names)
    print(f'PASS shard {args.shard}: {len(selected)} nodes',flush=True)

if __name__ == '__main__':
    try: main()
    except (ValueError, OSError, KeyError, TypeError, subprocess.SubprocessError) as e:
        print(f'FAIL: {e}', file=sys.stderr); sys.exit(1)
