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
