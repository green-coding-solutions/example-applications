import os, sys
import subprocess, re
import pytest

# These tests assumes the green-metrics-tool directory lives side by side with the examples-repository
current_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(f"{current_dir}/../../green-metrics-tool")
sys.path.append(f"{current_dir}/../../green-metrics-tool/tools")
sys.path.append(f"{current_dir}/../../green-metrics-tool/lib")

from runner import Runner
from global_config import GlobalConfig

import utils
from db import DB


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
        example_dirs.append(dirname)
        directories.clear()

    return example_dirs


@pytest.mark.parametrize("example_directory", example_directories())
def test_all_directories(example_directory, capsys):
    project_name = "test_" + utils.randomword(12)
    config = GlobalConfig(config_name="test-config.yml").config
    uri = os.path.abspath(os.path.join(current_dir, '..', example_directory + '/'))

    # Docker compose build example application
    subprocess.run(["docker", "compose",   "-f", uri+"/compose.yml", "build"])
    
    # Insert Project into testing DB
    project_id = DB().fetch_one('INSERT INTO "projects" ("name","uri","email","last_run","created_at") \
                VALUES \
                (%s,%s,\'manual\',NULL,NOW()) RETURNING id;', params=(project_name, uri))[0]

    # Run the application
    runner = Runner(allow_unsafe=True)
    runner.run(uri=uri, uri_type="folder", project_id=project_id)

    ## Capture Std.Out and Std.Err and make Assertions
    captured = capsys.readouterr()
    
    ## Assert that Cleanup has run
    assert re.search("Cleanup gracefully completed", captured.out)

    ## Assert that there is no std.err output
    assert captured.err == ''