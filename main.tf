module "harvester_vm_network" {
  source    = "./modules/harvester-vm-network"
  name      = var.network_name
  namespace = var.network_namespace
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
  vm_data      = var.vm_data
  user_data    = var.user_data
  network_data = var.network_data
}
