resource "harvester_virtualmachine" "vm" {
  name         = var.name
  namespace    = var.namespace
  description  = var.description
  hostname     = var.hostname
  tags         = var.tags
  cpu          = var.cpu
  memory       = var.memory
  run_strategy = "RerunOnFailure"

  network_interface {
    name         = "nic-0"
    network_name = var.network_name
  }

  dynamic "disk" {
    for_each = var.disks
    content {
      name        = disk.value.name
      type        = disk.value.type
      size        = disk.value.size
      bus         = disk.value.bus
      boot_order  = disk.value.boot_order
      image       = var.vm_image_id
      auto_delete = disk.value.auto_delete
    }
  }

  cloudinit {
    user_data    = var.user_data
    network_data = var.network_data
  }
}
