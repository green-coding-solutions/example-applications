import os
import sys
import pytest

current_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(f"{current_dir}/../../green-metrics-tool/lib")

## VERY IMPORTANT to override the config file here
## otherwise it will automatically connect to non-test DB and delete all your real data
from global_config import GlobalConfig
from db import DB
GlobalConfig().override_config(config_name='test-config.yml')

def pytest_addoption(parser):
    parser.addoption("--name", action="store", default="stress")

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
    tables = DB().fetch_all("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'")
    for table in tables:
        table_name = table[0]
        DB().query(f'TRUNCATE TABLE "{table_name}" RESTART IDENTITY CASCADE')

### If you wish to turn off the above auto-cleanup per test, include the following in your
### test module:
# from conftest import cleanup_after_test
# @pytest.fixture(autouse=False)  # Set autouse to False to override the fixture
# def cleanup_after_test():
#     pass