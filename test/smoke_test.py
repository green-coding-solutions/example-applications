import os, sys
import subprocess, re
import pytest
import yaml

# These tests assumes the green-metrics-tool directory lives side by side with the examples-repository
current_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(f"{current_dir}/../../green-metrics-tool")
sys.path.append(f"{current_dir}/../../green-metrics-tool/tools")
sys.path.append(f"{current_dir}/../../green-metrics-tool/lib")

from runner import Runner
from global_config import GlobalConfig

import utils
from db import DB

#pylint: disable=expression-not-assigned
GlobalConfig(config_name='test-config.yml').config

def example_directories():
    example_dirs = []
    root = f"{current_dir}/../"

    for path, directories, files in os.walk(root):
        dirname = path.split(os.path.sep)[-1]
        if path == root or '.scantest' in files:
            continue
        if '.skiptest' in files or dirname.startswith("."):
            directories.clear()
            continue
        example_dirs.append(os.path.abspath(path))
        directories.clear()

    return example_dirs

def run_test_on_directory(directory, capsys, skip_unsafe=False):
    project_name = f"test_{utils.randomword(12)}"

    # Insert Project into testing DB
    project_id = DB().fetch_one('INSERT INTO "projects" ("name","uri","email","last_run","created_at") \
                VALUES \
                (%s,%s,\'manual\',NULL,NOW()) RETURNING id;', params=(project_name, directory))[0]

    # Run the application
    runner = Runner(uri=directory, uri_type="folder", pid=project_id, skip_unsafe=skip_unsafe, skip_config_check=True)
    runner.run()

    # Capture Std.Out and Std.Err and make Assertions
    captured = capsys.readouterr()

    # Assert that Cleanup has run
    assert re.search("MEASUREMENT SUCCESSFULLY COMPLETED", captured.out)

    # Assert that there is no std.err output
    assert captured.err == ''

# thanks Didi!
class Loader(yaml.SafeLoader):
    def __init__(self, stream):
        # We need to find our own root as the Loader is instantiated in PyYaml
        self._root = os.path.split(stream.name)[0]
        super().__init__(stream)

    def include(self, node):
        # We allow two types of includes
        # !include <filename> => ScalarNode
        # and
        # !include <filename> <selector> => SequenceNode
        if isinstance(node, yaml.nodes.ScalarNode):
            nodes = [self.construct_scalar(node)]
        elif isinstance(node, yaml.nodes.SequenceNode):
            nodes = self.construct_sequence(node)
        else:
            raise ValueError("We don't support Mapping Nodes to date")

        filename = os.path.realpath(os.path.join(self._root, nodes[0]))

        if not filename.startswith(self._root):
            raise ImportError(f"Import tries to escape root! ({filename})")

        # To double check we also check if it is in the files allow list
        if filename not in [os.path.join(self._root, item) for item in os.listdir(self._root)]:
            print(os.listdir(self._root))
            raise RuntimeError(f"{filename} not in allowed file list")


        with open(filename, 'r', encoding='utf-8') as f:
            # We want to enable a deep search for keys
            def recursive_lookup(k, d):
                if k in d:
                    return d[k]
                for v in d.values():
                    if isinstance(v, dict):
                        return recursive_lookup(k, v)
                return None

            # We can use load here as the Loader extends SafeLoader
            if len(nodes) == 1:
                # There is no selector specified
                return yaml.load(f, Loader)

            return recursive_lookup(nodes[1], yaml.load(f, Loader))

Loader.add_constructor('!include', Loader.include)

def check_for_ports(directory):
    if os.path.exists(f"{directory}/usage_scenario.yml"):
        with open(f"{directory}/usage_scenario.yml", encoding='utf8') as f:
            usage_scenario = yaml.load(f, Loader=Loader)
            if 'services' in usage_scenario:
                for service in usage_scenario['services']:
                    if 'ports' in usage_scenario['services'][service]:
                        return True
                        
    if os.path.exists(f"{directory}/compose.yml"):
        with open(f"{directory}/compose.yml", encoding='utf8') as f:
            compose_yml = yaml.load(f, Loader=Loader)
            if 'services' in compose_yml:
                for service in compose_yml['services']:
                    if 'ports' in compose_yml['services'][service]:
                        return True
    return False

@pytest.mark.parametrize("example_directory", example_directories())
def test_all_directories(example_directory, capsys):
    skip_unsafe = check_for_ports(example_directory)
    run_test_on_directory(example_directory, capsys, skip_unsafe=skip_unsafe)

def test_a_directory(name, capsys):
    uri = os.path.abspath(f"{current_dir}/../{name}")
    skip_unsafe = check_for_ports(uri)
    run_test_on_directory(uri, capsys, skip_unsafe=skip_unsafe)

