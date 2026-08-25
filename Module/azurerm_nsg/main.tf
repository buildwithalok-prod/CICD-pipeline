resource "azurerm_network_security_group" "this" {
  for_each = var.nsgs

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}

locals {
  nsg_rules = flatten([
    for nsg_key, nsg in var.nsgs : [
      for idx, cidr in nsg.allowed_ssh_source_cidrs : {
        rule_key            = "${nsg_key}-ssh-${idx}"
        nsg_key             = nsg_key
        nsg_name            = nsg.name
        resource_group_name = nsg.resource_group_name
        priority            = 100 + idx
        cidr                = cidr
      }
    ]
  ])
}

resource "azurerm_network_security_rule" "ssh" {
  for_each = {
    for rule in local.nsg_rules : rule.rule_key => rule
  }

  name                        = "allow-ssh-${each.value.priority}"
  priority                    = each.value.priority
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = each.value.cidr
  destination_address_prefix  = "*"
  resource_group_name         = each.value.resource_group_name
  network_security_group_name = azurerm_network_security_group.this[each.value.nsg_key].name
}
