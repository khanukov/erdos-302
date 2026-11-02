"""Exact-byte checks complement the node-only semantic round-trip checks."""
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

import archive_prefix
import mixed_artifact
import mixed_lean_producer
import mixed_prefix_export
import first_shard

ROOT = Path(__file__).resolve().parents[1]

class MixedArtifactTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        doc = mixed_prefix_export.export(archive_prefix.load_bank())
        cls.full = (f'/- CLI loaded pinned archive SHA-256 {archive_prefix.SHA256}; transcription is not a provenance proof. -/\n' + mixed_lean_producer.render(doc)).encode('utf-8')

    def run_check(self, data, kind='full'):
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / 'artifact.lean'
            p.write_bytes(data)
            return subprocess.run([sys.executable, str(ROOT / 'independent_bank/mixed_artifact.py'), kind, str(p)], capture_output=True)

    def test_full_artifact_exact_bytes_and_mutations(self):
        self.assertEqual(self.run_check(self.full).returncode, 0)
        for old, new in [(b'import MixedCaseTrimCandidate', b'import Evil\nimport MixedCaseTrimCandidate'),
                         (b'(checked : prefixTarget)', b'(checked : False)'),
                         (b'namespace MixedPrefixGenerated', b'namespace Evil'),
                         (b'\n', b'\r\n')]:
            self.assertIn(old, self.full)
            with self.subTest(new=new):
                self.assertNotEqual(self.run_check(self.full.replace(old, new, 1)).returncode, 0)

    def test_first_shard_bytes_and_mutation(self):
        data = first_shard.generate().encode('utf-8')
        self.assertEqual(self.run_check(data, 'shard').returncode, 0)
        self.assertNotEqual(self.run_check(b'import Evil\n' + data, 'shard').returncode, 0)

    def test_tampered_archive_rejected_for_both_kinds(self):
        with tempfile.TemporaryDirectory() as d:
            source = Path(d) / 'bank.json.xz'
            source.write_bytes(b'not the authenticated archive')
            with patch.object(archive_prefix, 'SOURCE', source):
                for kind in ('full', 'shard'):
                    with self.subTest(kind=kind), self.assertRaisesRegex(ValueError, 'SHA-256 mismatch'):
                        mixed_artifact.expected_bytes(kind)

    def test_first_shard_workflow_runs_artifact_checks(self):
        workflow = (ROOT / '.github/workflows/first-real-shard.yml').read_text()
        self.assertIn('independent_bank/test_mixed_artifact.py', workflow)
        self.assertIn('independent_bank/mixed_artifact.py shard audit/shard-aggregation/FirstRealData.lean', workflow)
        self.assertIn('independent_bank/mixed_artifact.py full ', workflow)

if __name__ == '__main__':
    unittest.main()
