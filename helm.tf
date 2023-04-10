# helm repo add kedacore https://kedacore.github.io/charts
# helm repo update
# helm install keda kedacore/keda --namespace keda --create-namespace

# https://github.com/matt-FFFFFF/framework/blob/master/modules/aks/main.tf

resource "kubernetes_namespace" "keda" {
  metadata {
    name = "keda"
  }
}

# data "helm_repository" "kedacore" {
#   name = "kedacore"
#   url  = "https://kedacore.github.io/charts"
# }

resource "helm_release" "keda" {

  name       = "keda"
  repository = "https://kedacore.github.io/charts"
  chart      = "kedacore/keda"
  version    = "2.10.1"

  namespace  = "keda"
  depends_on = [kubernetes_namespace.keda]
}
