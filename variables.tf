variable "network_name" {
  description = "The name of the network"
  type        = string
}

variable "network_namespace" {
  description = "The namespace of the network"
  type        = string
}

variable "image_name" {
  description = "The name of the OS image"
  type        = string
}

variable "image_namespace" {
  description = "The namespace where the image will reside"
  type        = string
}

variable "image_display_name" {
  description = "The display name for the OS image"
  type        = string
}

variable "image_source_type" {
  description = "Source type for the image (e.g., download, upload)"
  type        = string
  validation {
    condition     = var.image_source_type == "download" || var.image_source_type == "upload"
    error_message = "The source_type can only be 'download' or 'upload'."
  }
}

variable "image_url" {
  description = "URL from where the image will be downloaded"
  type        = string
}

variable "image_tags" {
  description = "Tags associated with the image"
  type        = map(string)
  default     = {}
}

variable "vm_data" {
  description = "Configuration data for the virtual machine"
  type = object({
    name        = string      # Name of the virtual machine
    hostname    = string      # Hostname for the virtual machine
    namespace   = string      # Namespace where the VM will reside
    description = string      # Description for the VM
    tags        = map(string) # Tags associated with the VM
    cpus        = number      # Number of CPUs for the VM
    memory      = string      # Memory allocation for the VM
    disks = list(object({     # List of disks for the VM
      name       = string     # Name of the disk
      size       = string     # Size of the disk
      boot_order = number     # Boot order for the disk
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
