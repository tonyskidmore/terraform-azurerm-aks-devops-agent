resource "kubernetes_namespace" "keda" {
  metadata {
    name = "keda"
  }
}

# https://github.com/hashicorp/terraform-provider-helm/issues/939


resource "helm_release" "keda" {

  name       = "keda"
  repository = "https://kedacore.github.io/charts"
  chart      = "keda"
  version    = "2.10.0"
  namespace = kubernetes_namespace.keda.metadata[0].name

  # set {
  #   name  = "podIdentity.activeDirectory.identity"
  #   value = "${var.aad_pod_identity_name}-binding"
  # }

  # set {
  #   name  = "http.timeout"
  #   value = "90000"
  # }

}
