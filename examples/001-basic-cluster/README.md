<!-- BEGIN_TF_DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3 |
| azurerm | >= 3.47.0, < 4.0 |
| random | >=3.4.0 |
| tls | >= 3.1 |
## Providers

| Name | Version |
|------|---------|
| azurerm | 3.51.0 |
| random | 3.4.3 |
## Modules

| Name | Source | Version |
|------|--------|---------|
| aks-agents | ../.. | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_resource\_group | n/a | `bool` | `true` | no |
| location | n/a | `string` | `"uksouth"` | no |
| resource\_group\_name | n/a | `string` | `null` | no |
## Outputs

No outputs.

Example

```hcl
resource "random_id" "prefix" {
  byte_length = 8
}

resource "azurerm_resource_group" "main" {
  count = var.create_resource_group ? 1 : 0

  location = var.location
  name     = coalesce(var.resource_group_name, "${random_id.prefix.hex}-rg")
}

locals {
  resource_group = {
    name     = var.create_resource_group ? azurerm_resource_group.main[0].name : var.resource_group_name
    location = var.location
  }
}

resource "azurerm_virtual_network" "test" {
  address_space       = ["10.52.0.0/16"]
  location            = local.resource_group.location
  name                = "${random_id.prefix.hex}-vn"
  resource_group_name = local.resource_group.name
}

resource "azurerm_subnet" "test" {
  address_prefixes                          = ["10.52.0.0/24"]
  name                                      = "${random_id.prefix.hex}-sn"
  resource_group_name                       = local.resource_group.name
  virtual_network_name                      = azurerm_virtual_network.test.name
  private_endpoint_network_policies_enabled = true
}

module "aks-agents" {
  source = "../.."

  prefix              = "prefix-${random_id.prefix.hex}"
  resource_group_name = local.resource_group.name
  vnet_subnet_id      = azurerm_subnet.test.id
}
```
<!-- END_TF_DOCS -->
