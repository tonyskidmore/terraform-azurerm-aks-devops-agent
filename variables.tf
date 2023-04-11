variable "ado_ext_pat" {
  type        = string
  description = "Azure DevOps Personal Access Token"
  sensitive   = true
}

variable "ado_org" {
  type        = string
  description = "Azure DevOps organization"
}

variable "ado_agent_pool_name" {
  type        = string
  description = "Azure DevOps Agent Pool Name"
  default     = "aks-agents-pool-001"
}

variable "ado_agent_pool_auto_provision" {
  type        = bool
  description = "Azure DevOps Agent Pool Autoprovision"
  default     = true
}

variable "ado_agent_pool_auto_update" {
  type        = bool
  description = "Azure DevOps Agent Pool Autoprovision"
  default     = true
}

variable "k8s_ado_agents_namespace" {
  type        = string
  description = "Kubernetes Azure DevOps Agent namespace"
  default     = "ado-agents"
}

variable "k8s_ado_agent_image" {
  type        = string
  description = "Azure DevOps Agent conatiner image"
  default     = "ghcr.io/tonyskidmore/ado-pipelines-agent:latest"
}
