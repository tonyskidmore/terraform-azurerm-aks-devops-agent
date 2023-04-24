locals {
  keda_version  = try(var.keda_version == "latest" ? data.github_release.keda[0].release_tag : var.keda_version, null)
  pool_id       = try(var.ado_create_agent_pool ? azuredevops_agent_pool.k8s[0].id : data.azuredevops_agent_pool.k8s[0].id, null)
  ado_namespace = try(var.ado_agent_pool_auto_provision ? kubernetes_namespace.ado-agents[0].metadata[0].name : data.kubernetes_namespace.ado-agents[0].metadata[0].name, null)
}
