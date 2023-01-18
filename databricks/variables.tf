
variable "tags" {
  type    = map(any)
  default = {}
}

variable "data_depends_on" {
  type    = any
  default = []
}