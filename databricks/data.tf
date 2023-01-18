data "databricks_current_user" "me" {
  depends_on = [var.data_depends_on]
}

data "databricks_spark_version" "latest" {
  depends_on = [var.data_depends_on]
}

data "databricks_node_type" "smallest" {
  local_disk = true
  depends_on = [var.data_depends_on]
}