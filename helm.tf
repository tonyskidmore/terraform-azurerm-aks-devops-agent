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

  # set {
  #   name  = "podIdentity.activeDirectory.identity"
  #   value = "${var.aad_pod_identity_name}-binding"
  # }

  # set {
  #   name  = "http.timeout"
  #   value = "90000"
  # }

}
