# output "admin_client_certificate" {
#   value = try(module.aks[0].admin_client_certificate, mull)
# }

# output "admin_client_key" {
#   value = try(module.aks[0].admin_client_key, mull)
# }

# output "client_certificate" {
#   value     = try(module.aks[0].client_certificate, mull)
#   sensitive = true
# }

# output "client_key" {
#   value     = try(module.aks[0].client_key, mull)
#   sensitive = true
# }

# output "cluster_ca_certificate" {
#   value     = try(module.aks[0].cluster_ca_certificate, mull)
#   sensitive = true
# }

# output "cluster_password" {
#   value     = try(module.aks[0].password, mull)
#   sensitive = true
# }

# output "cluster_username" {
#   value     = try(module.aks[0].username, mull)
#   sensitive = true
# }

# output "host" {
#   value     = try(module.aks[0].host, mull)
#   sensitive = true
# }

# output "kube_config" {
#   value     = try(module.aks[0].kube_config_raw, mull)
#   sensitive = true
# }

# output "aks_versions" {
#   value = try(data.azurerm_kubernetes_service_versions.aks_version[0].versions, null)
# }

# output "keda_namesapce" {
#   value = kubernetes_namespace.keda
# }
