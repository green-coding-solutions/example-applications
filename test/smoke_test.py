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
        example_dirs.append(os.path.abspath(path))
        directories.clear()

    return example_dirs


@pytest.mark.parametrize("example_directory", example_directories())
def test_all_directories(example_directory, capsys):
    project_name = f"test_{utils.randomword(12)}"

        # This is needed so that examples whose compose's are lesewhere (such as the shared
        # directory for the stress tests, still get built
    if os.path.exists(f"{example_directory}/build.sh"):
        subprocess.run(["bash", f"{example_directory}/build.sh"])
    else:
        subprocess.run(["docker", "compose", "-f", f"{example_directory}/compose.yml", "build"])

    # Insert Project into testing DB
    project_id = DB().fetch_one('INSERT INTO "projects" ("name","uri","email","last_run","created_at") \
                VALUES \
                (%s,%s,\'manual\',NULL,NOW()) RETURNING id;', params=(project_name, example_directory))[0]

    # Run the application
    runner = Runner(allow_unsafe=True)
    runner.run(uri=example_directory, uri_type="folder", project_id=project_id)

    # Capture Std.Out and Std.Err and make Assertions
    captured = capsys.readouterr()

    # Assert that Cleanup has run
    assert re.search(">>>> MEASUREMENT SUCCESSFULLY COMPLETED <<<<", captured.out)

    # Assert that there is no std.err output
    assert captured.err == ''
