terraform {
  required_version = ">= 1.0"

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

locals {
  name = "ex-${basename(path.cwd)}"

  tags = {
    Foo = "Bar"
  }
}

variable "notebook_filename" {
  type = string
}

module "databricks" {
  source = "../"

  location                        = "westeurope"
  cluster_name                    = local.name
  cluster_autotermination_minutes = 20
  cluster_num_workers             = 1
  notebook_subdirectory           = "Terraform"
  notebook_filename               = var.notebook_filename
  notebook_language               = "PYTHON"
  job_name                        = "My Job"
  tags                            = local.tags
}
