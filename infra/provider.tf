terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tjs-tpxs"
    storage_account_name = "satjstpxs"
    container_name       = "tfstate"
    key                  = "l3-web-main-site/terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.31.0"
    }
    random = {
      source  = "registry.terraform.io/hashicorp/random"
      version = "~> 3.1.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = false
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}