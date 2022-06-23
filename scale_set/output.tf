output "scale_set_id" {
  description = "id of created vmss"
  value       = azurerm_orchestrated_virtual_machine_scale_set.vmss.id
}

output "scale_set_password" {
  description = "generated password of created vmss"
  value       = azurerm_orchestrated_virtual_machine_scale_set.vmss.os_profile[0].linux_configuration[0].admin_password
}