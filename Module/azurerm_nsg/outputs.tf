output "nsgs" {
  description = "Map of created Network Security Group objects keyed by map key."
  value       = azurerm_network_security_group.this
}
