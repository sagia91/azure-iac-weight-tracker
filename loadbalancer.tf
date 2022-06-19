resource "azurerm_lb" "load_balancer" {
  name                = "load-balancer"
  location            = azurerm_resource_group.main_resource_group.location
  resource_group_name = azurerm_resource_group.main_resource_group.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "frontend-ip-conf-lb"
    private_ip_address   = var.lb_private_ip
    public_ip_address_id = azurerm_public_ip.public_ip_lb.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = "backend-pool"
}

resource "azurerm_lb_rule" "lb_in_rule" {
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "lb_in_rule"
  protocol                       = "Tcp"
  frontend_port                  = "8080"
  backend_port                   = "8080"
  frontend_ip_configuration_name = "frontend-ip-conf-lb"
  enable_floating_ip             = false
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  idle_timeout_in_minutes        = 5
  probe_id                       = azurerm_lb_probe.lb_probe.id
}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id     = azurerm_lb.load_balancer.id
  name                = "lb-probe"
  protocol            = "Tcp"
  port                = 20202
  interval_in_seconds = 5
  number_of_probes    = var.number_of_instances
}