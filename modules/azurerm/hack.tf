# hack: https://stackoverflow.com/questions/58275233/terraform-depends-on-with-modules/58277124#58277124

variable "data_depends_on" {
  # the value doesn't matter; we're just using this variable
  # to propagate dependencies.
  type    = any
  default = []
}

output "databricks_workspace" {
  # The value is not important because we're just
  # using this for its dependencies.
  value = {}

  # Anything that refers to this output must wait until
  # the actions for azurerm_monitor_diagnostic_setting.example
  # to have completed first.
  depends_on = [azurerm_databricks_workspace.this]
}
