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