# terraform-kubernetes-azure-devops-agent

<!-- BEGIN_TF_DOCS -->



## Basic example

```hcl

module "k8s-azure-devops-agents" {
  source         = "../../"
  ado_ext_pat    = var.ado_ext_pat
  ado_org        = var.ado_org
  keda_namespace = var.keda_namespace
  keda_version   = var.keda_version
  keda_install   = var.keda_install
}

```
## Resources

| Name | Type |
|------|------|
| [azuredevops_agent_pool.k8s](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/agent_pool) | resource |
| [helm_release.keda](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.job_setup](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.scaled_job](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.ado-agents](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.keda](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.pipeline-auth](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [github_release.keda](https://registry.terraform.io/providers/integrations/github/5.22.0/docs/data-sources/release) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ado_agent_pool_auto_provision"></a> [ado\_agent\_pool\_auto\_provision](#input\_ado\_agent\_pool\_auto\_provision) | Azure DevOps Agent Pool Autoprovision | `bool` | `true` | no |
| <a name="input_ado_agent_pool_auto_update"></a> [ado\_agent\_pool\_auto\_update](#input\_ado\_agent\_pool\_auto\_update) | Azure DevOps Agent Pool Autoprovision | `bool` | `true` | no |
| <a name="input_ado_agent_pool_name"></a> [ado\_agent\_pool\_name](#input\_ado\_agent\_pool\_name) | Azure DevOps Agent Pool Name | `string` | `"k8s-agents-pool-001"` | no |
| <a name="input_ado_ext_pat"></a> [ado\_ext\_pat](#input\_ado\_ext\_pat) | Azure DevOps Personal Access Token | `string` | n/a | yes |
| <a name="input_ado_org"></a> [ado\_org](#input\_ado\_org) | Azure DevOps organization | `string` | n/a | yes |
| <a name="input_k8s_ado_agent_image"></a> [k8s\_ado\_agent\_image](#input\_k8s\_ado\_agent\_image) | Azure DevOps Agent conatiner image | `string` | `"ghcr.io/tonyskidmore/ado-pipelines-agent:latest"` | no |
| <a name="input_k8s_ado_agents_namespace"></a> [k8s\_ado\_agents\_namespace](#input\_k8s\_ado\_agents\_namespace) | Kubernetes Azure DevOps Agent namespace | `string` | `"ado-agents"` | no |
| <a name="input_keda_install"></a> [keda\_install](#input\_keda\_install) | Install KEDA as part of the module | `bool` | `true` | no |
| <a name="input_keda_namespace"></a> [keda\_namespace](#input\_keda\_namespace) | Kubernetes namespace name for KEDA install | `string` | `"keda"` | no |
| <a name="input_keda_version"></a> [keda\_version](#input\_keda\_version) | KEDA version to install using Helm | `string` | `"latest"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keda_latest_version"></a> [keda\_latest\_version](#output\_keda\_latest\_version) | n/a |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 0.4.0 |
| <a name="provider_github"></a> [github](#provider\_github) | 5.22.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.9.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.19.0 |


<!-- END_TF_DOCS -->
