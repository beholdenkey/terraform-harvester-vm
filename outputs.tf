output "network_id" {
  description = "The ID of the created network"
  value       = module.harvester_vm_network.network_id
}

output "image_id" {
  description = "The ID of the created image"
  value       = module.harvester_vm_image.image_id
}

output "vm_id" {
  description = "The ID of the created virtual machine"
  value       = module.harvester_vm.vm_id
}
