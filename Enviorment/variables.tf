variable "rgs" {
  description = "Map of resource groups to create."
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
}

variable "vnets" {
  description = "Map of virtual networks to create."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string), {})
  }))
}

variable "nsgs" {
  description = "Map of network security groups to create."
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    allowed_ssh_source_cidrs = optional(list(string), ["0.0.0.0/0"])
    tags                     = optional(map(string), {})
  }))
}

variable "subnets" {
  description = "Map of subnets to create."
  type = map(object({
    name                      = string
    resource_group_name       = string
    virtual_network_name      = string
    address_prefixes          = list(string)
    network_security_group_id = optional(string, null)
  }))
}

variable "bastions" {
  description = "Map of Azure Bastion hosts to create."
  type = map(object({
    name_prefix          = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_name          = optional(string, "AzureBastionSubnet")
    tags                 = optional(map(string), {})
  }))
}

variable "vms" {
  description = "Map of virtual machines to create."
  type = map(object({
    name_prefix          = string
    resource_group_name  = string
    location             = string
    virtual_network_name = string
    subnet_name          = string
    admin_username       = string
    admin_ssh_public_key = string
    vm_size              = optional(string, "Standard_B1ls")
    tags                 = optional(map(string), {})
  }))
}

variable "vnet_peerings" {
  description = "Map of VNet peerings to create."
  type = map(object({
    name                        = string
    resource_group_name         = string
    virtual_network_name        = string
    remote_virtual_network_name = string
  }))
}
