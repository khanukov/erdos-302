import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]


class PilotResources(unittest.TestCase):
    def test_lake_worker_pool_is_explicitly_bounded_for_all_steps(self):
        workflow = (REPO / '.github/workflows/archive-ledger-pilot.yml').read_text()
        self.assertIn('    env:\n      LEAN_NUM_THREADS: "1"', workflow)
        self.assertIn('timeout 5m lake build LedgerTests', workflow)
        self.assertIn('timeout 15m lake build ArchiveLedger', workflow)

    def test_resource_scope_is_documented(self):
        readme = (REPO / 'audit/ledger-candidate/README.md').read_text()
        self.assertIn('per-process virtual address space', readme)
        self.assertIn('not an aggregate job memory limit', readme)
        self.assertIn('full_candidate=true', readme)


if __name__ == '__main__':
    unittest.main()
