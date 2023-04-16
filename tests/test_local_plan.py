""" tftest plan test """

import os
import pytest
import tftest


# @pytest.fixture(scope="module")
# def default_plan(fixtures_dir):
#     """ default setup test """
#     tf_test = tftest.TerraformTest('local', fixtures_dir)
#     tf_test.setup(extra_files=['namespace.tfvars'])
#     return tf_test.plan(output=True)

required_vars = {
    "ado_ext_pat": os.environ['AZDO_PERSONAL_ACCESS_TOKEN'],
    "ado_org": os.environ['AZDO_ORG_SERVICE_URL']
}


@pytest.fixture(params=[required_vars])
def default_plan(request, fixtures_dir):
    """ default setup test """
    tf_vars = request.param
    tf_test = tftest.TerraformTest('local', fixtures_dir)
    tf_test.setup()
    default_plan = tf_test.plan(output=True, tf_vars=tf_vars)
    return default_plan


def test_variables(default_plan):
    """ describe test """
    assert 'ado_ext_pat' in default_plan.variables
    assert 'ado_org' in default_plan.variables
    assert 'ado_create_agent_pool' in default_plan.variables
    assert 'ado_agent_pool_name' in default_plan.variables
    assert 'ado_agent_pool_auto_provision' in default_plan.variables
    assert 'ado_agent_pool_auto_update' in default_plan.variables
    assert 'k8s_ado_agents_namespace' in default_plan.variables
    assert 'k8s_ado_agents_namespace_annotations' in default_plan.variables
    assert 'k8s_ado_agents_namespace_labels' in default_plan.variables
    assert 'k8s_ado_agent_image' in default_plan.variables
    assert 'k8s_ado_agent_type' in default_plan.variables
    assert 'keda_install' in default_plan.variables
    assert 'keda_namespace' in default_plan.variables
    assert 'keda_version' in default_plan.variables
    assert default_plan.variables['ado_create_agent_pool'] is True
    assert default_plan.variables['ado_agent_pool_name'] == 'k8s-agents-pool-001'
    assert default_plan.variables['ado_agent_pool_auto_provision'] is True
    assert default_plan.variables['ado_agent_pool_auto_update'] is True
    assert default_plan.variables['k8s_ado_agents_namespace'] == 'ado-agents'
    assert default_plan.variables['k8s_ado_agents_namespace_annotations'] == {}
    assert default_plan.variables['k8s_ado_agents_namespace_labels'] == {}
    assert default_plan.variables['k8s_ado_agent_image'] == 'ghcr.io/tonyskidmore/terraform-kubernetes-azure-devops-agent-base-image:stable'
    assert default_plan.variables['k8s_ado_agent_type'] == 'job'
    assert default_plan.variables['keda_install'] is True
    assert default_plan.variables['keda_namespace'] == 'keda'
    assert default_plan.variables['keda_version'] == 'latest'


agent_pool_vars = {
    "ado_ext_pat": os.environ['AZDO_PERSONAL_ACCESS_TOKEN'],
    "ado_org": os.environ['AZDO_ORG_SERVICE_URL'],
    "ado_agent_pool_name": "Default",
    "ado_create_agent_pool": "false"
}


@pytest.fixture(params=[agent_pool_vars])
def pool_plan(request, fixtures_dir):
    """ setup tftest """
    tf_vars = request.param
    tf_test = tftest.TerraformTest('local', fixtures_dir)
    tf_test.setup()
    pool_plan = tf_test.plan(output=True, tf_vars=tf_vars)
    return pool_plan


def test_agent_pool_variables(pool_plan):
    """ describe test """
    assert pool_plan.variables['ado_create_agent_pool'] == "false"
    assert pool_plan.variables['ado_agent_pool_name'] == 'Default'
