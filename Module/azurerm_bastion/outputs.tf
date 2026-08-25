output "bastions" {
  description = "Map of created Azure Bastion host objects keyed by map key."
  value       = azurerm_bastion_host.this
}
