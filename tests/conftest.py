""" Define fixtures for pytest """
import os
from pathlib import Path

import pytest


@pytest.fixture(scope="session")
def fixtures_dir():
    """examples fixtures path"""
    return os.path.join(
        Path(os.path.dirname(os.path.abspath(__file__))).parent, "examples"
    )
