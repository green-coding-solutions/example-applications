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

dirs_to_skip=['test', '.git', '.github']
project_name = "test_" + utils.randomword(12)

def example_directories():
    dirs = next(os.walk(f"{current_dir}/../"))[1]
    for d in dirs_to_skip:
        dirs.remove(d)
    return dirs

@pytest.mark.parametrize("example_directory", example_directories())
def test_all_directories(example_directory, capsys):
    config = GlobalConfig(config_name="test-config.yml").config

    uri = os.path.abspath(os.path.join(current_dir, '..', example_directory + '/'))

    subprocess.run(["docker", "compose",   "-f", uri+"/compose.yml", "build"])
    
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