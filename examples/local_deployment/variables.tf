variable "ado_ext_pat" {
  type        = string
  description = "Azure DevOps Personal Access Token"
  sensitive   = true
}

variable "ado_org" {
  type        = string
  description = "Azure DevOps organization"
}

variable "ado_create_agent_pool" {
  type        = bool
  description = "Whether to create the agent pool as part of this module"
  default     = true
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

variable "k8s_ado_agents_create_namespace" {
  type        = bool
  description = "Create new Kubernetes Azure DevOps Agent namespace"
  default     = true
}

variable "k8s_ado_agents_create_secret" {
  type        = bool
  description = "Create new Kubernetes Azure DevOps Agent secret"
  default     = true
}

variable "k8s_ado_agents_namespace" {
  type        = string
  description = "Kubernetes Azure DevOps Agent namespace"
  default     = "ado-agents"
}

variable "k8s_ado_agents_namespace_annotations" {
  type        = map(string)
  description = "Kubernetes Azure DevOps Agent namespace annotations"
  default     = {}
}

variable "k8s_ado_agents_namespace_labels" {
  type        = map(string)
  description = "Kubernetes Azure DevOps Agent namespace labels"
  default     = {}
}

variable "k8s_ado_agent_image" {
  type        = string
  description = "Azure DevOps Agent container image"
  default     = "ghcr.io/tonyskidmore/terraform-kubernetes-azure-devops-agent-base-image:stable"
}

variable "k8s_ado_agent_type" {
  type        = string
  description = "Azure DevOps Agent type, Job or Deployment"
  default     = "job"
}

variable "k8s_resources_limits_cpu" {
  type        = string
  description = "Kuberenetes Azure DevOps Agent resource limits CPU"
  default     = "1"
}

variable "k8s_resources_limits_memory" {
  type        = string
  description = "Kuberenetes Azure DevOps Agent resource limits memory"
  default     = "1Gi"
}

variable "k8s_resources_requests_cpu" {
  type        = string
  description = "Kuberenetes Azure DevOps Agent resource requests CPU"
  default     = "1"
}

variable "k8s_resources_requests_memory" {
  type        = string
  description = "Kuberenetes Azure DevOps Agent resource requests memory"
  default     = "1"
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
}

variable "keda_version" {
  type        = string
  description = "KEDA version to install using Helm"
  default     = "latest"
}
