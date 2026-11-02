"""Deterministic data-only sufficient seed subset; not a Lean proof.

Witness order is bank node order followed by extension row order. At each level,
retain the first maximum seed witness at every point where seed strictly exceeds
all other recurrence terms. The resulting subset reproduces every profile by
induction; the emitted replay verifies this independently. Not claimed minimal.
"""
from array import array
from collections import Counter
import json
from pathlib import Path
from seed_reconstruction import X, ranks, seeds, extensions, load_inputs, renew_level, table_hash
from verify_bank import HASH, PRIMES, verify, need
from replay_inventory import inventory

ROOT = Path(__file__).resolve().parents[1]

def select_seed(witnesses, rank, level, limit):
    values = array('I', [0]) * (limit + 1)
    owners = array('i', [-1]) * (limit + 1)
    for i, (s, k) in enumerate(witnesses):
        allowed = [v for v in s if rank[v] <= level]
        d = k - sum(v % 2 == 0 and rank[v] > level for v in s) - len(allowed)
        need(d <= 0, 'projection empty bound')
        for v in allowed:
            d += 1
            if d > values[v]:
                values[v] = d
                owners[v] = i
    return values, owners

def collect(oldparent, parent, seed, owners, prime, intervals):
    limit = len(seed)-1
    diff = array('i', [0]) * (limit+2)
    for a,b in intervals:
        if a <= limit: diff[a] += 1
        if b <= limit: diff[b] -= 1
    old = array('I', [0]) * (limit+1)
    new = array('I', [0]) * (limit+1)
    required = set(); runs = []; last = None; start = 1; iv = 0
    for n in range(1, limit+1):
        iv += diff[n]
        old[n] = oldparent[n] + old[n//prime] + iv
        rec = parent[n] + new[n//prime]
        monotone = new[n-1]
        new[n] = max(rec, monotone, old[n], seed[n])
        c = new[n] - rec
        if seed[n] > max(rec, monotone, old[n]):
            need(owners[n] >= 0, 'missing seed owner')
            required.add(owners[n])
        # Positive correction only: include all tied active max operands, with
        # the deterministic first maximizing seed source whenever seed is active.
        mask = ((1 if rec == new[n] else 0) | (2 if monotone == new[n] else 0)
                | (4 if old[n] == new[n] else 0) | (8 if seed[n] == new[n] else 0))
        key = (c, mask, owners[n] if mask & 8 else -1) if c else None
        if key != last:
            if last is not None: runs.append([start, n, *last])
            start = n; last = key
    if last is not None: runs.append([start, limit+1, *last])
    return old, new, required, runs

def build():
    bank, intervals, rows, report = load_inputs(ROOT/'input/erdos302_boundary_certificates_publication.zip')
    need(len(PRIMES) == 20, 'prime levels')
    need(type(intervals) is dict and type(intervals.get('intervals')) is list
         and len(intervals['intervals']) == 20, 'interval levels')
    need(type(report) is dict and type(report.get('levels')) is list
         and len(report['levels']) == 20, 'report levels')
    results = verify(bank, intervals)
    ext = extensions(rows, results)
    need(len(results) == 4106 and len(ext) == 515 and len(rows) == len(ext), 'witness counts')
    ws = results + ext; rank = ranks(X)
    old = array('I', [0])*(X+1); parent = array('I', [0])*(X+1)
    required = set(); hashes=[]; final_runs=[]; previous_old=old
    for lev,(p,iv,expected) in enumerate(zip(PRIMES, reversed(intervals['intervals']), report['levels'])):
        seed, owners = select_seed(ws, rank, lev, X)
        old,new,chosen,runs = collect(old,parent,seed,owners,p,iv)
        need(table_hash(new)==expected['table_sha256'], f'full hash level {lev}')
        # Independently verify exact correction intervals and old/new recurrence.
        old2,new2,cells=renew_level(array('I',[0])*(X+1) if lev==0 else previous_old, parent, seed, p, iv)
        need(old==old2 and new==new2 and cells==expected['cells'], f'full recurrence level {lev}')
        previous_old=old
        required.update(chosen); hashes.append(table_hash(new)); parent=new
        if lev==len(PRIMES)-1: final_runs=runs
        print(f'level {lev+1}: selected {len(chosen)}; cumulative {len(required)}', flush=True)
    selected=sorted(required)
    # Actual reduced-source replay, not just a selection argument.
    old=array('I',[0])*(X+1); parent=array('I',[0])*(X+1)
    for lev,(p,iv,expected) in enumerate(zip(PRIMES,reversed(intervals['intervals']),report['levels'])):
        seed=seeds([ws[i] for i in selected],rank,lev,X)
        old,parent,cells=renew_level(old,parent,seed,p,iv)
        need(table_hash(parent)==hashes[lev] and cells==expected['cells'], f'subset mismatch level {lev}')
    n=len(results); bank_ids=[i for i in selected if i<n]; ext_ids=[i-n for i in selected if i>=n]
    roots=set(bank_ids) | {rows[i]['source_node'] for i in ext_ids}
    inv=inventory(bank,rows); deps=inv['dependencies']; closure=set(roots); todo=list(roots)
    while todo:
        for dep in deps[todo.pop()]:
            if dep not in closure: closure.add(dep); todo.append(dep)
    return {'archive_sha256': HASH, 'limit': X, 'witness_index_convention': 'bank indices 0..4105; extension row i is witness 4106+i',
            'selection': 'first max seed source where seed strictly exceeds recurrence, monotone, and old; union over levels',
            'bank_seed_indices': bank_ids, 'extension_row_indices': ext_ids,
            'dependency_roots': sorted(roots), 'dependency_closure': sorted(closure),
            'dependency_types': dict(sorted(Counter(bank['nodes'][i]['t'] for i in closure).items())),
            'profile_sha256': hashes, 'final_level_prime': PRIMES[-1],
            'final_positive_runs_format': '[start,end,correction,active_mask,seed_witness]; half-open; mask rec=1 monotone=2 old=4 seed=8; -1=no active seed',
            'final_positive_runs': final_runs}

def main():
    data=build(); out=ROOT/'independent_bank/seed_subset_certificate.json'
    out.write_text(json.dumps(data,sort_keys=True,separators=(',',':'))+'\n')
    print('wrote',out,'bank',len(data['bank_seed_indices']),'extensions',len(data['extension_row_indices']),'closure',len(data['dependency_closure']),'final runs',len(data['final_positive_runs']))
if __name__=='__main__': main()
