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
from tests import test_functions as Tests

GlobalConfig().override_config(config_location=f"{GMT_TEST_DIR}/test-config.yml")

def pytest_addoption(parser):
    parser.addoption("--name", action="store")

def pytest_generate_tests(metafunc):
    # This is called for every test. Only get/set command line arguments
    # if the argument is specified in the list of test "fixturenames".
    option_value = metafunc.config.option.name
    if 'name' in metafunc.fixturenames and option_value is not None:
        metafunc.parametrize("name", [option_value])

# Note: This fixture runs always
# Pytest collects all fixtures before running any tests
# no matter which order they are loaded in
@pytest.fixture(autouse=True)
def setup_and_cleanup_test():
    GlobalConfig().override_config(config_location=f"{GMT_TEST_DIR}/test-config.yml")
    yield
    Tests.reset_db()


### If you wish to turn off the above auto-cleanup per test, include the following in your
### test module:
# from conftest import setup_and_cleanup_test
# @pytest.fixture(autouse=False)  # Set autouse to False to override the fixture
# def setup_and_cleanup_test():
#     pass
