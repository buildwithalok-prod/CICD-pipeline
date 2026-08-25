output "subnets" {
  description = "Map of created subnet objects keyed by map key."
  value       = azurerm_subnet.this
}
