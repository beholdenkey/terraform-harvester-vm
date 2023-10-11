resource "harvester_virtualmachine" "vm" {
  depends_on = [harvester_image.vm_image]

  name         = var.vm_data.name
  namespace    = var.vm_data.namespace
  description  = var.vm_data.description
  hostname     = var.vm_data.hostname
  tags         = var.vm_data.tags
  cpu          = var.vm_data.cpus
  memory       = var.vm_data.memory
  run_strategy = "RerunOnFailure"

  network_interface {
    name         = "nic-0"
    network_name = harvester_network.vm_network.name
  }

  dynamic "disk" {
    for_each = var.vm_data.disks
    content {
      name        = disk.value.name
      type        = "disk"
      size        = disk.value.size
      bus         = "virtio"
      boot_order  = disk.value.boot_order
      image       = harvester_image.vm_image.id
      auto_delete = true
    }
  }

  cloudinit {
    user_data    = var.user_data
    network_data = var.network_data
  }
}
