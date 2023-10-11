module "harvester_vm_network" {
  source               = "./modules/harvester-vm-network"
  cluster_network_name = var.cluster_network_name
  name                 = var.network_name
  namespace            = var.network_namespace
  vlan_id              = var.network_vlan_id
}

module "harvester_vm_image" {
  source       = "./modules/harvester-vm-image"
  name         = var.image_name
  namespace    = var.image_namespace
  display_name = var.image_display_name
  source_type  = var.image_source_type
  url          = var.image_url
  tags         = var.image_tags
}

module "harvester_vm" {
  source       = "./modules/harvester-vm"
  vm_image_id  = module.harvester_vm_image.image_id
  name         = var.vm_name
  hostname     = var.vm_hostname
  namespace    = var.vm_namespace
  description  = var.vm_description
  tags         = var.vm_tags
  cpu          = var.vm_cpus
  memory       = var.vm_memory
  disks        = var.vm_disks
  user_data    = var.user_data
  network_data = var.network_data
  network_name = module.harvester_vm_network.network_name
}
