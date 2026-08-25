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
