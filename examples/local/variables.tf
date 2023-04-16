variable "ado_ext_pat" {
  type        = string
  description = "Azure DevOps Personal Access Token"
  sensitive   = true
}

variable "ado_org" {
  type        = string
  description = "Azure DevOps organization"
}

variable "k8s_ado_agents_namespace_annotations" {
  type        = map(string)
  description = "Kubernetes Azure DevOps Agent namespace annotations"
  default     = {}
}

variable "k8s_ado_agents_namespace_labels" {
  type        = map(string)
  description = "Kubernetes Azure DevOps Agent namespace annotations"
  default     = {}
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
