#!/usr/bin/env python3
import hashlib, importlib.util, json, re, subprocess, sys, tempfile, unittest, zipfile
from fractions import Fraction
from pathlib import Path
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1]
ARCHIVE=ROOT.parents[1]/'input/erdos302_boundary_certificates_publication.zip'
ORDER=[3,2,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71]
C=Fraction(5257732070693282578339807052385333596114146444258874863366093099862086223334703221767412397,6250046986665851271465761945238620015244311869639997944823697072137494392402703576166400000)

def independent_check(levels):
    if [l['prime'] for l in levels] != ORDER: return False
    count=0; gain=Fraction(); rho=Fraction(1); error=0
    for i,l in enumerate(levels):
        last=1
        for a,b,h in l['cells']:
            if not (last <= a < b <= 500001 and h>0): return False
            last=b; count+=1
            gain += rho*h*Fraction(b-a,a*b)
            error += (1 << (i+1))*h
        rho *= Fraction(l['prime']-1,l['prime'])
    return count==4705 and 1-gain==C and error==55064831540

class Audit(unittest.TestCase):
    def setUp(self): self.d=json.loads((ROOT/'ledger.json').read_text())
    def test_original_and_transcription(self):
        self.assertEqual(hashlib.sha256(ARCHIVE.read_bytes()).hexdigest(),'9396819eb36e25926d7ae8ee78b85c61cb898801f935fccfe72ebcad491bc196')
        with zipfile.ZipFile(ARCHIVE) as z:
            source=json.loads(z.read('erdos302_boundary_certificates/baseline/VERIFIED_REPORT.json'))
        self.assertEqual(self.d['levels'],[{'prime':l['prime'],'cells':l['cells']} for l in source['levels']])
        self.assertTrue(independent_check(self.d['levels']))
        text=(ROOT/'lean/ArchiveLedger.lean').read_text()
        pieces=re.findall(r'def cells(\d+) : List Cell := \[\n(.*?)\n\]',text,re.S)
        self.assertEqual(len(pieces),20)
        for i,chunk in pieces:
            triples=[list(map(int,x)) for x in re.findall(r'⟨(\d+), (\d+), (\d+)⟩',chunk)]
            self.assertEqual(triples,self.d['levels'][int(i)]['cells'])
        pairs=re.findall(r'⟨(\d+), cells(\d+)⟩',text)
        self.assertEqual([(int(p),int(i)) for p,i in pairs],list(zip(ORDER,range(20))))
    def test_mutations_rejected(self):
        for kind in ('prime','height','endpoint','missing','order'):
            d=json.loads(json.dumps(self.d['levels']))
            if kind=='prime': d[0]['prime']=7
            elif kind=='height': d[1]['cells'][0][2]+=1
            elif kind=='endpoint': d[1]['cells'][0][1]+=1
            elif kind=='missing': d[1]['cells'].pop()
            else: d[1]['cells'].reverse()
            self.assertFalse(independent_check(d),kind)
    def test_deterministic_generator(self):
        spec=importlib.util.spec_from_file_location('gen',ROOT/'tools/generate_lean.py'); mod=importlib.util.module_from_spec(spec); spec.loader.exec_module(mod)
        self.assertEqual(mod.render(self.d),(ROOT/'lean/ArchiveLedger.lean').read_text())
    def test_cli_regeneration_is_byte_exact(self):
        with tempfile.TemporaryDirectory() as tmp:
            data = Path(tmp)/'ledger.json'
            lean = Path(tmp)/'ArchiveLedger.lean'
            subprocess.run([sys.executable, str(ROOT/'tools/export_archive_ledger.py'), str(ARCHIVE), str(data)], check=True)
            self.assertEqual(data.read_bytes(), (ROOT/'ledger.json').read_bytes())
            subprocess.run([sys.executable, str(ROOT/'tools/generate_lean.py'), str(data), str(lean)], check=True)
            self.assertEqual(lean.read_bytes(), (ROOT/'lean/ArchiveLedger.lean').read_bytes())

    def test_export_reads_only_hashed_bytes(self):
        spec=importlib.util.spec_from_file_location('export',ROOT/'tools/export_archive_ledger.py')
        mod=importlib.util.module_from_spec(spec); spec.loader.exec_module(mod)
        raw=ARCHIVE.read_bytes()
        with patch.object(Path, 'read_bytes', return_value=raw):
            result=mod.export(Path('/nonexistent/archive.zip'))
        self.assertEqual(result, self.d)

    def test_duplicate_keys_rejected(self):
        spec=importlib.util.spec_from_file_location('export',ROOT/'tools/export_archive_ledger.py'); mod=importlib.util.module_from_spec(spec); spec.loader.exec_module(mod)
        with self.assertRaises(ValueError): json.loads('{"a":1,"a":2}',object_pairs_hook=mod.unique_object)

if __name__=='__main__': unittest.main()
