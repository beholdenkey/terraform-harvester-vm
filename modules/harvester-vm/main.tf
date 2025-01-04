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
      type        = lookup(disk.value, "type", null)
      size        = lookup(disk.value, "size", null)
      bus         = lookup(disk.value, "bus", "virtio")
      boot_order  = lookup(disk.value, "boot_order", null)
      image       = var.vm_image_id
      auto_delete = lookup(disk.value, "auto_delete", "true")
    }
  }

  dynamic "cloudinit" {
    for_each = length(var.user_data) > 0 || length(var.network_data) > 0 ? [1] : []
    content {
      user_data    = var.user_data
      network_data = var.network_data
    }
  }
}
