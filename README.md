# terraform-azure-databricks

[![Terraform Unit Tests](https://github.com/atrakic/terraform-azure-databricks/actions/workflows/tf-unit-tests.yml/badge.svg)](https://github.com/atrakic/terraform-azure-databricks/actions/workflows/tf-unit-tests.yml)
[![license](https://img.shields.io/github/license/atrakic/terraform-azure-databricks.svg)](https://github.com/atrakic/terraform-azure-databricks/blob/main/LICENSE)

This repo provides IaC for [Azure Databricks](https://learn.microsoft.com/en-us/azure/databricks/).

Providers used:
- [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- [databricks](https://registry.terraform.io/providers/databricks/databricks/latest)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.18.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.18.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_databricks"></a> [databricks](#module\_databricks) | ./modules/databricks | n/a |
| <a name="module_workspace"></a> [workspace](#module\_workspace) | ./modules/azurerm | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_string.naming](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_autotermination_minutes"></a> [cluster\_autotermination\_minutes](#input\_cluster\_autotermination\_minutes) | n/a | `number` | `30` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_cluster_num_workers"></a> [cluster\_num\_workers](#input\_cluster\_num\_workers) | n/a | `number` | n/a | yes |
| <a name="input_job_name"></a> [job\_name](#input\_job\_name) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"westeurope"` | no |
| <a name="input_notebook_filename"></a> [notebook\_filename](#input\_notebook\_filename) | n/a | `string` | n/a | yes |
| <a name="input_notebook_language"></a> [notebook\_language](#input\_notebook\_language) | n/a | `string` | n/a | yes |
| <a name="input_notebook_subdirectory"></a> [notebook\_subdirectory](#input\_notebook\_subdirectory) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_databricks_host"></a> [databricks\_host](#output\_databricks\_host) | n/a |
| <a name="output_job_url"></a> [job\_url](#output\_job\_url) | n/a |
| <a name="output_notebook_url"></a> [notebook\_url](#output\_notebook\_url) | n/a |
<!-- END_TF_DOCS -->