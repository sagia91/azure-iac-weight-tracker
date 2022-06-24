# azure-iac-weight-tracker
iac for the weight tracker app (https://github.com/sagia91/bootcamp-app) using terraform.

# usage:
write "terraform init & terraform apply" in terminal to run the script.

# dependencies:
* terraform
* azure CLI (logged in)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.10.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_environment-prod"></a> [environment-prod](#module\_environment-prod) | ./environment | n/a |
| <a name="module_environment-stg"></a> [environment-stg](#module\_environment-stg) | ./environment | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_subnet_address_space"></a> [db\_subnet\_address\_space](#input\_db\_subnet\_address\_space) | address space for the private subnet | `list(any)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | login username for the Azure PostgreSQL manged service | `string` | `"psqladmin"` | no |
| <a name="input_env1-psql_sku"></a> [env1-psql\_sku](#input\_env1-psql\_sku) | psql server hardware sku | `string` | `"GP_Standard_D2s_v3"` | no |
| <a name="input_env1-suffix"></a> [env1-suffix](#input\_env1-suffix) | suffix for the first environment | `string` | `"-prod"` | no |
| <a name="input_env1-vm_sku"></a> [env1-vm\_sku](#input\_env1-vm\_sku) | VMs hardware sku | `string` | `"Standard_D2as_v5"` | no |
| <a name="input_env2-psql_sku"></a> [env2-psql\_sku](#input\_env2-psql\_sku) | psql server hardware sku | `string` | `"GP_Standard_B2s"` | no |
| <a name="input_env2-suffix"></a> [env2-suffix](#input\_env2-suffix) | suffix for the second environment | `string` | `"-stg"` | no |
| <a name="input_env2-vm_sku"></a> [env2-vm\_sku](#input\_env2-vm\_sku) | VMs hardware sku | `string` | `"Standard_D2as_v5"` | no |
| <a name="input_lb_private_ip"></a> [lb\_private\_ip](#input\_lb\_private\_ip) | DB server private ip address | `string` | `"10.0.1.100"` | no |
| <a name="input_number_of_instances"></a> [number\_of\_instances](#input\_number\_of\_instances) | number of instances in the scale set | `string` | `"3"` | no |
| <a name="input_public_subnet_address_space"></a> [public\_subnet\_address\_space](#input\_public\_subnet\_address\_space) | address space for the public subnet | `list(any)` | <pre>[<br>  "10.0.0.0/24"<br>]</pre> | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | name of the resource group. | `string` | `"weight-tracker"` | no |
| <a name="input_vm_username"></a> [vm\_username](#input\_vm\_username) | Username of OS in the vms created | `string` | `"adminos"` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | address space for the vnet | `list(any)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_number_of_instances"></a> [number\_of\_instances](#output\_number\_of\_instances) | number of instances in the scale set |
| <a name="output_psql_server_password"></a> [psql\_server\_password](#output\_psql\_server\_password) | psql server password |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | public ip of the lb |
| <a name="output_vm_password"></a> [vm\_password](#output\_vm\_password) | virtual machines OS password |
| <a name="output_vm_username"></a> [vm\_username](#output\_vm\_username) | virtual machines OS username |
<!-- END_TF_DOCS -->