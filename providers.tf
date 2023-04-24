terraform {
  required_version = ">= 1.3"

  required_providers {
    # TODO: remove
    # azurerm = {
    #   source  = "hashicorp/azurerm"
    #   version = ">= 3.47.0, < 4.0"
    # }
    # tls = {
    #   source  = "hashicorp/tls"
    #   version = ">= 3.1"
    # }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.19.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.9.0"
    }
    # TODO: remove
    # kubectl = {
    #   source  = "gavinbunney/kubectl"
    #   version = ">=1.14.0"
    # }
    github = {
      source  = "integrations/github"
      version = "5.22.0"
    }
  }
}
