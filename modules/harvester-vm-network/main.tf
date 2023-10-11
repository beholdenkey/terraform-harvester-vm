resource "harvester_network" "vm_network" {
  name      = var.name
  namespace = var.namespace
}

output "network_id" {
  value = harvester_network.vm_network.id
}
