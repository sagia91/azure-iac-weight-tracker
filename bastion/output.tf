output "bastion_id" {
  description = "id of created bastion server"
  value       = azurerm_bastion_host.bastion.id
}