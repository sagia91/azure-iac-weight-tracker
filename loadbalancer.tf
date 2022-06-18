resource "azurerm_public_ip"  "pubip_lb" {
    name = "pubip-lb"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method = "Static"
}

# LB
resource "azurerm_lb" "lb" {
  name                = "lb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name                 = "lbfrontendipconf"
    private_ip_address   = var.lb_private_ip
    public_ip_address_id = azurerm_public_ip.pubip_lb.id
  }
}
/*
resource "azurerm_lb_outbound_rule" "example" {
  loadbalancer_id         = azurerm_lb.lb.id
  name                    = "OutboundRule"
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id

  frontend_ip_configuration {
    name = "lbfrontendipconf"
  }
  depends_on                     = [azurerm_lb_backend_address_pool.backend_pool]
}
*/
# BACKEND ADDRESS POOL
resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "backendpool"
}

# LB RULE
resource "azurerm_lb_nat_pool" "lb_nat_rule" {
  backend_port                   = 80
  frontend_ip_configuration_name = "lbfrontendipconf"
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "nat_rule_lb_internet_access"
  protocol                       = "Tcp"
  resource_group_name            = azurerm_resource_group.rg.name
  frontend_port_end              = 80
  frontend_port_start            = 80
}

# LB PROBE
resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "lbprobe"
  protocol            = "Tcp"
  request_path = "/"
  port                = 20202
  interval_in_seconds = 5
  number_of_probes    = var.number_of_instances
}