import importlib.util
from pathlib import Path
import shutil
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
def load(name):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).with_name(name + '.py'))
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module
closure = load('sparse_mathlib_closure')
axioms = load('sparse_axioms')

class SparseMathlibCI(unittest.TestCase):
    def test_exact_staging_and_mutations(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp) / 'root'
            (root / 'lean').mkdir(parents=True)
            for name in closure.MODULES:
                shutil.copyfile(ROOT / 'lean' / (name + '.lean'), root / 'lean' / (name + '.lean'))
            dest = Path(tmp) / 'stage'
            closure.stage(root, dest)
            with self.assertRaises(ValueError): closure.stage(root, dest)
            p = root / 'lean' / 'SparseBoundaryMathlib.lean'
            original = p.read_text()
            for suffix in ('\nimport Extra\n', '\npublic import Extra\n', '\nsorry\n', '\nnative_decide\n'):
                p.write_text(original + suffix)
                with self.assertRaises(ValueError): closure.validate(root)
            p.write_text(original.replace('import SparseBoundary\n', ''))
            with self.assertRaises(ValueError): closure.validate(root)

    def test_workflow_compile_and_gate_inventories(self):
        text = (ROOT / '.github/workflows/sparse-boundary-mathlib.yml').read_text()
        import re
        loops = re.findall(r'for f in ([^;]+); do', text)
        self.assertEqual(len(loops), 2)
        self.assertEqual(loops[0].split(), list(closure.MODULES))
        self.assertEqual(set(loops[1].split()), set(axioms.REPORTS))
        self.assertEqual(len(loops[1].split()), len(axioms.REPORTS))

    def test_axiom_inventory_rejects_bad_reports(self):
        module = 'SparseBoundaryMathlib'
        names = sorted(axioms.REPORTS[module])
        good = ''.join(f"'{n}' does not depend on any axioms\n" for n in names)
        axioms.gate(module, good)
        bad = [good.splitlines()[0], good + good, good + "'Extra.x' does not depend on any axioms\n", good.replace('does not depend on any axioms', 'depends on axioms: [Fake.custom]', 1), good + 'error: failure']
        for text in bad:
            with self.subTest(text=text), self.assertRaises(ValueError): axioms.gate(module, text)

if __name__ == '__main__': unittest.main()
