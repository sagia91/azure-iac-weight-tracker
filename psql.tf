/*
resource "azurerm_private_dns_zone" "example" {
  name                = "example.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "exampleVnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.example.name
  virtual_network_id    = azurerm_virtual_network.example.id
  resource_group_name   = azurerm_resource_group.example.name
}

resource "azurerm_postgresql_flexible_server" "example" {
  name                   = "dbb"
  source_server_id       = azurerm_postgresql_flexible_server.example.id
  resource_group_name    = azurerm_resource_group.example.name
  location               = azurerm_resource_group.example.location
  version                = "13"
  delegated_subnet_id    = azurerm_subnet.example.id
  private_dns_zone_id    = azurerm_private_dns_zone.example.id
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  zone                   = "1"
  storage_mb             = 32768
  sku_name               = "GP_Standard_D2s_v3"
  high_availability {
    mode = "ZoneRedundant"
  }
  depends_on = [azurerm_private_dns_zone_virtual_network_link.example]
}

resource "azurerm_postgresql_flexible_server_configuration" "postgres_no_ssl_rule" {
  name      = "require_secure_transport"
  server_id = azurerm_postgresql_flexible_server.example.id
  value     = "off"
}*/