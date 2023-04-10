# helm repo add kedacore https://kedacore.github.io/charts
# helm repo update
# helm install keda kedacore/keda --namespace keda --create-namespace

# resource "kubernetes_namespace" "keda" {
#   metadata {
#     name = "keda"
#   }
# }

# ╷
# │ Error: could not download chart: chart "kedacore/keda" version "2.10.0" not found in https://kedacore.github.io/charts repository
# │
# │   with module.terraform-azurerm-aks-devops-agent.helm_release.keda,
# │   on .terraform/modules/terraform-azurerm-aks-devops-agent/helm.tf line 18, in resource "helm_release" "keda":
# │   18: resource "helm_release" "keda" {
# │
# ╵
# ╷
# │ Error: could not download chart: chart "kedacore/keda" not found in https://kedacore.github.io/charts repository
# │
# │   with module.terraform-azurerm-aks-devops-agent.helm_release.keda,
# │   on .terraform/modules/terraform-azurerm-aks-devops-agent/helm.tf line 20, in resource "helm_release" "keda":
# │   20: resource "helm_release" "keda" {
# │

# resource "helm_release" "keda" {

#   name       = "kedacore"
#   repository = "https://kedacore.github.io/charts"
#   chart      = "kedacore/keda"
#   # version    = "2.10.0"

#   namespace = "keda"
#   depends_on = [
#     kubernetes_namespace.keda
#   ]
# }
