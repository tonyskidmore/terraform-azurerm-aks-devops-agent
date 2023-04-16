resource "azuredevops_agent_pool" "k8s" {
  count          = var.ado_create_agent_pool ? 1 : 0
  name           = var.ado_agent_pool_name
  auto_provision = var.ado_agent_pool_auto_provision
  auto_update    = var.ado_agent_pool_auto_update
}

data "azuredevops_agent_pool" "k8s" {
  count = var.ado_create_agent_pool ? 0 : 1
  name  = var.ado_agent_pool_name
}
