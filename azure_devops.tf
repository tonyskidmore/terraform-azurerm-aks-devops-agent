resource "azuredevops_agent_pool" "example" {
  name           = "aks-agent-pool-001"
  auto_provision = true
  auto_update    = true
}
