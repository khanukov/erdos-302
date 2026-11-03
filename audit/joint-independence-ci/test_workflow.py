import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


class WorkflowContractTests(unittest.TestCase):
    def test_all_named_candidate_theorems_are_gated(self):
        source = (ROOT / 'lean/JointIndependenceCandidate.lean').read_text()
        workflow = (ROOT / '.github/workflows/joint-independence-candidate.yml').read_text()
        names = re.findall(r'^theorem\s+(\w+)', source, re.M)
        self.assertEqual(set(names), {'demand_of_independence', 'independence_of_demand',
                                     'literal_hcover_of_joint_independence'})
        gate = next(line for line in workflow.splitlines() if 'check_axioms.py"' in line)
        for name in names:
            self.assertIn('#print axioms ' + name, source)
            self.assertIn('JointIndependenceCandidate.' + name, gate.split())
        self.assertIn('lake env lean lean/JointIndependenceCandidateTests.lean', workflow)
        self.assertIn('audit/joint-independence-ci/check_inventory.py', workflow)
        self.assertIn('audit/joint-independence-ci/test_inventory.py', workflow)
        self.assertIn("for opt in '' '-O'", workflow)


if __name__ == '__main__':
    unittest.main()
