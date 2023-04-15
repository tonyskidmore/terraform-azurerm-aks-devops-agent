variable "ado_ext_pat" {
  type        = string
  description = "Azure DevOps Personal Access Token"
  sensitive   = true
}

variable "ado_org" {
  type        = string
  description = "Azure DevOps organization"
}

variable "keda_namespace" {
  type        = string
  description = "Kubernetes namespace name for KEDA install"
  default     = "keda"
}

variable "keda_version" {
  type        = string
  description = "KEDA version to install"
}

variable "keda_install" {
  type        = bool
  description = "Install KEDA as part of the module"
}
