resource "harvester_network" "vm_network" {
  name                 = var.name
  namespace            = var.namespace
  vlan_id              = var.vlan_id
  cluster_network_name = var.cluster_network_name
}
