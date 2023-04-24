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
    "ado_ext_pat": os.environ["AZDO_PERSONAL_ACCESS_TOKEN"],
    "ado_org": os.environ["AZDO_ORG_SERVICE_URL"],
}


@pytest.fixture(params=[required_vars], name="tf_def")
def default_plan(request, fixtures_dir):
    """default setup test"""
    tf_vars = request.param
    tf_test = tftest.TerraformTest("local", fixtures_dir)
    tf_test.setup()
    return tf_test.plan(output=True, tf_vars=tf_vars)


def test_variables(tf_def):
    """default variables test"""
    assert "ado_ext_pat" in tf_def.variables
    assert "ado_org" in tf_def.variables
    assert "ado_create_agent_pool" in tf_def.variables
    assert "ado_agent_pool_name" in tf_def.variables
    assert "ado_agent_pool_auto_provision" in tf_def.variables
    assert "ado_agent_pool_auto_update" in tf_def.variables
    assert "k8s_ado_agents_create_namespace" in tf_def.variables
    assert "k8s_ado_agents_create_secret" in tf_def.variables
    assert "k8s_ado_agents_namespace" in tf_def.variables
    assert "k8s_ado_agents_namespace_annotations" in tf_def.variables
    assert "k8s_ado_agents_create_secret" in tf_def.variables
    assert "k8s_ado_agent_image" in tf_def.variables
    assert "k8s_ado_agent_type" in tf_def.variables
    assert "keda_install" in tf_def.variables
    assert "keda_namespace" in tf_def.variables
    assert "keda_version" in tf_def.variables
    assert tf_def.variables["ado_create_agent_pool"] is True
    assert tf_def.variables["ado_agent_pool_name"] == ("k8s-agents-pool-001")
    assert tf_def.variables["ado_agent_pool_auto_provision"] is True
    assert tf_def.variables["ado_agent_pool_auto_update"] is True
    assert tf_def.variables["k8s_ado_agents_create_namespace"] is True
    assert tf_def.variables["k8s_ado_agents_create_secret"] is True
    assert tf_def.variables["k8s_ado_agents_namespace"] == "ado-agents"
    assert tf_def.variables["k8s_ado_agents_namespace_annotations"] == {}
    assert tf_def.variables["k8s_ado_agents_namespace_labels"] == {}
    assert tf_def.variables["k8s_ado_agent_image"] == (
        "ghcr.io/tonyskidmore/"
        "terraform-kubernetes-azure-devops-agent-base-image:stable"
    )
    assert tf_def.variables["k8s_ado_agent_type"] == "job"
    assert tf_def.variables["keda_install"] is True
    assert tf_def.variables["keda_namespace"] == "keda"
    assert tf_def.variables["keda_version"] == "latest"


agent_pool_vars = {
    **required_vars,
    "ado_agent_pool_name": "Default",
    "ado_create_agent_pool": "false",
}


@pytest.fixture(params=[agent_pool_vars], name="tf_pool_plan")
def pool_plan(request, fixtures_dir):
    """setup tftest"""
    tf_vars = request.param
    tf_test = tftest.TerraformTest("local", fixtures_dir)
    tf_test.setup()
    return tf_test.plan(output=True, tf_vars=tf_vars)


def test_agent_pool_variables(tf_pool_plan):
    """not creating ADO pool test"""
    assert tf_pool_plan.variables["ado_create_agent_pool"] == "false"
    assert tf_pool_plan.variables["ado_agent_pool_name"] == "Default"
