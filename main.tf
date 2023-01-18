locals {
  tags = {
    Terraform   = "true"
    Environment = "Demo"
    Workspace   = terraform.workspace
  }
}

module "workspace" {
  source = "./azurerm"
  region = var.region
  tags   = local.tags
}

module "databricks" {
  source                          = "./databricks"
  databricks_host                 = module.workspace.databricks_host
  cluster_name                    = var.cluster_name
  cluster_autotermination_minutes = var.cluster_autotermination_minutes
  cluster_num_workers             = var.cluster_num_workers
  notebook_subdirectory           = var.notebook_subdirectory
  notebook_filename               = var.notebook_filename
  notebook_language               = var.notebook_language
  job_name                        = var.job_name
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
