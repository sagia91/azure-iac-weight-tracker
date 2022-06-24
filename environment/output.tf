output "vm_username" {
  value       = var.vm_username
  description = "virtual machines OS username"
  sensitive   = true
}

output "vm_password" {
  value       = module.scale_set.scale_set_password
  description = "virtual machines OS password"
  sensitive   = true
}

output "psql_server_password" {
  description = "psql server password"
  value       = module.psql_server.psql_server_password
}

output "public_ip" {
  description = "public ip of the lb"
  value       = azurerm_public_ip.public_ip_lb.ip_address
}