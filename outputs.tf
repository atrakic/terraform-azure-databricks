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
