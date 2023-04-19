locals {
  keda_version = try(var.keda_version == "latest" ? data.github_release.keda[0].release_tag : var.keda_version, null)
  pool_id      = try(var.ado_create_agent_pool ? azuredevops_agent_pool.k8s[0].id : data.azuredevops_agent_pool.k8s[0].id, null)
}
