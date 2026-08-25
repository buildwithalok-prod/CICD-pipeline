output "resource_groups" {
  description = "Resource group outputs map."
  value       = module.resource_group.rgs
}

output "virtual_networks" {
  description = "Virtual network outputs map."
  value       = module.virtual_network.vnets
}

output "subnets" {
  description = "Subnet outputs map."
  value       = module.subnets.subnets
}

output "nsgs" {
  description = "NSG outputs map."
  value       = module.nsg.nsgs
}

output "bastions" {
  description = "Bastion outputs map."
  value       = module.bastion.bastions
}

output "vms" {
  description = "VM outputs map."
  value       = module.vm.vms
  sensitive   = true
}

output "vnet_peerings" {
  description = "VNet peering outputs map."
  value       = module.vnet_peering.vnet_peerings
}
