output "scale_set_id" {
  description = "id of created vmss"
  value       = azurerm_orchestrated_virtual_machine_scale_set.vmss.id
}