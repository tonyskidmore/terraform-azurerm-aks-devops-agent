resource "kubernetes_namespace" "keda" {
  count = var.keda_install ? 1 : 0
  metadata {
    name = var.keda_namespace
  }
}

data "github_release" "keda" {
  count       = var.keda_version == "latest" ? 1 : 0 && var.keda_install ? 1 : 0
  repository  = "keda"
  owner       = "kedacore"
  retrieve_by = "latest"
}

resource "helm_release" "keda" {
  count      = var.keda_install ? 1 : 0
  name       = "keda"
  repository = "https://kedacore.github.io/charts"
  chart      = "keda"
  version    = local.keda_version
  namespace  = try(kubernetes_namespace.keda[0].metadata[0].name, null)
}

resource "helm_release" "job" {
  count      = var.k8s_ado_agent_type == "job" ? 1 : 0
  name       = "job"
  chart      = "${path.module}/helm/charts/job"
  namespace  = try(kubernetes_namespace.ado-agents.metadata[0].name, null)

  set {
    name  = "container.image"
    value = var.k8s_ado_agent_image
  }

  set {
    name  = "pool.name"
    value = var.ado_agent_pool_name
  }

  set {
    name  = "pool.id"
    value = local.pool_id
  }

  set {
    name  = "namespace"
    value = var.k8s_ado_agents_namespace
  }

  depends_on = [
    helm_release.keda
  ]

}
