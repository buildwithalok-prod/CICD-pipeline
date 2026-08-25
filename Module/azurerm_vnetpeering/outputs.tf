output "vnet_peerings" {
  description = "Map of created VNet peering objects keyed by map key."
  value       = azurerm_virtual_network_peering.this
}
