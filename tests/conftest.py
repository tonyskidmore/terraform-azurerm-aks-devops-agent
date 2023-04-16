""" Define fixtures for pytest """
import os
from pathlib import Path
import pytest


@pytest.fixture(scope='session')
def fixtures_dir():
    """ examples fixtures path """
    return os.path.join(Path(os.path.dirname(os.path.abspath(
      __file__))).parent, 'examples')


# @pytest.fixture
# def ado_url():
#     """ Get the Azure DevOps URL from the environment """
#     return os.environ.get('AZDO_ORG_SERVICE_URL')


# @pytest.fixture
# def ado_pat():
#     """ Get the Azure DevOps PAT from the environment """
#     return os.environ.get('AZDO_PERSONAL_ACCESS_TOKEN')

def pytest_generate_tests(metafunc):
    os.environ['AZDO_PERSONAL_ACCESS_TOKEN'] = os.environ.get('AZDO_PERSONAL_ACCESS_TOKEN')