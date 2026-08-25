resource "azurerm_subnet" "this" {
  for_each = var.subnets

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = {
    for k, v in var.subnets : k => v if v.network_security_group_id != null
  }

  subnet_id                 = azurerm_subnet.this[each.key].id
  network_security_group_id = each.value.network_security_group_id
}
