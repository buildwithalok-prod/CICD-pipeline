output "vms" {
  description = "Map of created virtual machine objects keyed by map key."
  value       = azurerm_linux_virtual_machine.this
}

output "nics" {
  description = "Map of created network interface objects keyed by map key."
  value       = azurerm_network_interface.this
}
