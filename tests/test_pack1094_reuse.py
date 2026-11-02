import unittest
from scripts.verify_pack1094_reuse import validate_run

class RunAdmissionTest(unittest.TestCase):
    def setUp(self):
        self.run_data = dict(id=41347502663, head_sha='5201645d256bdbecb248833993ee475dee11c069', run_attempt=1, event='workflow_dispatch', path='.github/workflows/pack-node1094-scale.yml', status='in_progress')
        self.jobs = [dict(name='upstream', status='completed', conclusion='success')] + [dict(name=f'shard ({i})', status='completed', conclusion='success') for i in range(88)] + [dict(name='assembly', status='in_progress', conclusion=None)]

    def test_accept_running_assembly(self):
        validate_run(self.run_data, self.jobs)

    def test_reject_changed_sha_or_attempt(self):
        for key, value in [('head_sha', 'bad'), ('run_attempt', 2)]:
            run = dict(self.run_data, **{key: value})
            with self.assertRaises(ValueError): validate_run(run, self.jobs)

    def test_reject_missing_duplicate_or_failed_shard(self):
        for jobs in (self.jobs[:-2] + self.jobs[-1:], self.jobs + [self.jobs[1]], [dict(j, conclusion='failure') if j['name'] == 'shard (7)' else j for j in self.jobs]):
            with self.assertRaises(ValueError): validate_run(self.run_data, jobs)
