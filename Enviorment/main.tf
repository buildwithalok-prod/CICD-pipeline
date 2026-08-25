module "resource_group" {
  source = "../Module/azurerm_resource"
  rgs    = var.rgs
}

module "virtual_network" {
  source     = "../Module/azurerm_virtual_network"
  vnets      = var.vnets
  depends_on = [module.resource_group]
}

module "nsg" {
  source     = "../Module/azurerm_nsg"
  nsgs       = var.nsgs
  depends_on = [module.resource_group]
}

module "subnets" {
  source     = "../Module/azurerm_subnet"
  subnets    = var.subnets
  depends_on = [module.virtual_network, module.nsg]
}

module "bastion" {
  source     = "../Module/azurerm_bastion"
  bastions   = var.bastions
  depends_on = [module.subnets]
}

module "vm" {
  source     = "../Module/azurerm_Virtual_machine"
  vms        = var.vms
  depends_on = [module.subnets]
}

module "vnet_peering" {
  source        = "../Module/azurerm_vnetpeering"
  vnet_peerings = var.vnet_peerings
  depends_on    = [module.virtual_network]
}
