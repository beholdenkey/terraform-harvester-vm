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
    name        = string # Name of the disk
    type        = string # Type of the disk
    size        = string # Size of the disk
    bus         = string # Bus type of the disk
    boot_order  = number # Boot order for the disk
    auto_delete = bool   # Auto delete flag for the disk
  }))
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
