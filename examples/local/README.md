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
| aks-devops-agents | ../../ | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ado\_ext\_pat | Azure DevOps Personal Access Token | `string` | n/a | yes |
| ado\_org | Azure DevOps organization | `string` | n/a | yes |
## Outputs

No outputs.

Example

```hcl
module "aks-devops-agents" {
  source      = "../../"
  ado_ext_pat = var.ado_ext_pat
  ado_org     = var.ado_org
}
```
<!-- END_TF_DOCS -->
