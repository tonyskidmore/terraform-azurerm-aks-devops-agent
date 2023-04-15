resource "azuredevops_agent_pool" "k8s" {
  name           = var.ado_agent_pool_name
  auto_provision = var.ado_agent_pool_auto_provision
  auto_update    = var.ado_agent_pool_auto_update
}
