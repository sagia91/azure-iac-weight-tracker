module "environment-prod" {
  source              = "./environment"
  db_subnet_address_space = var.db_subnet_address_space
  db_username = var.db_username
  lb_private_ip = var.lb_private_ip
  number_of_instances = var.number_of_instances
  public_subnet_address_space = var.public_subnet_address_space
  resource_group_location = var.resource_group_location
  resource_group_name = var.resource_group_name
  vm_username = var.vm_username
  vnet_address_space = var.vnet_address_space

  suffix = var.env1-suffix
  vm_sku = var.env1-vm_sku
  psql_sku = var.env1-psql_sku
}