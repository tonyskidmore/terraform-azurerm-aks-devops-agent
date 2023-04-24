# local deployment

This example uses [kind](https://kind.sigs.k8s.io/docs/user/quick-start/) as the Kubernetes target and deploys Azure DevOps agents using a `Deployment`.  It reuses the names spaces and KEDA installation carried out be the `local_job` example, so it has that example as a dependency.

See: [Autoscaling Azure Pipelines agents with KEDA](https://keda.sh/blog/2021-05-27-azure-pipelines-scaler/).

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3 |
| azuredevops | >= 0.4.0 |
| helm | ~> 2.9.0 |
| kubernetes | ~> 2.19.0 |
## Providers

No providers.
## Modules

| Name | Source | Version |
|------|--------|---------|
| k8s-azure-devops-agents | ../../ | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ado\_agent\_pool\_auto\_provision | Azure DevOps Agent Pool Autoprovision | `bool` | `true` | no |
| ado\_agent\_pool\_auto\_update | Azure DevOps Agent Pool Autoprovision | `bool` | `true` | no |
| ado\_agent\_pool\_name | Azure DevOps Agent Pool Name | `string` | `"k8s-agents-pool-001"` | no |
| ado\_create\_agent\_pool | Whether to create the agent pool as part of this module | `bool` | `true` | no |
| ado\_ext\_pat | Azure DevOps Personal Access Token | `string` | n/a | yes |
| ado\_org | Azure DevOps organization | `string` | n/a | yes |
| k8s\_ado\_agent\_image | Azure DevOps Agent container image | `string` | `"ghcr.io/tonyskidmore/terraform-kubernetes-azure-devops-agent-base-image:stable"` | no |
| k8s\_ado\_agent\_type | Azure DevOps Agent type, Job or Deployment | `string` | `"job"` | no |
| k8s\_ado\_agents\_create\_namespace | Create new Kubernetes Azure DevOps Agent namespace | `bool` | `true` | no |
| k8s\_ado\_agents\_create\_secret | Create new Kubernetes Azure DevOps Agent secret | `bool` | `true` | no |
| k8s\_ado\_agents\_namespace | Kubernetes Azure DevOps Agent namespace | `string` | `"ado-agents"` | no |
| k8s\_ado\_agents\_namespace\_annotations | Kubernetes Azure DevOps Agent namespace annotations | `map(string)` | `{}` | no |
| k8s\_ado\_agents\_namespace\_labels | Kubernetes Azure DevOps Agent namespace labels | `map(string)` | `{}` | no |
| k8s\_resources\_limits\_cpu | Kuberenetes Azure DevOps Agent resource limits CPU | `string` | `"1"` | no |
| k8s\_resources\_limits\_memory | Kuberenetes Azure DevOps Agent resource limits memory | `string` | `"1Gi"` | no |
| k8s\_resources\_requests\_cpu | Kuberenetes Azure DevOps Agent resource requests CPU | `string` | `"1"` | no |
| k8s\_resources\_requests\_memory | Kuberenetes Azure DevOps Agent resource requests memory | `string` | `"1"` | no |
| keda\_install | Install KEDA as part of the module | `bool` | `true` | no |
| keda\_namespace | Kubernetes namespace name for KEDA install | `string` | `"keda"` | no |
| keda\_version | KEDA version to install using Helm | `string` | `"latest"` | no |
## Outputs

| Name | Description |
|------|-------------|
| keda\_latest\_version | n/a |

Example

```hcl
module "k8s-azure-devops-agents" {
  source = "../../"

  ado_ext_pat                          = var.ado_ext_pat
  ado_org                              = var.ado_org
  ado_agent_pool_name                  = var.ado_agent_pool_name
  ado_create_agent_pool                = var.ado_create_agent_pool
  ado_agent_pool_auto_provision        = var.ado_agent_pool_auto_provision
  ado_agent_pool_auto_update           = var.ado_agent_pool_auto_update
  k8s_ado_agents_create_namespace      = var.k8s_ado_agents_create_namespace
  k8s_ado_agents_create_secret         = var.k8s_ado_agents_create_secret
  k8s_ado_agents_namespace             = var.k8s_ado_agents_namespace
  k8s_ado_agents_namespace_labels      = var.k8s_ado_agents_namespace_labels
  k8s_ado_agents_namespace_annotations = var.k8s_ado_agents_namespace_annotations
  k8s_ado_agent_image                  = var.k8s_ado_agent_image
  k8s_ado_agent_type                   = var.k8s_ado_agent_type
  k8s_resources_limits_cpu             = var.k8s_resources_limits_cpu
  k8s_resources_limits_memory          = var.k8s_resources_limits_memory
  k8s_resources_requests_cpu           = var.k8s_resources_requests_cpu
  k8s_resources_requests_memory        = var.k8s_resources_requests_memory
  keda_install                         = var.keda_install
  keda_namespace                       = var.keda_namespace
  keda_version                         = var.keda_version
}
```
<!-- END_TF_DOCS -->
