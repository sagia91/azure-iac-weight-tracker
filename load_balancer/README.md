<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.load_balancer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.backend_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_nat_pool.lb-nat-pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_nat_pool) | resource |
| [azurerm_lb_probe.lb_probe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.lb_in_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lb_private_ip"></a> [lb\_private\_ip](#input\_lb\_private\_ip) | DB server private ip address | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | location for the scale set | `string` | n/a | yes |
| <a name="input_number_of_instances"></a> [number\_of\_instances](#input\_number\_of\_instances) | number of instances in the scale set | `string` | n/a | yes |
| <a name="input_public_ip_lb_id"></a> [public\_ip\_lb\_id](#input\_public\_ip\_lb\_id) | id of the public ip address to associate with this lb | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | the name of the resource group for the scale set to be created in | `string` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | suffix for resources names | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_pool_id"></a> [backend\_pool\_id](#output\_backend\_pool\_id) | backend pool id |
| <a name="output_ssh_rule_id"></a> [ssh\_rule\_id](#output\_ssh\_rule\_id) | ssh lb nat pool rule id |
<!-- END_TF_DOCS -->