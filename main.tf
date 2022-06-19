resource "azurerm_resource_group" "main_resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "scale_set" {
  source              = "./scale_set"
  backend_pool_id     = azurerm_lb_backend_address_pool.backend_pool.id
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.main_resource_group.name
  subnet_id           = azurerm_subnet.public_subnet.id
  vm_username         = var.vm_username
  vm_password         = var.vm_password
  number_of_instances = var.number_of_instances
}