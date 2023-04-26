terraform {
  required_version = ">= 1.3.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.35.0"
      configuration_aliases = [
        azurerm.management,
        azurerm.connectivity,
      ]
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.7.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id = var.client_id
  tenant_id = var.tenant_id
  client_secret = var.client_secret
  features {}
}

provider "azurerm" {
  alias           = "management"
  subscription_id = local.subscription_id_management
  client_id = var.client_id
  tenant_id = var.tenant_id
  client_secret = var.client_secret
  features {}
}

provider "azurerm" {
  alias           = "connectivity"
  subscription_id = local.subscription_id_connectivity
  client_id = var.client_id
  tenant_id = var.tenant_id
  client_secret = var.client_secret
  features {}
}