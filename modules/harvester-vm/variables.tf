variable "name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "namespace" {
  description = "Namespace of the virtual machine"
  type        = string
}

variable "description" {
  description = "Description of the virtual machine"
  type        = string
}

variable "hostname" {
  description = "Hostname of the virtual machine"
  type        = string
}

variable "tags" {
  description = "Tags for the virtual machine"
  type        = map(string)
  default     = {}
}

variable "cpu" {
  description = "CPU cores for the virtual machine"
  type        = number
}

variable "memory" {
  description = "Memory for the virtual machine (e.g., 2048M or 2G)"
  type        = string
}

variable "network_name" {
  description = "Name of the network for the virtual machine"
  type        = string
}

variable "disks" {
  description = "List of disks for the virtual machine"
  type = list(object({
    name        = string
    type        = string
    size        = string
    bus         = string
    boot_order  = number
    auto_delete = bool
  }))
  default = []
}

variable "vm_image_id" {
  description = "The ID of the VM image"
  type        = string
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
