resource "azurerm_resource_group" "main_resource_group" {
  name     = "${var.resource_group_name}${var.suffix}"
  location = var.resource_group_location
}

module "load_balancer" {
  source              = "../load_balancer"
  lb_private_ip       = var.lb_private_ip
  location            = var.resource_group_location
  number_of_instances = var.number_of_instances
  public_ip_lb_id     = azurerm_public_ip.public_ip_lb.id
  resource_group_name = azurerm_resource_group.main_resource_group.name
  suffix              = var.suffix
}

module "scale_set" {
  source              = "../scale_set"
  backend_pool_id     = module.load_balancer.backend_pool_id
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.main_resource_group.name
  subnet_id           = azurerm_subnet.public_subnet.id
  vm_username         = var.vm_username
  number_of_instances = var.number_of_instances
  suffix              = var.suffix
  vm_sku              = var.vm_sku
  ssh_rule_id         = module.load_balancer.ssh_rule_id
}

module "psql_server" {
  source                      = "../psql"
  db_subnet_id                = azurerm_subnet.db_subnet.id
  db_username                 = var.db_username
  location                    = var.resource_group_location
  resource_group_name         = azurerm_resource_group.main_resource_group.name
  vnet_id                     = azurerm_virtual_network.vnet.id
  db_private_dns_zone_address = "main${var.suffix}.postgres.database.azure.com"
  managed_db_server_name      = "managed-db-server${var.suffix}"
}
