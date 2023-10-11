output "network_id" {
  value       = module.harvester_vm_network.network_name
  description = "The name of the network"
}

output "image_id" {
  value       = module.harvester_vm_image.image_id
  description = "The ID of the VM image"
}

output "vm_id" {
  description = "The ID of the created virtual machine"
  value       = module.harvester_vm.vm_id
}
