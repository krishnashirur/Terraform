variable "environment" {
  description = "The environment type."
  type        = string
  default     = "staging"
}

variable "storage_disk_size" {
  description = "The size of the storage disk in GB."
  type        = number
  default     = 80
}

variable "delete_storage_disk_on_termination" {
  description = "Whether to delete the storage disk when the VM is deleted."
  type        = bool
  default     = false
}

variable "allowed_locations" {
  description = "The allowed locations for the resources."
  type        = list(string)
  default     = ["East US", "West Europe", "North Europe"]
}

variable "allowed_tags" {
  description = "The allowed tags for the resources."
  type        = map(string)
  default     = {
    "environment" = "dev"
    "managed_by"  = "terraform"
    "department"  = "devops"
  }
}


#Set type - Only Unique values are allowed in a set. Duplicates will be removed automatically.
variable "allowed_vm_sizes" {
  type        = list(string)
  description = "Allowed VM sizes"
  default     = ["Standard_DS1_v2", "Standard_DS2_v2", "Standard_DS3_v2"]
}

# Object type - a structured collection of named attributes, each with its own type.
# Object type
variable "vm_config" {
  type = object({
    size         = string
    publisher    = string
    offer        = string
    sku          = string
    version      = string
  })
  description = "Virtual machine configuration"
  default = {
    size         = "Standard_DS1_v2"
    publisher    = "Canonical"
    offer        = "0001-com-ubuntu-server-jammy"
    sku          = "22_04-lts"
    version      = "latest"
  }
}

# Tuple type
variable "network_config" {
  type        = tuple([string, string, number])
  description = "Network configuration (VNET address, subnet address, subnet mask)"
  default     = ["10.0.0.0/16", "10.0.2.0", 24]
}