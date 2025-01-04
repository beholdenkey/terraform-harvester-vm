resource "harvester_network" "vm_network" {
  name                 = var.name
  namespace            = var.namespace
  cluster_network_name = var.cluster_network_name
  vlan_id              = var.vlan_id
  route_mode           = var.route_mode
  route_gateway        = var.route_gateway
  route_cidr           = var.route_cidr
}
