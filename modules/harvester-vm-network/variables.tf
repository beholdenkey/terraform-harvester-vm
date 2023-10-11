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
