import os
import sys
import pytest

# These tests assumes the green-metrics-tool directory lives side by side with the examples-repository
CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT_DIR = os.path.abspath(f"{CURRENT_DIR}/../")
GMT_TEST_DIR = os.path.abspath(f"{CURRENT_DIR}/../../green-metrics-tool/tests")

## VERY IMPORTANT to override the config file here
## otherwise it will automatically connect to non-test DB and delete all your real data
from lib.global_config import GlobalConfig
from lib.db import DB
GlobalConfig().override_config(config_location=f"{GMT_TEST_DIR}/test-config.yml")

def pytest_addoption(parser):
    parser.addoption("--name", action="store")

def pytest_generate_tests(metafunc):
    # This is called for every test. Only get/set command line arguments
    # if the argument is specified in the list of test "fixturenames".
    option_value = metafunc.config.option.name
    if 'name' in metafunc.fixturenames and option_value is not None:
        metafunc.parametrize("name", [option_value])

# should we hardcode test-db here?
@pytest.fixture(autouse=True)
def cleanup_after_test():
    yield
    tables = DB().fetch_all("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_type != 'VIEW'")
    for table in tables:
        table_name = table[0]
        DB().query(f'TRUNCATE TABLE "{table_name}" RESTART IDENTITY CASCADE')

### If you wish to turn off the above auto-cleanup per test, include the following in your
### test module:
# from conftest import cleanup_after_test
# @pytest.fixture(autouse=False)  # Set autouse to False to override the fixture
# def cleanup_after_test():
#     pass
