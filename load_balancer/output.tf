output "backend_pool_id" {
  description = "backend pool id"
  value       = azurerm_lb_backend_address_pool.backend_pool.id
}

output "ssh_rule_id" {
  description = "ssh lb nat pool rule id"
  value       = azurerm_lb_rule.lb_in_rule.id
}