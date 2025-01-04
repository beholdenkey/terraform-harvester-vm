variable "harvester_kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
}

variable "cluster_network_name" {
  description = "Cluster network name"
  type        = string
}


variable "network_vlan_id" {
  description = "VLAN ID for the network"
  type        = string
}

variable "network_name" {
  description = "Name of the network"
  type        = string
}

variable "network_namespace" {
  description = "Namespace of the network"
  type        = string
  default     = "default"
}

variable "network_route_mode" {
  description = "Route mode for the network"
  type        = string
  default     = "manual"
}

variable "network_route_cidr" {
  description = "CIDR for the network"
  type        = string
  validation {
    condition     = var.network_route_cidr != ""
    error_message = "network_route_cidr must be provided if network_route_mode is set to auto"
  }
}

variable "network_route_gateway" {
  description = "Gateway for the network"
  type        = string
  validation {
    condition     = var.network_route_gateway != ""
    error_message = "network_route_gateway must be provided if network_route_mode is set to auto"
  }
}

variable "image_name" {
  description = "The name of the OS image"
  type        = string
}

variable "image_namespace" {
  description = "The namespace where the image will reside"
  type        = string
  default     = "default"
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

# Variables for harvester_vm module
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_hostname" {
  description = "Hostname for the virtual machine"
  type        = string
}

variable "vm_namespace" {
  description = "Namespace where the VM will reside"
  type        = string
  default     = "default"
}

variable "vm_description" {
  description = "Description for the VM"
  type        = string
}

variable "vm_tags" {
  description = "Tags associated with the VM"
  type        = map(string)
  default     = {}
}

variable "vm_cpus" {
  description = "Number of CPUs for the VM"
  type        = number
}

variable "vm_memory" {
  description = "Memory allocation for the VM"
  type        = string
}

variable "vm_disks" {
  description = "List of disks for the VM"
  type = list(object({
    name        = string
    type        = optional(string)
    size        = optional(string)
    bus         = optional(string)
    boot_order  = optional(number)
    auto_delete = optional(bool)
  }))
  default = []
}


variable "user_data" {
  description = "User data for cloud-init configuration"
  type        = string
  default     = ""
}

variable "network_data" {
  description = "Network data for cloud-init configuration"
  type        = string
  default     = ""
}
