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
| [azurerm_linux_virtual_machine_scale_set.vmss](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set) | resource |
| [azurerm_monitor_autoscale_setting.monitor_autoscale_setting_scale_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |
| [random_password.vmss_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_pool_id"></a> [backend\_pool\_id](#input\_backend\_pool\_id) | id of the backend pool of the load balancer | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | location for the scale set | `string` | n/a | yes |
| <a name="input_number_of_instances"></a> [number\_of\_instances](#input\_number\_of\_instances) | number of instances in the scale set | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | the name of the resource group for the scale set to be created in | `string` | n/a | yes |
| <a name="input_ssh_rule_id"></a> [ssh\_rule\_id](#input\_ssh\_rule\_id) | ssh lb nat pool rule id | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | id of the subnet for the scaleset in the virtual network | `string` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | suffix for resources names | `any` | n/a | yes |
| <a name="input_vm_sku"></a> [vm\_sku](#input\_vm\_sku) | VMs hardware sku | `any` | n/a | yes |
| <a name="input_vm_username"></a> [vm\_username](#input\_vm\_username) | Username of OS in the VMs created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_scale_set_id"></a> [scale\_set\_id](#output\_scale\_set\_id) | id of created vmss |
| <a name="output_scale_set_password"></a> [scale\_set\_password](#output\_scale\_set\_password) | generated password of created vmss |
<!-- END_TF_DOCS -->