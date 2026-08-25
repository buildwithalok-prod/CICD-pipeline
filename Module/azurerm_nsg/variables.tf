variable "nsgs" {
  description = "Map of Network Security Groups and security rules to create."
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    allowed_ssh_source_cidrs = optional(list(string), ["0.0.0.0/0"])
    tags                     = optional(map(string), {})
  }))
}
