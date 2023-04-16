locals {
  keda_version = var.keda_version == "latest" ? data.github_release.keda[0].release_tag : var.keda_version
  pool_id      = var.ado_create_agent_pool ? azuredevops_agent_pool.k8s[0].id : data.azuredevops_agent_pool.k8s[0].id
}
