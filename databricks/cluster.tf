variable "cluster_name" {
  description = "A name for the cluster."
  type        = string
}

variable "cluster_autotermination_minutes" {
  description = "How many minutes before automatically terminating due to inactivity."
  type        = number
  default     = 30
}

variable "cluster_num_workers" {
  description = "The number of workers."
  type        = number
  default     = 1
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
  depends_on        = [var.data_depends_on]
}

resource "databricks_cluster" "this" {
  cluster_name            = var.cluster_name
  node_type_id            = data.databricks_node_type.smallest.id
  spark_version           = data.databricks_spark_version.latest_lts.id
  autotermination_minutes = var.cluster_autotermination_minutes
  num_workers             = var.cluster_num_workers

  # https://learn.microsoft.com/en-us/azure/databricks/dev-tools/api/latest/clusters#--azureattributes
  autoscale {
    min_workers = 1
    max_workers = 5
  }
  azure_attributes {
    availability       = "SPOT_WITH_FALLBACK_AZURE"
    first_on_demand    = 1
    spot_bid_max_price = 100
  }
}

output "cluster_url" {
  value = databricks_cluster.this.url
}

output "cluster_id" {
  value = databricks_cluster.this.cluster_id
}
