import json
import pathlib
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]

class UpperProjectTests(unittest.TestCase):
    def test_manifest_has_only_mathlib_and_its_dependencies(self):
        manifest = json.loads((ROOT / 'lake-manifest.json').read_text())
        packages = {p['name']: p for p in manifest['packages']}
        self.assertNotIn('erdos301', packages)
        self.assertNotIn('erdos327', packages)
        self.assertEqual(packages['mathlib']['rev'], 'da1f94df976c7cd38117281c57d6ee3046c8d104')
        self.assertFalse(packages['mathlib']['inherited'])

    def test_literal_no_triple_definition(self):
        text = (ROOT / 'lean/Erdos302Lower/Defs.lean').read_text()
        self.assertIn('∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A,\n    a ≠ b → a ≠ c → b ≠ c →\n      (1 : ℚ) / a ≠ (1 : ℚ) / b + (1 : ℚ) / c', text)

    def test_lake_roots_match_recursive_local_imports(self):
        import re
        import tomllib
        config = tomllib.loads((ROOT / 'lakefile.toml').read_text())
        roots = set(config['lean_lib'][0]['roots'])
        seen = set()
        def visit(name):
            if name in seen or name.startswith(('Mathlib', 'Lean', 'Std')):
                return
            path = ROOT / 'lean' / (name.replace('.', '/') + '.lean')
            self.assertTrue(path.is_file(), name)
            seen.add(name)
            for dep in re.findall(r'^import\s+([\w.]+)', path.read_text(), re.M):
                visit(dep)
        visit('UpperIntegration')
        self.assertEqual(roots, seen)
        self.assertNotIn('PrimePowerSum', seen)
        self.assertNotIn('Pack1094Tests', seen)  # monolithic proof previously exited 143

    def test_automatic_ci_builds_integration(self):
        text = (ROOT / '.github/workflows/upper-integration.yml').read_text()
        for s in ['pull_request:', 'push:', 'main', 'lake build UpperIntegration']:
            self.assertIn(s, text)

if __name__ == '__main__': unittest.main()
