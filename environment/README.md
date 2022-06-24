<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_load_balancer"></a> [load\_balancer](#module\_load\_balancer) | ../load_balancer | n/a |
| <a name="module_psql_server"></a> [psql\_server](#module\_psql\_server) | ../psql | n/a |
| <a name="module_scale_set"></a> [scale\_set](#module\_scale\_set) | ../scale_set | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.db_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.public_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.public_ip_lb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.main_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.db_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.db_subnet_nsg_asso](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.public_subnet_nsg_asso](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [http_http.self_ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_subnet_address_space"></a> [db\_subnet\_address\_space](#input\_db\_subnet\_address\_space) | address space for the private subnet | `list(any)` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | login username for the Azure PostgreSQL manged service | `string` | n/a | yes |
| <a name="input_lb_private_ip"></a> [lb\_private\_ip](#input\_lb\_private\_ip) | DB server private ip address | `string` | n/a | yes |
| <a name="input_number_of_instances"></a> [number\_of\_instances](#input\_number\_of\_instances) | number of instances in the scale set | `any` | n/a | yes |
| <a name="input_psql_sku"></a> [psql\_sku](#input\_psql\_sku) | psql server hardware sku | `any` | n/a | yes |
| <a name="input_public_subnet_address_space"></a> [public\_subnet\_address\_space](#input\_public\_subnet\_address\_space) | address space for the public subnet | `list(any)` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | name of the resource group. | `any` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | suffix for resources names | `any` | n/a | yes |
| <a name="input_vm_sku"></a> [vm\_sku](#input\_vm\_sku) | VMs hardware sku | `any` | n/a | yes |
| <a name="input_vm_username"></a> [vm\_username](#input\_vm\_username) | Username of OS in the vms created | `string` | n/a | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | address space for the vnet | `list(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_psql_server_password"></a> [psql\_server\_password](#output\_psql\_server\_password) | psql server password |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | public ip of the lb |
| <a name="output_vm_password"></a> [vm\_password](#output\_vm\_password) | virtual machines OS password |
| <a name="output_vm_username"></a> [vm\_username](#output\_vm\_username) | virtual machines OS username |
<!-- END_TF_DOCS -->