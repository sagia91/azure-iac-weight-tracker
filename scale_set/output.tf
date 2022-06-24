output "scale_set_id" {
  description = "id of created vmss"
  value       = azurerm_linux_virtual_machine_scale_set.vmss.id
}

output "scale_set_password" {
  description = "generated password of created vmss"
  value       = azurerm_linux_virtual_machine_scale_set.vmss.admin_password
}