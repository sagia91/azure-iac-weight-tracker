output "psql_server_id" {
  description = "id of created psql server"
  value       = azurerm_postgresql_flexible_server.managed_db_server.id
}

output "psql_server_password" {
  description = "psql server password"
  value       = azurerm_postgresql_flexible_server.managed_db_server.administrator_password
}