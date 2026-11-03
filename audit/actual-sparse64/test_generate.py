import importlib.util
import pathlib
import unittest

HERE = pathlib.Path(__file__).resolve().parent

class GenerateTests(unittest.TestCase):
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
