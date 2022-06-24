<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_flexible_server.managed_db_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.postgres_no_ssl_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_private_dns_zone.db_private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.link_vnet_db_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [random_password.psql_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_private_dns_zone_address"></a> [db\_private\_dns\_zone\_address](#input\_db\_private\_dns\_zone\_address) | db private dns zone address | `any` | n/a | yes |
| <a name="input_db_subnet_id"></a> [db\_subnet\_id](#input\_db\_subnet\_id) | id of the subnet for the psql server in the vnet | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | db username | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | location for the scale set | `string` | n/a | yes |
| <a name="input_managed_db_server_name"></a> [managed\_db\_server\_name](#input\_managed\_db\_server\_name) | managed db server name | `any` | n/a | yes |
| <a name="input_psql_sku"></a> [psql\_sku](#input\_psql\_sku) | psql server hardware sku | `string` | `"GP_Standard_D2s_v3"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | the name of the resource group for the scale set to be created in | `string` | n/a | yes |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | id of the vnet for the psql | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_psql_server_id"></a> [psql\_server\_id](#output\_psql\_server\_id) | id of created psql server |
| <a name="output_psql_server_password"></a> [psql\_server\_password](#output\_psql\_server\_password) | psql server password |
<!-- END_TF_DOCS -->