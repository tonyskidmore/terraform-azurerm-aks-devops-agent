resource "kubernetes_namespace" "keda" {
  count = var.keda_install ? 1 : 0
  metadata {
    name = var.keda_namespace
  }
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
  count     = var.k8s_ado_agent_type == "job" ? 1 : 0
  name      = "job"
  chart     = "${path.module}/helm/charts/job"
  namespace = try(kubernetes_namespace.ado-agents[0].metadata[0].name, null)

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

  set {
    name  = "resources.limits.cpu"
    value = var.k8s_resources_limits_cpu
  }

  set {
    name  = "resources.limits.memory"
    value = var.k8s_resources_limits_memory
  }

  set {
    name  = "resources.requests.cpu"
    value = var.k8s_resources_requests_cpu
  }

  set {
    name  = "resources.requests.memory"
    value = var.k8s_resources_requests_memory
  }

  depends_on = [
    helm_release.keda
  ]

}

resource "helm_release" "deployment" {
  count     = var.k8s_ado_agent_type == "deployment" ? 1 : 0
  name      = "deployment"
  chart     = "${path.module}/helm/charts/deployment"
  namespace = try(kubernetes_namespace.ado-agents[0].metadata[0].name, null)

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

  set {
    name  = "resources.limits.cpu"
    value = var.k8s_resources_limits_cpu
  }

  set {
    name  = "resources.limits.memory"
    value = var.k8s_resources_limits_memory
  }

  set {
    name  = "resources.requests.cpu"
    value = var.k8s_resources_requests_cpu
  }

  set {
    name  = "resources.requests.memory"
    value = var.k8s_resources_requests_memory
  }

  depends_on = [
    helm_release.keda
  ]

}
