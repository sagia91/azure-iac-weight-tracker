resource "azurerm_private_dns_zone" "db_private_dns_zone" {
  name                = var.db_private_dns_zone_address
  resource_group_name =  var.resource_group_name
}


resource "azurerm_private_dns_zone_virtual_network_link" "link_vnet_db_dns_zone" {
  name                  = "link-vnet-db-dns-zone"
  private_dns_zone_name = azurerm_private_dns_zone.db_private_dns_zone.name
  virtual_network_id    = var.vnet_id
  resource_group_name   = var.resource_group_name
}

resource "random_password" "psql_password" {
  length           = 12
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_postgresql_flexible_server" "managed_db_server" {
  name                         = var.managed_db_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "11"
  #geo_redundant_backup_enabled = true
  delegated_subnet_id          = var.db_subnet_id
  private_dns_zone_id          = azurerm_private_dns_zone.db_private_dns_zone.id
  administrator_login          = var.db_username
  administrator_password       = random_password.psql_password.result
  zone                         = "1"
  storage_mb                   = 32768
  sku_name                     = var.psql_sku

  high_availability {
    mode = "ZoneRedundant"
    standby_availability_zone = "2"
  }
  depends_on = [azurerm_private_dns_zone_virtual_network_link.link_vnet_db_dns_zone]
}

resource "azurerm_postgresql_flexible_server_configuration" "postgres_no_ssl_rule" {
  name      = "require_secure_transport"
  server_id = azurerm_postgresql_flexible_server.managed_db_server.id
  value     = "off"
}