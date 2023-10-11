variable "vm_data" {
  description = "Configuration data for the virtual machine"
  type = object({
    name        = string
    namespace   = string
    description = string
    hostname    = string
    tags        = map(string)
    cpus        = number
    memory      = string
    disks = list(object({
      name       = string
      size       = string
      boot_order = number
    }))
  })
}

variable "user_data" {
  description = "User data for cloud-init configuration"
  type        = string
}

variable "network_data" {
  description = "Network data for cloud-init configuration"
  type        = string
  default     = ""
}

variable "vm_image_id" {
  description = "The ID of the VM image"
  type        = string
}

variable "network_name" {
  description = "The name of the network"
  type        = string
}
