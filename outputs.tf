output "admin_client_certificate" {
  value = module.aks[0].admin_client_certificate
}

output "admin_client_key" {
  value = module.aks[0].admin_client_key
}

output "client_certificate" {
  value     = module.aks[0].client_certificate
  sensitive = true
}

output "client_key" {
  value     = module.aks[0].client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = module.aks[0].cluster_ca_certificate
  sensitive = true
}

output "cluster_password" {
  value     = module.aks[0].password
  sensitive = true
}

output "cluster_username" {
  value     = module.aks[0].username
  sensitive = true
}

output "host" {
  value     = module.aks[0].host
  sensitive = true
}

output "kube_config" {
  value     = module.aks[0].kube_config_raw
  sensitive = true
}

# output "keda_namesapce" {
#   value = kubernetes_namespace.keda
# }
