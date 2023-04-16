""" tftest plan test """

import pytest
import tftest


@pytest.fixture(scope="module")
def plan(fixtures_dir):
    """ setup tftest """
    tf_test = tftest.TerraformTest('local', fixtures_dir)
    tf_test.setup(extra_files=['namespace.auto.tfvars'])
    return tf_test.plan(output=True)


def test_variables(plan):
    """ describe test """
    assert 'keda_namespace' in plan.variables
    assert plan.variables['keda_namespace'] == 'keda-namespace'
