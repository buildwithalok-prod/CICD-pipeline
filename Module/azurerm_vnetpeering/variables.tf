variable "vnet_peerings" {
  description = "Map of VNet peerings to create."
  type = map(object({
    name                        = string
    resource_group_name         = string
    virtual_network_name        = string
    remote_virtual_network_name = string
  }))
}
