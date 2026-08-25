data "azurerm_virtual_network" "remote" {
  for_each            = var.vnet_peerings
  name                = each.value.remote_virtual_network_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_virtual_network_peering" "this" {
  for_each = var.vnet_peerings

  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  virtual_network_name         = each.value.virtual_network_name
  remote_virtual_network_id    = data.azurerm_virtual_network.remote[each.key].id
  allow_forwarded_traffic      = true
  allow_virtual_network_access = true
  use_remote_gateways          = false
}
