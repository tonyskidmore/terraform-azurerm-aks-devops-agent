import os
import pytest
from pathlib import Path

@pytest.fixture(scope='session')
def fixtures_dir():
  return os.path.join(Path(os.path.dirname(os.path.abspath(__file__))).parent, 'examples')
