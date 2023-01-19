terraform {
  required_providers {
    azurerm = "~> 3.18.0"
  }
}

provider "azurerm" {
  features {}
}

variable "prefix" {}
variable "resource_group_name" {}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "tags" {
  type    = map(any)
  default = {}
}

data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}

data "external" "me" {
  program = ["az", "account", "show", "--query", "user"]
}

locals {
  tags = {
    Region = var.location
    Owner  = lookup(data.external.me.result, "name")
  }
}

resource "azurerm_databricks_workspace" "this" {
  name                        = "${var.prefix}-workspace"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku                         = "premium"
  managed_resource_group_name = "${var.prefix}-workspace-rg"
  tags                        = merge(var.tags, local.tags)
}

output "databricks_host" {
  value = "https://${azurerm_databricks_workspace.this.workspace_url}/"
}
