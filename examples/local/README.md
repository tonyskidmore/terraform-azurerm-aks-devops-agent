<!-- BEGIN_TF_DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3 |
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
| ado\_ext\_pat | Azure DevOps Personal Access Token | `string` | n/a | yes |
| ado\_org | Azure DevOps organization | `string` | n/a | yes |
| keda\_install | Install KEDA as part of the module | `bool` | n/a | yes |
| keda\_namespace | Kubernetes namespace name for KEDA install | `string` | `"keda"` | no |
| keda\_version | KEDA version to install | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| keda\_latest\_version | n/a |

Example

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
<!-- END_TF_DOCS -->
