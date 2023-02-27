terraform {
  required_providers {
    azurerm = {
      version = "~>3.18.0"
      source  = "hashicorp/azurerm"
    }
    databricks = {
      source = "databricks/databricks"
    }
    random = "~> 3.4.3"
  }

  /*
  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "rg-terraform-xxxx-state"
    storage_account_name = "terraformgithubactions"
    container_name       = "tfstate"
    key                  = "databricks-demo.terraform.tfstate"
    use_oidc             = true
  }
  */

  required_version = ">= 1.1.7, < 2.0.0"
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  # OpenID Connect is an authentication method that uses short-lived tokens
  #use_oidc = true
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}
