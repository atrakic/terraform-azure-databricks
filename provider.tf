terraform {
  required_providers {
    azurerm = {
      version = "~>3.18.0"
      source  = "hashicorp/azurerm"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }
  required_version = ">= 1.1.7, < 2.0.0"
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# Make client_id, tenant_id, subscription_id and object_id variables
data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}
