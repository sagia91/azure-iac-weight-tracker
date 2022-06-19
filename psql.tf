resource "azurerm_private_dns_zone" "db_private_dns_zone" {
  name                = "main.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.main_resource_group.name
}


resource "azurerm_private_dns_zone_virtual_network_link" "link_vnet_db_dns_zone" {
  name                  = "link-vnet-db-dns-zone"
  private_dns_zone_name = azurerm_private_dns_zone.db_private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  resource_group_name   = azurerm_resource_group.main_resource_group.name
}

resource "azurerm_postgresql_flexible_server" "managed_db_server" {
  name                         = "managed-db-server"
  resource_group_name          = azurerm_resource_group.main_resource_group.name
  location                     = azurerm_resource_group.main_resource_group.location
  version                      = "11"
  geo_redundant_backup_enabled = true
  delegated_subnet_id          = azurerm_subnet.db_subnet.id
  private_dns_zone_id          = azurerm_private_dns_zone.db_private_dns_zone.id
  administrator_login          = var.db_username
  administrator_password       = var.db_password
  zone                         = "1"
  storage_mb                   = 32768
  sku_name                     = "GP_Standard_D2s_v3"

  high_availability {
    mode = "ZoneRedundant"
  }
  depends_on = [azurerm_private_dns_zone_virtual_network_link.link_vnet_db_dns_zone]
}

resource "azurerm_postgresql_flexible_server_configuration" "postgres_no_ssl_rule" {
  name      = "require_secure_transport"
  server_id = azurerm_postgresql_flexible_server.managed_db_server.id
  value     = "off"
}