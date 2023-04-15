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
  default     = "k8s-agents-pool-001"
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

variable "keda_install" {
  type        = bool
  description = "Install KEDA as part of the module"
  default     = true
}

variable "keda_namespace" {
  type        = string
  description = "Kubernetes namespace name for KEDA install"
  default     = "keda"

  validation {
    condition     = can(regex("^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*$", var.keda_namespace))
    error_message = "keda_namespace must be a valid Kubernetes namespace name."
  }
}

variable "keda_version" {
  type        = string
  description = "KEDA version to install using Helm"
  default     = "latest"

  validation {
    condition     = var.keda_version == "latest" || can(regex("^\\d+\\.\\d+\\.\\d+$", var.keda_version))
    error_message = "keda_version must be 'latest' or a valid semantic version."
  }
}
