output "vm_username" {
  value       = var.vm_username
  description = "virtual machines OS username"
  sensitive   = true
}

output "vm_password_prod" {
  value       = module.environment-prod.vm_password
  description = "virtual machines OS password"
  sensitive   = true
}

output "vm_password_stg" {
  value       = module.environment-stg.vm_password
  description = "virtual machines OS password"
  sensitive   = true
}

output "psql_server_password_stg" {
  description = "psql server password"
  value       = module.environment-stg.psql_server_password
  sensitive   = true
}

output "pub_ip_stg" {
  description = "public ip stg lb"
  value       = module.environment-stg.public_ip
  sensitive   = true
}

output "pub_ip_prod" {
  description = "public ip prod lb"
  value       = module.environment-prod.public_ip
  sensitive   = true
}

output "psql_server_password_prod" {
  description = "psql server password"
  value       = module.environment-prod.psql_server_password
  sensitive   = true
}