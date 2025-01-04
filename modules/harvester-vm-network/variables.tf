variable "vlan_id" {
  description = "VLAN ID for the network"
  type        = string
}

variable "cluster_network_name" {
  description = "Cluster network name"
  type        = string
}

variable "name" {
  description = "Name of the network"
  type        = string
}

variable "namespace" {
  description = "Namespace of the network"
  type        = string
  default     = "default"
}

variable "route_mode" {
  description = "Route mode for the network"
  type        = string
  default     = "manual"
}

variable "route_cidr" {
  description = "CIDR for the network"
  type        = string
  validation {
    condition     = var.route_cidr != ""
    error_message = "route_cidr must be provided"
  }
}

variable "route_gateway" {
  description = "Gateway for the network"
  type        = string
  validation {
    condition     = var.route_gateway != ""
    error_message = "route_gateway must be provided"
  }
}
