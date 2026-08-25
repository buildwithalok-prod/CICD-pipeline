output "vnets" {
  description = "Map of created virtual network objects keyed by map key."
  value       = azurerm_virtual_network.this
}
