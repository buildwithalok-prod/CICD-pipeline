data "azurerm_subnet" "vm" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_network_interface" "this" {
  for_each            = var.vms
  name                = "${each.value.name_prefix}-nic"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.vm[each.key].id
    private_ip_address_allocation = "Dynamic"
  }

  tags = each.value.tags
}

resource "azurerm_linux_virtual_machine" "this" {
  for_each              = var.vms
  name                  = "${each.value.name_prefix}-vm"
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.vm_size
  admin_username        = each.value.admin_username
  network_interface_ids = [azurerm_network_interface.this[each.key].id]

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = each.value.admin_ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = each.value.tags
}
