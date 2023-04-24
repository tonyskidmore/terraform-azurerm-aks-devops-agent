output "keda_latest_version" {
  value       = local.keda_version
  description = "KEDA version installed"
}

output "ado_pool_id" {
  value       = local.pool_id
  description = "Azure DevOps Agent Pool ID"
}
