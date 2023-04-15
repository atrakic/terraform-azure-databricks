output "self" {
  description = "Runtime environment"
  value = {
    workspace   = terraform.workspace
    last_update = timestamp()
  }
}

output "databricks_host" {
  value = module.databricks.databricks_host
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
