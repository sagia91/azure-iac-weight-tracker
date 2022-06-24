resource "azurerm_lb" "load_balancer" {
  name                = "load-balancer${var.suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "frontend-ip-conf-lb${var.suffix}"
    private_ip_address   = var.lb_private_ip
    public_ip_address_id = var.public_ip_lb_id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = "backend-pool${var.suffix}"
}

resource "azurerm_lb_rule" "lb_in_rule" {
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "lb_in_rule"
  protocol                       = "Tcp"
  frontend_port                  = "8080"
  backend_port                   = "8080"
  frontend_ip_configuration_name = azurerm_lb.load_balancer.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  idle_timeout_in_minutes        = 5
  probe_id                       = azurerm_lb_probe.lb_probe.id
}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id     = azurerm_lb.load_balancer.id
  name                = "lb-probe"
  protocol            = "Tcp"
  port                = 8080
  interval_in_seconds = 5
  number_of_probes    = var.number_of_instances
}

resource "azurerm_lb_nat_pool" "lb-nat-pool" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "ssh"
  protocol                       = "Tcp"
  frontend_port_start            = "6001"
  frontend_port_end              = "600${var.number_of_instances}"
  backend_port                   = 22
  frontend_ip_configuration_name = "frontend-ip-conf-lb${var.suffix}"
}