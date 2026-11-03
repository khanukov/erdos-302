import importlib.util
import pathlib
import shutil
import subprocess
import sys
import tempfile
import unittest

HERE = pathlib.Path(__file__).resolve().parent

class GenerateTests(unittest.TestCase):
    def test_coverage_handles_empty_tail_after_all_vertex_cases(self):
        spec = importlib.util.spec_from_file_location('generate', HERE / 'generate.py')
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        coverage = mod.generate()[mod.OUT / 'Coverage.lean']
        self.assertIn('theorem all_shards : ∀ v, v ∈ V → SparseBoundaryShards.shard S D v = true := by', coverage)
        self.assertIn('h1876 | h1888 | hnil\n', coverage)
        self.assertIn('  · subst v; exact shard1888_full\n  · cases hnil\n', coverage)

    def test_source_eq_uses_literal_fold_without_changing_statement(self):
        spec = importlib.util.spec_from_file_location('generate', HERE / 'generate.py')
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        source = mod.generate()[mod.OUT / 'SourceEq.lean']
        self.assertIn('theorem source_eq : S.toFinset = ExtensionFirstArchive.source := by\n', source)
        self.assertIn('theorem literalFinset_eq_toFinset', source)
        self.assertNotIn('source := by decide', source)

    def test_check_rejects_changed_generated_bytes(self):
        root = HERE.parents[1]
        with tempfile.TemporaryDirectory() as tmp:
            dest = pathlib.Path(tmp)
            (dest / 'audit/actual-sparse64').mkdir(parents=True)
            shutil.copy2(HERE / 'generate.py', dest / 'audit/actual-sparse64/generate.py')
            shutil.copytree(root / 'lean/ActualSparse64', dest / 'lean/ActualSparse64')
            shutil.copy2(root / 'lean/ExtensionBoundaryData.lean', dest / 'lean/ExtensionBoundaryData.lean')
            cmd = [sys.executable, str(dest / 'audit/actual-sparse64/generate.py'), '--check']
            self.assertEqual(subprocess.run(cmd, capture_output=True).returncode, 0)
            source = dest / 'lean/ActualSparse64/SourceEq.lean'
            source.write_bytes(source.read_bytes().replace(b'\n', b'\r\n', 1))
            result = subprocess.run(cmd, capture_output=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn(b'content mismatch', result.stderr)

    def test_aggregate_is_split_into_isolated_stages(self):
        spec = importlib.util.spec_from_file_location('generate', HERE / 'generate.py')
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        files = mod.generate()
        for name in ('Outside', 'Subsets', 'Coverage', 'Checked', 'SourceEq', 'TargetEq', 'DeleteEq', 'All'):
            self.assertIn(mod.OUT / (name + '.lean'), files)
        self.assertNotIn('by decide', files[mod.OUT / 'All.lean'])

    def test_generated_inventory_and_data(self):
        spec = importlib.util.spec_from_file_location('generate', HERE / 'generate.py')
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        files = mod.generate()
        shards = [p for p in files if p.name.startswith('Vertex')]
        self.assertEqual(len(shards), 64)
        self.assertEqual(len(set(shards)), 64)
        self.assertIn(HERE.parents[1] / 'lean/ActualSparse64/All.lean', files)

if __name__ == '__main__':
    unittest.main()
