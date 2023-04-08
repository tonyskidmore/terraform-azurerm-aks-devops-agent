variable "create_resource_group" {
  type     = bool
  default  = true
  nullable = false
}

variable "location" {
  default = "uksouth"
}

variable "resource_group_name" {
  type    = string
  default = null
}