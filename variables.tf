variable "location" {
  type    = string
  default = "westeurope"
}

variable "cluster_name" {
  type = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "cluster_autotermination_minutes" {
  type    = number
  default = 30
}

variable "cluster_num_workers" {
  type = number
}

variable "notebook_subdirectory" {
  type = string
}

variable "notebook_filename" {
  type = string
}

variable "notebook_language" {
  type = string
}

variable "job_name" {
  type = string
}
