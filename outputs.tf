output "admin_client_certificate" {
  value = module.aks[0].admin_client_certificate
}

output "admin_client_key" {
  value = module.aks[0].admin_client_key
}
