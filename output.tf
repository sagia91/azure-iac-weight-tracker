output "vm_username" {
  value       = var.vm_username
  description = "virtual machines OS username"
  sensitive   = true
}

output "vm_password" {
  value       = module.environment-prod.vm_password
  description = "virtual machines OS password"
  sensitive   = true
}

output "number_of_instances" {
  value       = var.number_of_instances
  description = "number of instances in the scale set"
}

output "psql_server_password" {
  description = "psql server password"
  value       = module.environment-prod.psql_server_password
  sensitive   = true
}

output "public_ip" {
  description = "public ip of the lb"
  value       = module.environment-prod.public_ip
}