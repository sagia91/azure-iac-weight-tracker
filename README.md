<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.bastion](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/bastion_host) | resource |
| [azurerm_lb.load_balancer](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.backend_pool](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.lb_probe](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.lb_in_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/lb_rule) | resource |
| [azurerm_monitor_autoscale_setting.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_network_security_group.db_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.public_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_security_group) | resource |
| [azurerm_orchestrated_virtual_machine_scale_set.vmss](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/orchestrated_virtual_machine_scale_set) | resource |
| [azurerm_postgresql_flexible_server.managed_db_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.postgres_no_ssl_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_private_dns_zone.db_private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.link_vnet_db_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.public_id_bastion](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/public_ip) | resource |
| [azurerm_public_ip.public_ip_lb](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.main_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.bastion_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/subnet) | resource |
| [azurerm_subnet.db_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/subnet) | resource |
| [azurerm_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.db_subnet_nsg_asso](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.public_subnet_nsg_asso](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | login Password for the Azure PostgreSQL manged service | `string` | `"AeTqpTatQeKKJCW"` | no |
| <a name="input_db_subnet_address_space"></a> [db\_subnet\_address\_space](#input\_db\_subnet\_address\_space) | address space for the private subnet | `list` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | login username for the Azure PostgreSQL manged service | `string` | `"psqladmin"` | no |
| <a name="input_lb_private_ip"></a> [lb\_private\_ip](#input\_lb\_private\_ip) | DB server private ip address | `string` | `"10.0.1.100"` | no |
| <a name="input_number_of_instances"></a> [number\_of\_instances](#input\_number\_of\_instances) | number of instances in the scaleset | `string` | `"2"` | no |
| <a name="input_public_subnet_address_space"></a> [public\_subnet\_address\_space](#input\_public\_subnet\_address\_space) | address space for the public subnet | `list` | <pre>[<br>  "10.0.0.0/24"<br>]</pre> | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | name of the resource group. | `string` | `"weight-tracker"` | no |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | Password of OS in the vms created | `string` | `"M6vUgnHzVY583Xn"` | no |
| <a name="input_vm_username"></a> [vm\_username](#input\_vm\_username) | Username of OS in the vms created | `string` | `"adminos"` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | address space for the vnet | `list` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_password"></a> [vm\_password](#output\_vm\_password) | virtual machines OS password |
| <a name="output_vm_username"></a> [vm\_username](#output\_vm\_username) | virtual machines OS username |
<!-- END_TF_DOCS -->