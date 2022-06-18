output "ip" {
  value = azurerm_public_ip.pubip_lb.ip_address
  description = "The password for logging in to the database."
  #sensitive   = true
}