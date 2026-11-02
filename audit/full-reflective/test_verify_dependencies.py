import json
from pathlib import Path
import subprocess
import tempfile
import unittest

SCRIPT = Path(__file__).with_name('verify_dependencies.py')


class DependencyTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.pkg = self.root / '.lake/packages/example'
        self.pkg.mkdir(parents=True)
        subprocess.run(['git', 'init', '-q', str(self.pkg)], check=True)
        subprocess.run(['git', '-C', str(self.pkg), '-c', 'user.name=T', '-c', 'user.email=t@t', 'commit', '--allow-empty', '-qm', 'initial'], check=True)
        self.rev = subprocess.check_output(['git', '-C', str(self.pkg), 'rev-parse', 'HEAD'], text=True).strip()
        self.manifest = {'packagesDir': '.lake/packages', 'packages': [{'name': 'example', 'type': 'git', 'rev': self.rev}]}
        self.save()

    def save(self):
        (self.root / 'lake-manifest.json').write_text(json.dumps(self.manifest))

    def verify(self):
        return subprocess.run(['python3', str(SCRIPT), str(self.root)], capture_output=True, text=True)

    def test_correct_revision(self):
        self.assertEqual(self.verify().returncode, 0)

    def test_wrong_revision(self):
        self.manifest['packages'][0]['rev'] = '0' * 40
        self.save()
        self.assertNotEqual(self.verify().returncode, 0)

    def test_missing_package(self):
        self.manifest['packages'][0]['name'] = 'missing'
        self.save()
        self.assertNotEqual(self.verify().returncode, 0)

    def test_duplicate_name(self):
        self.manifest['packages'].append(dict(self.manifest['packages'][0]))
        self.save()
        self.assertNotEqual(self.verify().returncode, 0)

    def test_modified_tracked_source(self):
        tracked = self.pkg / 'Source.lean'
        tracked.write_text('-- original\n')
        subprocess.run(['git', '-C', str(self.pkg), 'add', 'Source.lean'], check=True)
        subprocess.run(['git', '-C', str(self.pkg), '-c', 'user.name=T', '-c', 'user.email=t@t', 'commit', '-qm', 'source'], check=True)
        self.manifest['packages'][0]['rev'] = subprocess.check_output(['git', '-C', str(self.pkg), 'rev-parse', 'HEAD'], text=True).strip()
        self.save()
        tracked.write_text('-- changed\n')
        self.assertNotEqual(self.verify().returncode, 0)

    def test_not_a_package_git_repo(self):
        subprocess.run(['git', 'init', '-q', str(self.root)], check=True)
        import shutil
        shutil.rmtree(self.pkg / '.git')
        self.assertNotEqual(self.verify().returncode, 0)

if __name__ == '__main__':
    unittest.main()
