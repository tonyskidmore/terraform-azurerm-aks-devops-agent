module "k8s-azure-devops-agents" {
  source = "../../"

  ado_ext_pat                          = var.ado_ext_pat
  ado_org                              = var.ado_org
  ado_agent_pool_name                  = var.ado_agent_pool_name
  ado_create_agent_pool                = var.ado_create_agent_pool
  ado_agent_pool_auto_provision        = var.ado_agent_pool_auto_provision
  ado_agent_pool_auto_update           = var.ado_agent_pool_auto_update
  k8s_ado_agents_create_namespace      = var.k8s_ado_agents_create_namespace
  k8s_ado_agents_create_secret         = var.k8s_ado_agents_create_secret
  k8s_ado_agents_namespace             = var.k8s_ado_agents_namespace
  k8s_ado_agents_namespace_labels      = var.k8s_ado_agents_namespace_labels
  k8s_ado_agents_namespace_annotations = var.k8s_ado_agents_namespace_annotations
  k8s_ado_agent_image                  = var.k8s_ado_agent_image
  k8s_ado_agent_type                   = var.k8s_ado_agent_type
  k8s_resources_limits_cpu             = var.k8s_resources_limits_cpu
  k8s_resources_limits_memory          = var.k8s_resources_limits_memory
  k8s_resources_requests_cpu           = var.k8s_resources_requests_cpu
  k8s_resources_requests_memory        = var.k8s_resources_requests_memory
  keda_install                         = var.keda_install
  keda_namespace                       = var.keda_namespace
  keda_version                         = var.keda_version
}
