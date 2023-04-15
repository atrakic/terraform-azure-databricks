resource "azurerm_resource_group" "this" {
  name     = "${local.prefix}-rg"
  location = var.location
  tags     = local.tags
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

locals {
  prefix = "databricks${random_string.naming.result}"
  tags = merge(
    {
      Workspace = terraform.workspace
      Terraform = "true"
    },
    var.tags,
  )
}

module "workspace" {
  source = "./modules/azurerm"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  prefix              = local.prefix
  tags                = local.tags
}

module "databricks" {
  source = "./modules/databricks"

  cluster_name                    = var.cluster_name
  cluster_autotermination_minutes = var.cluster_autotermination_minutes
  cluster_num_workers             = var.cluster_num_workers
  notebook_subdirectory           = var.notebook_subdirectory
  notebook_filename               = var.notebook_filename
  notebook_language               = var.notebook_language
  job_name                        = var.job_name
  databricks_host                 = module.workspace.databricks_host
  data_depends_on                 = [module.workspace.databricks_workspace]
  tags                            = local.tags
}

output "databricks_host" {
  value = module.workspace.databricks_host
}

output "cluster_id" {
  value = module.databricks.cluster_id
}

output "job_url" {
  value = module.databricks.job_url
}

output "notebook_url" {
  value = module.databricks.notebook_url
}
